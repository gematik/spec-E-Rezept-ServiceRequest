from uuid import uuid4
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.meta import Meta
from fhir.resources.coding import Coding
from fhir.resources.identifier import Identifier
from fhir.resources.reference import Reference
from fhir.resources.codeableconcept import CodeableConcept
from datetime import datetime
from typing import Dict, List, Union


class ServiceRequestCreator:
    @staticmethod
    def create_coding(system: str, code: str) -> Coding:
        return Coding(system=system, code=code)

    @staticmethod
    def create_identifier(system: str, value: str) -> Identifier:
        return Identifier(system=system, value=value)

    @staticmethod
    def create_reference(ref: str = None, identifier: Identifier = None) -> Reference:
        return Reference(reference=ref, identifier=identifier)

    @staticmethod
    def create_service_request(
        profile: str,
        intent: str,
        service_request_code,
        status: str,
        order_detail_code: str,
        identifiers: Dict[str, str],
        references: Dict[str, Union[str,Identifier]],
        reason_code: str,
        reason_references: List[str],
        note_text: str,
    ) -> ServiceRequest:
        identifier_instances = [
            ServiceRequestCreator.create_identifier(system, value)
            for system, value in identifiers.items()
        ]


        service_request = ServiceRequest(
            id=str(uuid4()),
            meta=Meta(
                profile=[
                    profile
                ]
            ),
            intent=intent,
            code=CodeableConcept(
                coding=[
                    ServiceRequestCreator.create_coding(
                        system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/service-request-type-cs",
                        code=service_request_code,
                    )
                ]
            ),
            identifier=identifier_instances,
            basedOn=[
                ServiceRequestCreator.create_reference(ref=references["based_on"])
            ],
            requisition=ServiceRequestCreator.create_identifier(
                system="https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier",
                value=identifiers["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"],
            ),
            status=status,
            subject=ServiceRequestCreator.create_reference(ref=references["patient"]),
            occurrenceDateTime=datetime.now().isoformat(),
            authoredOn=datetime.now().isoformat(),
            requester=ServiceRequestCreator.create_reference(
                ref=references["requester"]
            ),
            performer=[Reference(identifier=references["performer"])]
            
        )

        if order_detail_code is not None:
            service_request.orderDetail = [
                CodeableConcept(
                    coding=[
                        ServiceRequestCreator.create_coding(
                            system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/prescription-fullfillment-type-cs",
                            code=order_detail_code,
                        )
                    ]
                )
            ]

        if reason_code is not None:
            service_request.reasonCode=[
                CodeableConcept(
                    coding=[
                        ServiceRequestCreator.create_coding(
                            system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs",
                            code=reason_code,
                        )
                    ]
                )
            ]
            
        if reason_references is not None:
            reference_instances = [
                ServiceRequestCreator.create_reference(ref=ref) for ref in reason_references
            ]
            service_request.reasonReference=reference_instances

        if note_text is not None:
            service_request.note=[{"text": note_text}]


        return service_request
