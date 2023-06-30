from uuid import uuid4
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
        observation = Observation(
            status="final",
            code=CodeableConcept(
                coding=[
                    Coding(
                        system=obs_system,
                        code=obs_code,
                    )
                ]
            ),
        )
        observation.id = id
        observation.meta = {
            "profile": [
                "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-remaining-medication"
            ]
        }
        observation.subject = Reference.construct()
        observation.subject.reference = "urn:uuid:" + patient_ref

        if value_date_time:
            observation.valueDateTime = value_date_time
        elif value_quantity and unit:
            observation.valueQuantity = Quantity.construct()
            observation.valueQuantity.value = value_quantity
            observation.valueQuantity.unit = unit

        return observation

    @staticmethod
    def get_example_observation_datetime(patient_id):
        return ObservationCreator.create_observation(
            id=str(uuid4()),
            patient_ref=patient_id,
            obs_code="range-of-medication",
            obs_system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-observation-cs",
            value_date_time="2023-01-31",
        )

    @staticmethod
    def get_example_observation_quantity(patient_id):
        return ObservationCreator.create_observation(
            id=str(uuid4()),
            patient_ref=patient_id,
            obs_code="range-of-medication",
            obs_system="https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-observation-cs",
            value_quantity=7,
            unit="stk",
        )
