from fhir.resources.bundle import Bundle
from fhir.resources.medicationdispense import MedicationDispense
from fhir.resources.medication import Medication
from fhir.resources.identifier import Identifier
from fhir.resources.reference import Reference
from fhir.resources.timing import Timing, TimingRepeat
from fhir.resources.dosage import Dosage
from fhir.resources.codeableconcept import CodeableConcept
from fhir.resources.coding import Coding
from fhir.resources.quantity import Quantity
from fhir.resources.meta import Meta
from uuid import uuid4


class MedicationDispenseCreator:
    @staticmethod
    def create_reference(ref: str = None, identifier: Identifier = None) -> Reference:
        return Reference(reference="urn:uuid:" +ref, identifier=identifier)


    @staticmethod
    def build_medication_dispense(identifier_value: str, performer_value: str, medication_id: str, medication_code: str, 
                              medication_text: str, subject_ref: str, handed_over: str, dose_sequence: int, 
                              dose_text: str, frequency: int, period: int, period_unit: str, dose_value: float, 
                              dose_unit: str) -> MedicationDispense:
        md = MedicationDispense(
            id=str(uuid4()),
            meta=Meta(
                profile=[
                    "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.2"
                ]
            ),
            status="completed",
            identifier=[
                Identifier(
                    use="official", 
                    system="https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
                    value=identifier_value
                )
            ],
            performer=[
                {
                    "actor": {
                        "identifier": Identifier(
                            system="https://gematik.de/fhir/sid/telematik-id",
                            value=performer_value
                        )
                    }
                }
            ],
            contained=[
                Medication(
                    id=medication_id,
                    meta=Meta(
                        profile=[
                            "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
                        ]
                    ),
                    code=CodeableConcept(
                        coding=[
                            Coding(
                                system="http://fhir.de/CodeSystem/ifa/pzn", 
                                code=medication_code
                            )
                        ], 
                        text=medication_text
                    )
                )
            ],
            medicationReference=MedicationDispenseCreator.create_reference(ref=f"#{medication_id}"),
            subject=MedicationDispenseCreator.create_reference(ref=subject_ref),
            whenHandedOver=handed_over,
            dosageInstruction=[
                Dosage(
                    sequence=dose_sequence,
                    text=dose_text,
                    timing=Timing(
                        repeat=TimingRepeat(
                            frequency=frequency,
                            period=period,
                            periodUnit=period_unit
                        )
                    ),
                    doseAndRate=[
                        {
                            "type": CodeableConcept(
                                coding=[
                                    Coding(code="ordered")
                                ]
                            ),
                            "doseQuantity": Quantity(
                                value=dose_value, 
                                unit=dose_unit
                            )
                        }
                    ]
                )
            ],
        )
        return md


    @staticmethod
    def get_example_medication_dispense() -> Bundle:
        medication_dispense = MedicationDispenseCreator.build_medication_dispense(
            identifier_value="160.100.000.000.002.36",
            performer_value="12345678901234567890",
            medication_id=str(uuid4()),
            medication_code="08585997",
            medication_text="Prospan® Hustensaft 100ml N1",
            subject_ref="X123456789",
            handed_over="2020-04-16T13:44:27.957+00:00",
            dose_sequence=1,
            dose_text="Eine Tablette täglich",
            frequency=1,
            period=1,
            period_unit="d",
            dose_value=1,
            dose_unit="tablet"
        )
        bundle = Bundle.construct()
        bundle.type = "transaction"
        bundle.entry = [{"fullUrl": f"http://erp-servicerequest-test.de/MedicationDispense/{medication_dispense.id}",
                         "resource": medication_dispense}]

        
        return bundle
