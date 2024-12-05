from fhir.resources.R4B.bundle import Bundle, BundleEntry
from fhir.resources.R4B.messageheader import (
    MessageHeaderDestination,
    MessageHeaderSource,
)
from fhir.resources.R4B.fhirtypes import ReferenceType
from fhir.resources.R4B.operationoutcome import OperationOutcome
from typing import List
from uuid import uuid4

from helper.app_transport_framework.atf_message_header_creator import (
    AtfMessageHeaderCreator,
)
from helper.app_transport_framework.atf_message_bundle_creator import (
    AtfMessageBundleCreator,
)


class AtfOperationOutcomeBundleCreator:
    def create_operation_outcome_receipt_bundle(
        message_sender: ReferenceType,
        source: MessageHeaderSource,
        destinations: List[MessageHeaderDestination],
        operation_outcome: OperationOutcome,
    ) -> Bundle:

        message_header = AtfMessageHeaderCreator.create_message_header(
            str(uuid4()),
            message_sender,
            source,
            destinations,
            code_system="https://gematik.de/fhir/atf/CodeSystem/operation-identifier-cs",
            use_case="atf;Empfangsbestaetigung",
            use_case_display="Empfangsbestätigung und Auskunft über FHIR Interpretierbarkeit der Nachricht",
            focus_reference=operation_outcome.id,
        )

        resources = [
            BundleEntry(
                fullUrl=f"urn:uuid:{operation_outcome.id}", resource=operation_outcome
            )
        ]

        bundle = AtfMessageBundleCreator.create_message_bundle(
            message_header=message_header, resources=resources
        )

        return bundle
