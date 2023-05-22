from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.meta import Meta
from fhir.resources.coding import Coding
from fhir.resources.identifier import Identifier
from fhir.resources.reference import Reference
from fhir.resources.codeableconcept import CodeableConcept
from datetime import datetime


class ServiceRequestCreator:
    @staticmethod
    def create_service_request(
        request_id: str,
        preDis_id: str,
        medication_request_reference: str,
        vorgangs_id: str,
        patient_reference: str,
        requester_reference: str,
        performer_identifier: str,
        reason_code: str,
        reason_references: list[str],
        note_text: str,
    ) -> ServiceRequest:
        service_request = ServiceRequest(
            id=request_id,
            meta=Meta(
                profile=[
                    "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/service-request-prescription-request"
                ]
            ),
            intent="order",
            code=CodeableConcept(
                coding=[
                    Coding(
                        code="prescription-request",
                        system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/service-request-type-cs",
                    )
                ]
            ),
            identifier=[
                Identifier(
                    system="https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier",
                    value=request_id,
                ),
                Identifier(
                    system="https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier",
                    value=preDis_id,
                ),
            ],
            basedOn=[Reference(reference=medication_request_reference)],
            requisition=Identifier(
                system="https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier",
                value=vorgangs_id,
            ),
            status="active",
            subject=Reference(reference=patient_reference),
            orderDetail=[
                CodeableConcept(
                    coding=[
                        Coding(
                            code="return-to-requester",
                            system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/prescription-fullfillment-type-cs",
                        )
                    ]
                )
            ],
            occurrenceDateTime=datetime.now().isoformat(),
            authoredOn=datetime.now().isoformat(),
            requester=Reference(reference=requester_reference),
            performer=[
                Reference(
                    identifier=Identifier(
                        system="http://gematik.de/fhir/sid/KIM-Adresse",
                        value=performer_identifier,
                    )
                )
            ],
            reasonCode=[
                CodeableConcept(
                    coding=[
                        Coding(
                            code=reason_code,
                            system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs",
                        )
                    ]
                )
            ],
            reasonReference=[Reference(reference=ref) for ref in reason_references],
            note=[{"text": note_text}],
        )

        return service_request
