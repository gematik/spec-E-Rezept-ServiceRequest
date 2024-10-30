import logging
from fhir.resources.R4B.meta import Meta
from fhir.resources.R4B.messageheader import MessageHeader, MessageHeaderDestination, MessageHeaderSource
from fhir.resources.R4B.fhirtypes import ReferenceType
from fhir.resources.R4B.coding import Coding
from typing import List

# Logger konfigurieren
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class MessageHeaderCreator:
    @staticmethod
    def create_message_header(
        id: str,
        message_sender: ReferenceType,
        source: MessageHeaderSource,
        destinations: List[MessageHeaderDestination],
        code_system: str,
        use_case: str,
        use_case_display: str,
        requesting_organisation_id: str,
        focus_reference: str,
    ) -> MessageHeader:
        try:
            message_header = MessageHeader(
                id=id,
                meta=Meta.construct(profile=[
                    "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"
                ]),
                eventCoding=Coding(
                    system=code_system,
                    code=use_case,
                    display=use_case_display
                ),
                source=source,
                destination=destinations,
                sender=message_sender,
                responsible=ReferenceType(reference=f"urn:uuid:{requesting_organisation_id}"),
                focus=[ReferenceType(reference=f"urn:uuid:{focus_reference}")]
            )
            
            logger.debug("MessageHeader erfolgreich erstellt.")
            return message_header
        except Exception as e:
            # Fehlerhafte Situation loggen
            logger.error(f"Fehler beim Erstellen des MessageHeader: {e}")
            raise