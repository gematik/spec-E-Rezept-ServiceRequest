from typing import List
from fhir.resources.R4B.bundle import Bundle, BundleEntry
from fhir.resources.R4B.fhirtypes import ReferenceType
from fhir.resources.R4B.messageheader import MessageHeaderDestination, MessageHeaderSource
from fhir.resources.R4B.servicerequest import ServiceRequest
from helper.ressource_creators.message_header_creator import MessageHeaderCreator
from helper.ressource_creators.message_bundle_creator import MessageBundleCreator



class BundleCreator:
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
        # Überprüfen, dass der 'sender' ein valid ReferenceType Objekt ist
        if not isinstance(sender, ReferenceType):
            raise ValueError("Sender must be a Reference object")

        # Sicherstellen, dass die source den Endpoint enthält
        if not source.endpoint:
            raise ValueError("Source must have an 'endpoint' field")

        # Überprüfen, dass 'destinations' eine Liste von MessageHeaderDestination ist
        if not all(isinstance(dest, MessageHeaderDestination) for dest in destinations):
            raise ValueError("Each destination must be a MessageHeaderDestination object")

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