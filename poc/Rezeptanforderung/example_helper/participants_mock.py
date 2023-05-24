from typing import List
from fhir.resources.fhirtypes import ReferenceType, ContactPointType
from fhir.resources.identifier import Identifier
from fhir.resources.messageheader import MessageHeaderDestination, MessageHeaderSource


class ParticipantsCreator:
    @staticmethod
    def create_sender(kim_address: str, display: str) -> ReferenceType:
        return ReferenceType(
            identifier=Identifier(
                system="http://gematik.de/fhir/sid/KIM-Adresse",
                value=kim_address,
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
    def create_destinations(
        kim_address: str, display: str, endpoint_url: str,
    ) -> List[MessageHeaderDestination]:
        receiver = ReferenceType(
            identifier=Identifier(
                system="http://gematik.de/fhir/sid/KIM-Adresse",
                value=kim_address,
            ),
            display=display,
        )
        return [MessageHeaderDestination(endpoint=endpoint_url, receiver=receiver)]
