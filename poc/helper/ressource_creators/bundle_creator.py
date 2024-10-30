from datetime import datetime, timezone
from typing import List
from fhir.resources.R4B.messageheader import MessageHeader
from fhir.resources.R4B.bundle import Bundle, BundleEntry
from fhir.resources.R4B.fhirtypes import ReferenceType
from fhir.resources.R4B.messageheader import MessageHeaderDestination, MessageHeaderSource
from fhir.resources.R4B.servicerequest import ServiceRequest

from fhir.resources.R4B.meta import Meta
from fhir.resources.R4B.fhirtypes import IdentifierType, Instant
from uuid import uuid4

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
        requesting_organisation_id,
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
            requesting_organisation_id,
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
    

    def create_message_bundle(message_header: MessageHeader, resources: List[BundleEntry]) -> Bundle:
        bundle_id = str(uuid4())

        entries = [
            BundleEntry(
                fullUrl=f"urn:uuid:{message_header.id}", resource=message_header)
        ]

        entries.extend(resources)

        message_bundle = Bundle(
            id=bundle_id,
            meta=Meta.construct(profile=[
                "https://gematik.de/fhir/atf/StructureDefinition/bundle-app-transport-framework"
            ]),
            type="message",
            identifier=IdentifierType(
                system="urn:ietf:rfc:3986", value=f"urn:uuid:{bundle_id}"),
            entry=entries,
            timestamp=datetime.now(timezone.utc).isoformat(),
        )

        return message_bundle
    
    def build_bundle_entries( resource_list ):
        response_bundle_entries = []
        for resource in resource_list:
            response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{resource.id}", resource=resource))

        return response_bundle_entries