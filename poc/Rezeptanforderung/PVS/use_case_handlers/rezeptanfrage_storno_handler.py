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


class RezeptanfrageStornoHandler:
    def __init__(self, sender, source) -> None:
        self.sender = sender
        self.source = source

    def handle(self, bundle_content: BundleContent) -> Bundle:
        service_request: ServiceRequest = self.get_resource_by_type(bundle_content.bundle_entries, ServiceRequest)
        if service_request.status == "revoked":
            reason_code = self.get_storno_reason_code(service_request)
            identifier = self.extract_identifiers(service_request)
            print(f"Rezeptanforderung mit Vorgangs-Id '{identifier['https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier']}' wurde storniert. Begründung '{reason_code}'")
            return None

    def get_resource_by_type(self, bundle_entries: List[BundleEntry], type: Type) -> Union[ServiceRequest, MedicationRequest, Medication, Organization]:
        return next((entry for entry in bundle_entries if isinstance(entry, type)), None)
    
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
    


  
