from uuid import uuid4
from fhir.resources.medication import Medication
from fhir.resources.extension import Extension
from fhir.resources.codeableconcept import CodeableConcept
from fhir.resources.coding import Coding
from fhir.resources.codeableconcept import CodeableConcept
from fhir.resources.meta import Meta


class MedicationCreator:
    @staticmethod
    def create_medication(
        medication_id: str,
        normgroesse: str,
        pzn_code: str,
        medication_text: str,
        form_code: str,
    ) -> Medication:
        medication = Medication(
            id=medication_id,
            meta=Meta(
                profile=[
                    "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
                ]
            ),
            extension=[
                Extension(
                    url="https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type",
                    valueCodeableConcept=CodeableConcept(
                        coding=[
                            Coding(
                                system="http://snomed.info/sct",
                                version="http://snomed.info/sct/900000000000207008/version/20220331",
                                code="763158003",
                                display="Medicinal product (product)",
                            )
                        ]
                    ),
                ),
                Extension(
                    url="https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category",
                    valueCoding=Coding(
                        code="00",
                        system="https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category",
                    ),
                ),
                Extension(
                    url="https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine",
                    valueBoolean=False,
                ),
                Extension(
                    url="http://fhir.de/StructureDefinition/normgroesse",
                    valueCode=normgroesse,
                ),
            ],
            code=CodeableConcept(
                coding=[
                    Coding(system="http://fhir.de/CodeSystem/ifa/pzn", code=pzn_code)
                ],
                text=medication_text,
            ),
            form=CodeableConcept(
                coding=[
                    Coding(
                        system="https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM",
                        code=form_code,
                    )
                ]
            ),
        )

        return medication

    @staticmethod
    def get_example_medication():
        return MedicationCreator.create_medication(
            medication_id=str(uuid4()),
            normgroesse="N1",
            pzn_code="08585997",
            medication_text="Prospan® Hustensaft 100ml",
            form_code="FLE",
        )
