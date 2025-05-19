import logging
import sys
import os
from typing import List
from uuid import uuid4

from helper.ressource_creators.message_header_creator import MessageHeaderCreator
from helper.ressource_creators.message_bundle_creator import MessageBundleCreator
from helper.ressource_creators.participant_creator import ParticipantsCreator
from helper.ressource_creators.bundle_creator import BundleCreator
from helper.app_transport_framework.atf_helper import ATFHelper


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
from helper.kim_client import KIMClient
from helper.fhir_attachment_handler import FHIRAttachmentHandler
from helper.fhir_bundle_processor import FHIR_Bundle_Processor
from helper.ressource_creators.patient_creator import PatientCreator
from helper.ressource_creators.coverage_creator import CoverageCreator
from helper.ressource_creators.medication_prescription_converter import (
    MedicationRequestConverter,
)
from helper.ressource_creators.practitioner_creator import PractitionerCreator
from helper.fachdienst_mock import FachdienstMock
from helper.file_handler import FileHandler
from helper.renderer.html_renderer import HTMLRenderer


from fhir.resources.R4B.messageheader import MessageHeader
from fhir.resources.R4B.bundle import Bundle, BundleEntry
from fhir.resources.R4B.servicerequest import ServiceRequest
from fhir.resources.R4B.medication import Medication
from fhir.resources.R4B.medicationrequest import MedicationRequest
from fhir.resources.R4B.organization import Organization
from fhir.resources.R4B.patient import Patient
from fhir.resources.R4B.extension import Extension
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.reference import Reference
from fhir.resources.R4B.fhirtypes import ReferenceType
from fhir.resources.R4B.operationoutcome import OperationOutcomeIssue
from fhir.resources.R4B.messageheader import (
    MessageHeaderDestination,
    MessageHeaderSource,
)

logger = logging.getLogger("Arztpraxis")


