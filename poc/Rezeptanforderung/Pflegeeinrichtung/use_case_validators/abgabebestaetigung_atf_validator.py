from app_transport_framework_library.base_use_case_validator import BaseUseCaseValidator
from fhir.resources.operationoutcome import  OperationOutcomeIssue
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.bundle import Bundle, BundleEntry
from fhir.resources.messageheader import MessageHeader
from typing import List, Tuple

class AbgabebestaetigungValidator(BaseUseCaseValidator):

    def resolve_reference(self, reference_str: str, bundle: Bundle):
        for entry in bundle.entry:
            if entry.resource.id == reference_str.split('urn:uuid:')[-1]:
                return entry.resource
        return None

    def handle(self, message_header: MessageHeader, bundle: Bundle) -> Tuple[List[BundleEntry], List[OperationOutcomeIssue]]:
        self.bundleEntries = []
        self.issues = []
        message_header = self.get_ressource_by_type(bundle, MessageHeader)
        if not any([isinstance(self.resolve_reference(focus_ref.reference, Bundle.parse_raw(bundle.json())), ServiceRequest) for focus_ref in message_header.focus]):
            self.issues.append(
                OperationOutcomeIssue(
                    severity="fatal",
                    code="invalid",
                    diagnostics="Eine ServiceRequest-Ressource wurde im MessageHeader.focus nicht gefunden"
                )
            )
        else:
            self.issues.append(
                OperationOutcomeIssue(
                    severity="information",
                    code="informational",
                    diagnostics="Abgabebestätigung erfolgreich entgegengenommen"
                )
            )
        for entry in bundle.entry:
            if not isinstance(entry.resource, (MessageHeader)):
                self.bundleEntries.append(entry.resource)

        return self.bundleEntries, self.issues

    def get_ressource_by_type(self, parsed_bundle: Bundle, type):
        return next((entry.resource for entry in parsed_bundle.entry if isinstance(
            entry.resource, type)), None)
