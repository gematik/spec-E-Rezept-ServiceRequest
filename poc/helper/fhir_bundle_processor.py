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

    def get_message_header(self, parsed_bundle: Bundle):
        return next(
            (
                entry.resource
                for entry in parsed_bundle.entry
                if isinstance(entry.resource, MessageHeader)
            ),
            None,
        )