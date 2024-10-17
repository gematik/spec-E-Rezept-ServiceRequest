from uuid import uuid4
from fhir.resources.R4B.medicationrequest import MedicationRequest
from fhir.resources.R4B.extension import Extension
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.quantity import Quantity
from fhir.resources.R4B.reference import Reference
from fhir.resources.R4B.dosage import Dosage
from fhir.resources.R4B.meta import Meta
from datetime import datetime
from tzlocal import get_localzone


class MedicationRequestCreator:
    @staticmethod
    def create_medication_request(
        prior_prescription_id: str,
        medication_reference: str,
        patient_reference: str,
        dosage_instruction_text: str,
        substitution_allowed: bool,
    ) -> MedicationRequest:
        medication_request = MedicationRequest(
            id=str(uuid4()),
            meta=Meta(
                profile=[
                    "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-medication-request"
                ]
            ),
            extension=[
                Extension(
                    url="https://gematik.de/fhir/erp-servicerequest/StructureDefinition/prescription-id-ex",
                    valueIdentifier=Identifier(
                        system="https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
                        value=prior_prescription_id,
                    ),
                )
            ],
            dispenseRequest={
                "quantity": Quantity(
                    system="http://unitsofmeasure.org", code="{Package}", value=1
                )
            },
            status="active",
            intent="order",
            medicationReference=Reference(reference="urn:uuid:" +medication_reference),
            subject=Reference(reference="urn:uuid:" +patient_reference),
            authoredOn=datetime.now(get_localzone()).isoformat(),
            dosageInstruction=[Dosage(text=dosage_instruction_text)],
            substitution={"allowedBoolean": substitution_allowed},
        )

        return medication_request