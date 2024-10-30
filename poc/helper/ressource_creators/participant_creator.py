from typing import List
from fhir.resources.R4B.fhirtypes import ReferenceType, ContactPointType
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.messageheader import MessageHeaderDestination, MessageHeaderSource


class ParticipantsCreator:
    @staticmethod
    def create_sender(telematik_id: str, display: str) -> ReferenceType:
        return ReferenceType(
            identifier=Identifier(
                system="https://gematik.de/fhir/sid/telematik-id",
                value=telematik_id,
            ),
            display=display,
        )

    @staticmethod
    def create_source(
        software_creator: str,
        software_name: str,
        version: str,
        email: str,
        endpoint_url: str,
    ) -> MessageHeaderSource:
        return MessageHeaderSource(
            name=software_creator,
            software=software_name,
            version=version,
            contact=ContactPointType(system="email", value=email),
            endpoint=endpoint_url,
        )

    @staticmethod
    def create_destination(
        name: str, endpoint_url: str
    ) -> List[MessageHeaderDestination]:
        return [MessageHeaderDestination(name=name, endpoint=endpoint_url)]