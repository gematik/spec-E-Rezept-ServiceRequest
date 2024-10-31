import logging
import sys
import os
from typing import List
from uuid import uuid4




sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
from helper.kim_client import KIMClient
from helper.logging_setup import setup_logger
from helper.fhir_bundle_processor import FHIR_Bundle_Processor
from helper.ressource_creators.medication_dispense_creator import (
    MedicationDispenseCreator,
)
from helper.ressource_creators.message_header_creator import MessageHeaderCreator
from helper.ressource_creators.message_bundle_creator import MessageBundleCreator
from helper.ressource_creators.bundle_creator import BundleCreator
from helper.ressource_creators.participant_creator import ParticipantsCreator
from helper.ressource_creators.organization_creator import OrganizationCreator
from helper.file_handler import FileHandler
from helper.renderer.html_renderer import HTMLRenderer

from fhir.resources.R4B.bundle import Bundle
from fhir.resources.R4B.servicerequest import ServiceRequest
from fhir.resources.R4B.bundle import Bundle, BundleEntry
from fhir.resources.R4B.fhirtypes import ReferenceType
from fhir.resources.R4B.patient import Patient

from fhir.resources.R4B.messageheader import (
    MessageHeaderDestination,
    MessageHeaderSource,
)
from fhir.resources.R4B.servicerequest import ServiceRequest

# Logger für die Apotheke einrichten
logger = setup_logger("Apotheke_C", level=logging.INFO)


class PharmacyKIMClient(KIMClient):
    def __init__(self, client_name, sender_info):
        super().__init__(client_name, sender_info)
        self.fhir_bundle_processor = FHIR_Bundle_Processor()
        self.html_renderer = HTMLRenderer()
        self.file_handler = FileHandler(self.attachment_folder, self.html_renderer)
        self.software_info = {
            "name": "ApoSoft Gmbh",
            "product": "ApoFlott",
            "version": "1.1.3",
            "email": "issues@apo-flott.de",
            "endpoint": "https://aposoft.de/issues",
        }
        self.source = ParticipantsCreator.create_source(
            self.software_info["name"],
            self.software_info["product"],
            self.software_info["version"],
            self.software_info["email"],
            self.software_info["endpoint"],
        )

    def process_message(self, message_content):
        logger.debug("Empfangene Nachricht durch Apotheke: %s", message_content)
        return

    def handle_message_event(self, atf_request_bundle: Bundle):
        logger.info("Apotheke hat einen Abgabeanfrage erhalten")

        message_header = self.fhir_bundle_processor.extract_message_header(
            atf_request_bundle
        )

        dispense_service_request: ServiceRequest = (
            self.fhir_bundle_processor.get_resource_by_type(
                atf_request_bundle.entry, ServiceRequest
            )
        )

        patient: Patient = self.fhir_bundle_processor.get_resource_by_type(atf_request_bundle.entry, Patient)

        if message_header.sender and message_header.sender.identifier:
            sender_email_value = message_header.sender.identifier.value
        else:
            logger.info("Keine KIM-Adresse gefunden.")

        destinations = ParticipantsCreator.create_destination(
            message_header.sender.display, sender_email_value
        )

        medication_dispense = (
            MedicationDispenseCreator.get_example_medication_dispense()
        )
        completed_dispense_service_request = self.update_dispense_request(
            dispense_service_request
        )


        requesting_organisation = OrganizationCreator.get_example_apotheken_organization()
        

        dispense_additional_bundle_entries = BundleCreator.build_bundle_entries(
            [completed_dispense_service_request, medication_dispense, patient, requesting_organisation]
        )



        response_bundle = self.create_response_dispense_request(
            str(uuid4()),
            ParticipantsCreator.create_sender(
                self.sender_info["telematik_id"], self.sender_info["display"]
            ),
            self.source,
            destinations,
            dispense_service_request,
            requesting_organisation.id,
            additional_bundle_entries=dispense_additional_bundle_entries
        )

        attachments, html = self.file_handler.create_files(response_bundle, "atf_eRezept_Abgabebestaetigung")

        # Sende Abgabeanfrage an Apotheke
        self.send_message(
            message_header.sender.display,
            "KIM-Abgabebestaetigung",
            "Abgabebestaetigung",
            html,
            attachments,
        )

        return response_bundle

    def update_dispense_request(self, dispense_service_request: ServiceRequest):
        dispense_service_request.extension = []
        dispense_service_request.status = "completed"
        return dispense_service_request

    def create_response_dispense_request(
        self,
        message_id: str,
        sender: ReferenceType,
        source: MessageHeaderSource,
        destinations: List[MessageHeaderDestination],
        service_request: ServiceRequest,
        requesting_organisation_id,
        additional_bundle_entries: List[BundleEntry],
    ) -> Bundle:
        message_header = MessageHeaderCreator.create_message_header(
            message_id,
            sender,
            source,
            destinations,
            code_system="https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
            use_case="eRezept_Rezeptanforderung;Abgabebestaetigung",
            use_case_display="Bestätigung der Erfüllung und Abgabe eines Medikamentes",
            requesting_organisation_id=requesting_organisation_id,
            focus_reference=service_request.id,
        )

        resources = [
            
        ]

        resources.extend(additional_bundle_entries)

        bundle = MessageBundleCreator.create_message_bundle(
            message_header=message_header, resources=resources
        )

        return bundle
