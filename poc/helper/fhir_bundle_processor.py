import logging
from typing import List, Type, TypeVar, Union
from fhir.resources.R4B.bundle import Bundle, BundleEntry
from fhir.resources.R4B.servicerequest import ServiceRequest
from fhir.resources.R4B.medication import Medication
from fhir.resources.R4B.medicationrequest import MedicationRequest
from fhir.resources.R4B.organization import Organization
from fhir.resources.R4B.patient import Patient
from fhir.resources.R4B.extension import Extension
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.reference import Reference
from fhir.resources.R4B.messageheader import MessageHeader

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

T = TypeVar('T')

class FHIR_Bundle_Processor:
    def __init__(self):
        pass

    def get_resource_by_type(self, bundle_entries: List[BundleEntry], resource_type: Type[T]) -> Union[T, None]:
        return next(
            (entry.resource for entry in bundle_entries if isinstance(entry.resource, resource_type)),
            None,
        )
    
    def extract_message_header(self, atf_request_bundle: Bundle):
        message_header = self.get_resource_by_type(atf_request_bundle.entry, MessageHeader)

        if message_header is None:
            logger.error(
                "Die empfangene Nachricht ist keine gültige ATF-Nachricht. Ein MessageHeader fehlt."
            )
            return

        return message_header
    
    def get_token_from_service_request(self, service_request: ServiceRequest):
        token_url = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex"
        token_system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken"
        for extension in service_request.extension:
            if (
                extension.url == token_url
                and extension.valueIdentifier.system == token_system
            ):
                return extension.valueIdentifier.value
        return None