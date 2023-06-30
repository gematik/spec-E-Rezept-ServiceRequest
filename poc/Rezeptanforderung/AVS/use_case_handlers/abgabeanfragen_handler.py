from typing import List, Type
from uuid import uuid4
from app_transport_framework_library.models.bundle_content import BundleContent
from fhir.resources.bundle import Bundle, BundleEntry
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.medicationrequest import MedicationRequest
from fhir.resources.medication import Medication
from fhir.resources.coverage import Coverage
from fhir.resources.patient import Patient
from fhir.resources.practitioner import Practitioner
from fhir.resources.organization import Organization
from AVS.ressource_creators.medication_dispense_creator import MedicationDispenseCreator

from AVS.ressource_creators.messageContainerCreator import MessageContainerCreator
from example_helper.participants_mock import ParticipantsCreator

class AbgabeanfragenHandler:
    def __init__(self, sender, source) -> None:
        self.sender = sender
        self.source = source

    def handle(self, bundle_content: BundleContent) -> Bundle:
        dispense_service_request: ServiceRequest = self.get_resource_by_type(bundle_content.bundle_entries, ServiceRequest)
      
        token = self.get_token_from_service_request(dispense_service_request)
        if token is not None:
            print(token)
        #TODO: Also Store the display_name and endpoint from messageHeader  in BundleContent
        destinations = ParticipantsCreator.create_destinations(bundle_content.sender, "Pflegeeinrichtung Immergrün", "https://ps_solutions.com/jira_helpdesk")
        medication_dispense =  MedicationDispenseCreator.get_example_medication_dispense()
        completed_dispense_service_request = self.update_dispense_request(dispense_service_request)
        build_entries = [completed_dispense_service_request, medication_dispense]

        dispense_additional_bundle_entries = BundleBuilder.build_entries(build_entries)
        response_bundle = MessageContainerCreator.create_response_dispense_request(str(uuid4()), self.sender, self.source, destinations, dispense_service_request, dispense_additional_bundle_entries)
        return response_bundle
    
    def update_dispense_request(self, dispense_service_request: ServiceRequest):
        dispense_service_request.extension = []
        dispense_service_request.status = "completed"
        return dispense_service_request


    def get_token_from_service_request(self, service_request: ServiceRequest):
        token_url = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex"
        token_system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken"
        if service_request.extension is None:
            return None
        for extension in service_request.extension:
            if extension.url == token_url and extension.valueIdentifier.system == token_system:
                return extension.valueIdentifier.value
        return None
    
    def get_resource_by_type(self, bundle_entries: List[BundleEntry], type: Type) -> ServiceRequest:
        return next((entry for entry in bundle_entries if isinstance(entry, type)), None)
    
class BundleBuilder:
    @staticmethod
    def build_entries( resource_list ):
        response_bundle_entries = []
        for resource in resource_list:
            response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{resource.id}", resource=resource))

        return response_bundle_entries