class PvsKIMClient(KIMClient):
    def __init__(
        self,
        client_name,
        sender_info,
    ):
        logger.debug(f"PvsKIMClient für {client_name} initialisiert.")
        super().__init__(client_name, sender_info)
        self.software_info = {
            "name": "DeltaCare Inc.",
            "product": "PraxisFix",
            "version": "1.3.2",
            "email": "issues@praxisfix-deltacare.de",
            "endpoint": "https://deltacare.de/praxisfix/issues",
        }
        self.atf_helper = ATFHelper(
            sender_info=self.sender_info, source_info=self.software_info
        )
        self.fhir_bundle_processor = FHIR_Bundle_Processor()
        self.coverage_creator = CoverageCreator()
        self.medication_request_converter = MedicationRequestConverter()
        self.practitioner = PractitionerCreator().get_example_practitioner()
        self.fachdienst_mock = FachdienstMock()
        self.html_renderer = HTMLRenderer()
        self.file_handler = FileHandler(self.attachment_folder, self.html_renderer)

    def send_empfangsbestätigung(self, message_header, issues):
        message_to_send = self.atf_helper.create_empfangsbestätigung(
            message_header, issues
        )

        attachment, html = self.file_handler.create_file(message_to_send.atf_bundle, message_to_send.message_type)
        self.send_message(
            message_header.sender.display,
            message_to_send.message_type,
            "Empfangsbestätigung",
            html,
            attachment
        )
        

    def process_message(self, message_content):
        FileAttachmentHandler = FHIRAttachmentHandler(message_content["attachments"])
        fhir_bundle = FileAttachmentHandler.get_fhir_bundle()

        if fhir_bundle:
            try:
                self.handle_message_event(fhir_bundle)
            except Exception as e:
                logger.error("Fehler bei der Nachrichtverarbeitung: %s", str(e))
                self.send_empfangsbestätigung(
                    message_header=fhir_bundle.entry[0].resource,
                    issues=[
                        OperationOutcomeIssue(
                            severity="error", code="processing", diagnostics=str(e)
                        )
                    ],
                )
        else:
            logger.error("FHIR Bundle konnte nicht verarbeitet werden.")
            # Send an error reception confirmation if FHIR Bundle processing fails
            self.send_empfangsbestätigung(
                message_header=None,
                issues=[
                    OperationOutcomeIssue(
                        severity="error",
                        code="invalid",
                        diagnostics="FHIR Bundle ist ungültig oder fehlend",
                    )
                ],
            )
        return

    def handle_message_event(self, atf_request_bundle: Bundle):
        logger.debug("Empfangene Nachricht durch Arzt: %s", atf_request_bundle)
        message_header = self.fhir_bundle_processor.extract_message_header(
            atf_request_bundle
        )

        if message_header.eventCoding.code == "eRezept_Rezeptanforderung;Rezeptanfrage":
            if self.validate_prescription_request(message_header, atf_request_bundle):
                # Send a positive confirmation
                self.send_empfangsbestätigung(
                    message_header=message_header,
                    issues=[
                    OperationOutcomeIssue(
                        severity="information",
                        code="informational",
                        diagnostics="Nachricht erfolgreich validiert",
                    )
                ]
                )
                self.process_prescription_request(message_header, atf_request_bundle)
            else:
                # Error confirmation sent by validate_prescription_request on failure
                pass
        else:
            logger.warning(
                f"Unbekannter EventCode: {message_header.eventCoding.code}. Keine spezifische Verarbeitung definiert."
            )

    def validate_prescription_request(self, message_header, atf_request_bundle):
        """
        Validiert die Rezeptanforderung.
        """
        logger.info("Validierung der Rezeptanforderung begonnen.")
        service_request = self.fhir_bundle_processor.get_resource_by_type(
            atf_request_bundle.entry, ServiceRequest
        )

        if not service_request or service_request.status != "active":
            logger.error("Service Request ist nicht aktiv oder fehlt.")
            self.send_empfangsbestätigung(
                message_header=message_header,
                issues=[
                    OperationOutcomeIssue(
                        severity="error",
                        code="processing",
                        diagnostics="Service Request ist inaktiv oder ungültig",
                    )
                ],
            )
            return False

        # Additional validation logic here as needed
        return True

    def process_prescription_request(self, message_header, atf_request_bundle):
        """
        Verarbeitet eine Rezeptanforderung.
        """
        logger.info("Rezeptanforderung erhalten.")

        if message_header.sender and message_header.sender.identifier:
            sender_email_value = message_header.sender.identifier.value
        else:
            logger.info("Keine KIM-Adresse gefunden.")

        service_request = self.fhir_bundle_processor.get_resource_by_type(
            atf_request_bundle.entry, ServiceRequest
        )
        if service_request.status != "active":
            logger.info("Service Request ist nicht aktiv")

        response_service_request, response_bundle_entries, request_organisation_id = (
            self.create_prescription(atf_request_bundle)
        )
        destinations = ParticipantsCreator.create_destination(
            message_header.sender.display, sender_email_value
        )
        source = ParticipantsCreator.create_source(
            self.software_info["name"],
            self.software_info["product"],
            self.software_info["version"],
            self.software_info["email"],
            self.software_info["endpoint"],
        )
        prescription_request_response = self.create_prescription_request_response(
            str(uuid4()),
            ParticipantsCreator.create_sender(
                self.sender_info["telematik_id"], self.sender_info["display"]
            ),
            source,
            destinations,
            response_service_request,
            response_bundle_entries,
            request_organisation_id,
        )

        attachments, html = self.file_handler.create_file(
            prescription_request_response, "atf_eRezept_Rezeptbestätigung"
        )

        # Antwort zurück an die Pflegeeinrichtung senden
        logger.info("Sende E-Rezept-Bestätigung an: %s", message_header.sender.display)
        self.send_message(
            message_header.sender.display,
            "KIM-E-Rezept-Bestätigung",
            "Rezeptbestaetigung",
            html,
            attachments,
        )

        return True

    def create_prescription(
        self, bundle_entries: List[BundleEntry]
    ) -> tuple[ServiceRequest, List[BundleEntry]]:
        service_request: ServiceRequest = (
            self.fhir_bundle_processor.get_resource_by_type(
                bundle_entries.entry, ServiceRequest
            )
        )
        medication_request: MedicationRequest = (
            self.fhir_bundle_processor.get_resource_by_type(
                bundle_entries.entry, MedicationRequest
            )
        )
        medication: Medication = self.fhir_bundle_processor.get_resource_by_type(
            bundle_entries.entry, Medication
        )
        patient: Patient = PatientCreator.get_example_patient()
        coverage = self.coverage_creator.get_example_coverage()

        kbv_prescription = self.medication_request_converter.get_example_conversion(
            medication_request,
            medication.id,
            patient.id,
            self.practitioner.id,
            coverage.id,
        )
        response_service_request = self.update_service_request(
            service_request, kbv_prescription.id, patient.id
        )
        request_organisation = self.fhir_bundle_processor.get_resource_by_type(
            bundle_entries.entry, Organization
        )
        return (
            response_service_request,
            BundleCreator.build_bundle_entries(
                [
                    kbv_prescription,
                    medication,
                    self.practitioner,
                    patient,
                    coverage,
                    request_organisation,
                ]
            ),
            request_organisation.id,
        )

    def update_service_request(
        self, service_request: ServiceRequest, kbv_prescription_id, patient_id
    ) -> ServiceRequest:
        service_request.status = "completed"
        e_prescription_token = self.fachdienst_mock.activate()
        if service_request.extension is None:
            service_request.extension = []
        service_request.extension.append(
            Extension(
                url="https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex",
                valueIdentifier=Identifier(
                    system="https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken",
                    value=e_prescription_token,
                ),
            )
        )
        service_request.basedOn = [
            Reference(reference="urn:uuid:" + kbv_prescription_id)
        ]

        service_request.subject = Reference(reference="Patient/" + patient_id)

        return service_request

    def create_prescription_request_response(
        self,
        message_id: str,
        sender: ReferenceType,
        source: MessageHeaderSource,
        destinations: List[MessageHeaderDestination],
        service_request: ServiceRequest,
        additional_bundle_entries: List[BundleEntry],
        request_organisation_id,
    ) -> Bundle:
        message_header = MessageHeaderCreator.create_message_header(
            message_id,
            sender,
            source,
            destinations,
            code_system="https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
            use_case="eRezept_Rezeptanforderung;Rezeptbestaetigung",
            use_case_display="Bestätigung und Übermittlung eines ausgestellten Rezeptes",
            requesting_organisation_id=request_organisation_id,
            focus_reference=service_request.id,
        )

        resources = [
            BundleEntry(
                fullUrl=f"urn:uuid:{service_request.id}", resource=service_request
            )
        ]

        resources.extend(additional_bundle_entries)

        bundle = MessageBundleCreator.create_message_bundle(
            message_header=message_header, resources=resources
        )

        return bundle
