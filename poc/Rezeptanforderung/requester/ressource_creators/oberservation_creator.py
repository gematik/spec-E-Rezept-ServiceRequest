from fhir.resources.observation import (
    Observation,
)
from fhir.resources.coding import Coding
from fhir.resources.codeableconcept import CodeableConcept
from fhir.resources.reference import Reference
from fhir.resources.quantity import Quantity


class ObservationCreator:
    @staticmethod
    def create_observation(
        id: str,
        patient_ref: str,
        obs_code: str,
        obs_system: str,
        value_date_time=None,
        value_quantity=None,
        unit=None,
    ):
        observation = Observation.construct()
        observation.id = id
        observation.meta = {
            "profile": [
                "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-remaining-medication"
            ]
        }
        observation.status = "final"
        observation.subject = Reference.construct()
        observation.subject.reference = patient_ref
        observation.code = CodeableConcept.construct()
        observation.code.coding = [Coding.construct()]
        observation.code.coding[0].system = obs_system
        observation.code.coding[0].code = obs_code

        if value_date_time:
            observation.valueDateTime = value_date_time
        elif value_quantity and unit:
            observation.valueQuantity = Quantity.construct()
            observation.valueQuantity.value = value_quantity
            observation.valueQuantity.unit = unit

        return observation

    @staticmethod
    def get_example_observation_datetime():
        return ObservationCreator.create_observation(
            id="Medication-Runs-Out-Example-dateTime",
            patient_ref="Patient/Example-Patient",
            obs_code="range-of-medication",
            obs_system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-observation-cs",
            value_date_time="2023-01-31",
        )

    @staticmethod
    def get_example_observation_quantity():
        return ObservationCreator.create_observation(
            id="Medication-Runs-Out-Example-Quantity",
            patient_ref="Patient/Example-Patient",
            obs_code="range-of-medication",
            obs_system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-observation-cs",
            value_quantity=7,
            unit="stk",
        )
