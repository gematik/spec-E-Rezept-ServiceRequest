from typing import List, Type, Union
from uuid import uuid4
from app_transport_framework_library.models.bundle_content import BundleContent
from app_transport_framework_library.models.message_to_send import MessageToSend
from fhir.resources.bundle import Bundle, BundleEntry
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.medication import Medication
from fhir.resources.medicationrequest import MedicationRequest
from fhir.resources.organization import Organization
from fhir.resources.patient import Patient
from fhir.resources.extension import Extension
from fhir.resources.identifier import Identifier
from fhir.resources.reference import Reference
from example_helper.fachdienst_mock import FachdienstMock
from PVS.ressource_creators.medication_prescription_converter import MedicationRequestConverter
from PVS.ressource_creators.practitioner_creator import PractitionerCreator
from PVS.ressource_creators.coverage_creator import CoverageCreator
from PVS.ressource_creators.patient_creator import PatientCreator
from example_helper.participants_mock import ParticipantsCreator
from PVS.ressource_creators.message_container_creator import MessageContainerCreator


class RezeptanfrageHandler:
    def __init__(self, sender, source) -> None:
        self.sender = sender
        self.source = source
        self.fachdienst_mock = FachdienstMock()
        self.medication_request_converter = MedicationRequestConverter()
        self.practitioner = PractitionerCreator().get_example_practitioner()
        self.coverage_creator = CoverageCreator()

    def handle(self, bundle_content: BundleContent) -> Bundle:
        response_bundle_entries = []
        service_request: ServiceRequest = self.get_resource_by_type(bundle_content.bundle_entries, ServiceRequest)
        if service_request.status != "active":
            return None
        delivery_type = self.get_order_detail_code(service_request)
        if delivery_type == 'issue-prescription':
            self.handle_issue_prescription(bundle_content.bundle_entries)

        elif delivery_type == 'return-to-requester':
            response_service_request, response_bundle_entries = self.handle_return_to_requester(bundle_content.bundle_entries)
            #TODO: Also Store the display_name and endpoint from messageHeader  in BundleContent
            destinations = ParticipantsCreator.create_destinations(bundle_content.sender, "Pflegeeinrichtung Immergrün", "https://ps_solutions.com/jira_helpdesk")
            response_bundle = MessageContainerCreator.create_prescription_request_response(str(uuid4()), self.sender, self.source, destinations, response_service_request, response_bundle_entries)
            return response_bundle

        else:
            raise ValueError(f'Unbekannter Zustelltyp: {delivery_type}')

    def handle_issue_prescription(self, bundle_entries: List[BundleEntry]):
        service_request: ServiceRequest = self.get_resource_by_type(bundle_entries, ServiceRequest)
        service_request.status = 'completed'

    def handle_return_to_requester(self, bundle_entries: List[BundleEntry]) -> tuple[ServiceRequest, List[BundleEntry]]:
        service_request: ServiceRequest = self.get_resource_by_type(bundle_entries, ServiceRequest)
        medication_request: MedicationRequest = self.get_resource_by_type(bundle_entries, MedicationRequest)
        medication: Medication = self.get_resource_by_type(bundle_entries, Medication)
        patient: Patient = PatientCreator.get_example_patient()
        coverage = self.coverage_creator.get_example_coverage()

        kbv_prescription = self.medication_request_converter.get_example_conversion(
            medication_request, medication.id, patient.id, self.practitioner.id, coverage.id)
        response_service_request = self.update_service_request(service_request, kbv_prescription.id)
        request_organisation = self.get_resource_by_type(bundle_entries, Organization)
        return response_service_request, self.build_response_bundle_entries(kbv_prescription, medication, patient, coverage, request_organisation, response_service_request)

    def update_service_request(self, service_request: ServiceRequest, kbv_prescription_id) -> ServiceRequest:
        service_request.status = 'completed'
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
        service_request.basedOn = [Reference(reference=kbv_prescription_id)]

        return service_request

    def build_response_bundle_entries(self, kbv_prescription, medication, patient, coverage,request_organisation, response_service_request ):
        response_bundle_entries = []
        response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{kbv_prescription.id}", resource=kbv_prescription))
        response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{medication.id}", resource=medication))
        response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{self.practitioner.id}", resource=self.practitioner))
        response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{patient.id}", resource=patient))
        response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{coverage.id}", resource=coverage))
        response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{request_organisation.id}", resource=request_organisation))
        response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{response_service_request.id}", resource=response_service_request))

        return response_bundle_entries

    def get_resource_by_type(self, bundle_entries: List[BundleEntry], type: Type) -> Union[ServiceRequest, MedicationRequest, Medication, Organization]:
        return next((entry for entry in bundle_entries if isinstance(entry, type)), None)

    def get_order_detail_code(self, service_request: ServiceRequest):
        for detail in service_request.orderDetail:
            for coding in detail.coding:
                if coding.system == 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/prescription-fullfillment-type-cs':
                    return coding.code
        return None
    
    def get_storno_reason_code(self, service_request: ServiceRequest):
        for detail in service_request.reasonCode:
            for coding in detail.coding:
                if coding.system == 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/cancellation-reason-cs':
                    return coding.code
        return None
    
    def extract_identifiers(self, service_request: ServiceRequest):
        identifier_dict = {}
        for identifier in service_request.identifier:
            if identifier.system == "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier":
                identifier_dict["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"] = identifier.value
            elif identifier.system == "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier":
                identifier_dict["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier"] = identifier.value
        if service_request.id:
            identifier_dict["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"] = service_request.id
        return identifier_dict
    


  
