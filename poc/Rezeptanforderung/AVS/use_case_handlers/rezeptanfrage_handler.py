from typing import List
from app_transport_framework_library.models.bundle_focus_content import (
    BundleFocusContent,
)
from fhir.resources.bundle import BundleEntry
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.extension import Extension
from fhir.resources.identifier import Identifier
from fhir.resources.medication import Medication
from fhir.resources.medicationrequest import MedicationRequest
from example_helper.fachdienst_mock import FachdienstMock
from AVS.ressource_creators.medication_prescription_converter import MedicationRequestConverter
from AVS.ressource_creators.practitioner_creator import PractitionerCreator
from AVS.ressource_creators.coverage_creator import CoverageCreator
from fhir.resources.reference import Reference


class RezeptanfrageHandler:
    def __init__(self) -> None:
        self.fachdienst_mock = FachdienstMock()
        self.medication_request_converter = MedicationRequestConverter()
        self.practitioner = PractitionerCreator().get_example_practitioner()
        self.coverage_creator = CoverageCreator()

    def handle(self, bundle_focus_content: BundleFocusContent) -> BundleFocusContent:
        service_request: ServiceRequest = self.get_ressource_by_type(
            bundle_focus_content.bundle_entries, ServiceRequest
        )
        delivery_type = self.get_order_detail_code(service_request.orderDetail)
        medication_request: MedicationRequest = self.get_ressource_by_type(
            bundle_focus_content.bundle_entries, MedicationRequest
        )

        medication: Medication = self.get_ressource_by_type(
            bundle_focus_content.bundle_entries, Medication
        )

        if delivery_type == 'issue-prescription':
            self.handle_issue_prescription(service_request)

        elif delivery_type == 'return-to-requester':
            coverage = self.coverage_creator.get_example_coverage()
            kbv_prescription = self.medication_request_converter.get_example_conversion(
                medication_request,medication.id, self.practitioner.id, coverage.id)
            print(kbv_prescription.json(indent=4))

            response_service_request = self.handle_return_to_requester(service_request)
            response_service_request.basedOn = [Reference(reference=kbv_prescription.id)]



        elif delivery_type == 'send-to-pharmacy':
            self.handle_send_to_pharmacy(service_request)

        else:
            raise ValueError(f'Unbekannter Zustelltyp: {delivery_type}')

    def handle_issue_prescription(self, service_request):
        # Arzt erstellt und signiert das Rezept und setzt es im E-Rezept-Fachdienst ein
        service_request.status = 'completed'
        # .basedOn = KBV_PR_ERP_Prescription (ersetzt den initialen MedicationRequest)
        # ServiceRequest zurückschicken

    def handle_return_to_requester(self, service_request: ServiceRequest) -> ServiceRequest:
        service_request.status = 'completed'
        # Arzt erstellt, signiert das Rezept und setzt es im E-Rezept-Fachdienst ein, er erhält PrescriptionID und den AccessCode
        e_prescription_token = self.fachdienst_mock.activate()
        if service_request.extension is None:
            service_request.extension = []
        service_request.extension.append(
            Extension(
                url="https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex",
                valueIdentifier=Identifier(
                    system="https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken",
                    value=e_prescription_token
                )
            )
        )

        return service_request

        # .basedOn = KBV_PR_ERP_Prescription (ersetzt den initialen MedicationRequest)
        # ServiceRequest zurückschicken

    def handle_send_to_pharmacy(self, service_request):
        # Arzt erstellt, signiert das Rezept und setzt es im E-Rezept-Fachdienst ein
        service_request.status = '#completed'
        # Hier muss zusätzliche Logik implementiert werden, um eine Belieferungsanfrage zu senden
        # ServiceRequest zurückschicken

    def get_ressource_by_type(self, bundle_entries: List[BundleEntry], type):
        return next((entry for entry in bundle_entries if isinstance(entry, type)), None)

    def get_order_detail_code(self, order_details):
        for detail in order_details:
            for coding in detail.coding:
                if coding.system == 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/prescription-fullfillment-type-cs':
                    return coding.code
        return None
