from uuid import uuid4
from fhir.resources.medicationrequest import MedicationRequest
from fhir.resources.extension import Extension
from fhir.resources.medication import Medication
from fhir.resources.identifier import Identifier
from fhir.resources.codeableconcept import CodeableConcept
from fhir.resources.coding import Coding
from datetime import date
from fhir.resources.meta import Meta
from fhir.resources.dosage import Dosage
from fhir.resources.reference import Reference


class MedicationRequestConverter:

    def convert_to_KBV_PR_ERP_Prescription(self, medication_request: MedicationRequest, medication_reference: str, dosage_instruction_text: str, requester_reference: str, insurance_reference: str, substitution_allowed) -> MedicationRequest:
        kbv_prescription = medication_request.copy()
        kbv_prescription = MedicationRequest.construct(
            id=str(uuid4()),
            meta=Meta(
                profile=[
                    "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription|1.1.0"
                ]
            ),
            status="active",
            intent="order",
            medicationReference=Reference(reference=medication_reference),
            requester=Reference(reference=requester_reference),
            dosageInstruction=[Dosage(text=dosage_instruction_text)],
            authoredOn=str(date.today()),
            substitution={'allowedBoolean': substitution_allowed},
            insurance=[Reference(reference=insurance_reference)]
        )

        if kbv_prescription.dosageInstruction[0].extension is None:
            kbv_prescription.dosageInstruction[0].extension = []

        kbv_prescription.dosageInstruction[0].extension.append(
            Extension.construct(
                url="https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag",
                valueBoolean=True
            )
        )

        if kbv_prescription.extension is None:
            kbv_prescription.extension = []

        kbv_prescription.extension.append(
            Extension.construct(
                url="https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee",
                valueBoolean=False
            )
        )
        kbv_prescription.extension.append(
            Extension.construct(
                url="https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_BVG",
                valueBoolean=False
            )
        )
        kbv_prescription.extension.append(
            Extension.construct(
                url="https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription",
                extension=[{'url': "Kennzeichen", 'valueBoolean': False}]
            )
        )
        kbv_prescription.extension.append(
            Extension.construct(
                url="https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment",
                valueCoding={
                    'code': "1", 'system': "https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_StatusCoPayment"}
            )
        )
        return kbv_prescription

    def get_example_conversion(self, medication_request):
        dosage_instruction_text = "2mal tägl. 5ml"
        medication_reference = "Medication/Example-Response-Medication"
        requester_reference = "Practitioner/Example-Practitioner"
        insurance_reference = "Coverage/Response-Coverage"
        return self.convert_to_KBV_PR_ERP_Prescription(medication_request, medication_reference, dosage_instruction_text, requester_reference, insurance_reference, True)
