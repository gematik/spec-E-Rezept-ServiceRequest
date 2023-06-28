from typing import List, Type
from app_transport_framework_library.models.bundle_content import BundleContent
from app_transport_framework_library.models.message_to_send import MessageToSend
from fhir.resources.bundle import BundleEntry
from fhir.resources.servicerequest import ServiceRequest
class RezeptbestaetigungHandler:
    def __init__(self, sender, source) -> None:
        self.sender = sender
        self.source = source

    def handle(self, bundle_content: BundleContent) -> bool:
        service_request: ServiceRequest = self.get_resource_by_type(bundle_content.bundle_entries, ServiceRequest)
        token = self.get_token_from_service_request(service_request)
        if token is not None:
            return True
        return False

    def get_token_from_service_request(self, service_request: ServiceRequest):
        token_url = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex"
        token_system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken"
        for extension in service_request.extension:
            if extension.url == token_url and extension.valueIdentifier.system == token_system:
                return extension.valueIdentifier.value
        return None
    
    def get_resource_by_type(self, bundle_entries: List[BundleEntry], type: Type) -> ServiceRequest:
        return next((entry for entry in bundle_entries if isinstance(entry, type)), None)