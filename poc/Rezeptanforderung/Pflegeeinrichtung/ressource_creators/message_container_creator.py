from typing import List
from fhir.resources.bundle import Bundle, BundleEntry
from fhir.resources.fhirtypes import ReferenceType
from fhir.resources.messageheader import MessageHeaderDestination, MessageHeaderSource
from fhir.resources.servicerequest import ServiceRequest
from app_transport_framework_library.ressource_creators.message_header_creator import (
    MessageHeaderCreator,
)

from app_transport_framework_library.ressource_creators.message_bundle_creator import (
    MessageBundleCreator,
)


class MessageContainerCreator:
    def __init__(self) -> None:
        pass

    def create_request_bundle(
        message_id: str,
        sender: ReferenceType,
        source: MessageHeaderSource,
        destinations: List[MessageHeaderDestination],
        service_request: ServiceRequest,
        additional_bundle_entries: List[BundleEntry],
        code_system: str,
        use_case: str,
        use_case_display: str
    ) -> Bundle:
        message_header = MessageHeaderCreator.create_message_header(
            message_id,
            sender,
            source,
            destinations,
            code_system,
            use_case,
            use_case_display,
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