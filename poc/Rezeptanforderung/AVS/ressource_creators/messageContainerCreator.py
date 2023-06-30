from typing import List
from fhir.resources.bundle import Bundle, BundleEntry
from fhir.resources.fhirtypes import ReferenceType
from fhir.resources.messageheader import MessageHeaderDestination, MessageHeaderSource
from fhir.resources.servicerequest import ServiceRequest
from app_transport_framework_library.ressource_creators.message_header_creator import MessageHeaderCreator
from app_transport_framework_library.ressource_creators.message_bundle_creator import MessageBundleCreator

class MessageContainerCreator:
    def __init__(self) -> None:
        pass

    def create_response_dispense_request(
        message_id: str,
        sender: ReferenceType,
        source: MessageHeaderSource,
        destinations: List[MessageHeaderDestination],
        service_request: ServiceRequest,
        additional_bundle_entries: List[BundleEntry],
    ) -> Bundle:
        message_header = MessageHeaderCreator.create_message_header(
            message_id,
            sender,
            source,
            destinations,
            code_system="https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
            use_case="eRezept_Rezeptanforderung;Abgabebestaetigung",
            use_case_display="Bestätigung der Erfüllung und Abgabe eines Medikamentes",
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
