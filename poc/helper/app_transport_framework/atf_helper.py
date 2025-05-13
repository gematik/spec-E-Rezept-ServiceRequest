# atf_helper.py

import logging
from fhir.resources.R4B.messageheader import MessageHeader, MessageHeaderDestination

from helper.app_transport_framework.atf_operation_outcome_bundle_creator import AtfOperationOutcomeBundleCreator
from helper.app_transport_framework.operation_outcome_creator import AtfOperationOutcomeCreator
from helper.app_transport_framework.message_to_send import MessageToSend
from helper.ressource_creators.participant_creator import ParticipantsCreator

logger = logging.getLogger("ATFHelper")

class ATFHelper:
    def __init__(self, sender_info, source_info):
        self.sender_info = sender_info
        self.source_info = source_info
        logger.debug("ATFHelper initialisiert.")

    def create_empfangsbestätigung(self, message_header: MessageHeader, issues: list) -> MessageToSend:
        """
        Erzeugt eine Empfangsbestätigung (ATF) mit den angegebenen Problemen/Issues.
        
        :param message_header: Das ursprüngliche MessageHeader-Objekt.
        :param issues: Liste von Problemen/Issues für das OperationOutcome.
        :return: MessageToSend-Objekt, das die Empfangsbestätigung darstellt.
        """
        logger.debug("Erstelle Empfangsbestätigung für Nachricht: %s", message_header.id if message_header else "Ohne Header")
        
        # Create OperationOutcome based on issues
        operation_outcome = AtfOperationOutcomeCreator.create_operation_outcome_ressource(
            message_id=message_header.id if message_header else None,
            issues=issues
        )

        # Define the message destinations
        destination = [
            MessageHeaderDestination(
                endpoint=message_header.source.endpoint if message_header else None,
                receiver=message_header.sender if message_header else None
            )
        ]

        # Create the outcome bundle
        source = ParticipantsCreator.create_source(
            self.source_info["name"],
            self.source_info["product"],
            self.source_info["version"],
            self.source_info["email"],
            self.source_info["endpoint"]
        )
        operationOutcomeBundle = AtfOperationOutcomeBundleCreator.create_operation_outcome_receipt_bundle(

             ParticipantsCreator.create_sender(
                self.sender_info["telematik_id"], self.sender_info["display"]
            ),
            source,
            destination,
            operation_outcome
        )

        # Create the final message to send
        message_to_send = MessageToSend(
            atf_bundle=operationOutcomeBundle,
            receiver=message_header.sender.identifier.value if message_header and message_header.sender else None,
            message_type="atf;Empfangsbestaetigung"
        )

        logger.info("Empfangsbestätigung für %s erstellt.", message_to_send.receiver)
        
        return message_to_send
