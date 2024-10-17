from uuid import uuid4
from fhir.resources.R4B.patient import Patient
from fhir.resources.R4B.extension import Extension
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.humanname import HumanName
from fhir.resources.R4B.coding import Coding
from fhir.resources.R4B.address import Address
from fhir.resources.R4B.meta import Meta
from fhir.resources.R4B.codeableconcept import CodeableConcept
from fhir.resources.R4B.fhirprimitiveextension import FHIRPrimitiveExtension


class PatientCreator:
    @staticmethod
    def create_patient(
        patient_id: str,
        identifier_type_code: str,
        kvnr: str,
        family_name: str,
        given_name: str,
        address_line: str,
        city: str,
        postal_code: str,
        birth_date: str,
    ) -> Patient:
        identifier_type = CodeableConcept(
            coding=[
                Coding(
                    system="http://fhir.de/CodeSystem/identifier-type-de-basis",
                    code=identifier_type_code,
                ),
            ],
        )

        patient = Patient(
            id=patient_id,
            meta=Meta(
                profile=[
                    "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
                ]
            ),
            identifier=[
                Identifier(
                    type=identifier_type,
                    system="http://fhir.de/sid/gkv/kvid-10",
                    value=kvnr,
                )
            ],
            name=[
                HumanName(
                    use="official",
                    family=family_name,
                    _family=FHIRPrimitiveExtension(
                        extension=[
                            Extension(
                                url="http://hl7.org/fhir/StructureDefinition/humanname-own-name",
                                valueString=family_name
                            )
                        ]
                    ),
                    given=[given_name],
                )
            ],
            address=[
                Address(
                    type="both",
                    line=[address_line],
                    _line=[
                        FHIRPrimitiveExtension(
                            extension=[
                                Extension(
                                    url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
                                    valueString=address_line.split(" ")[1],
                                ),
                                Extension(
                                    url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
                                    valueString=address_line.split(" ")[0],
                                ),
                            ]
                        )
                    ],
                    city=city,
                    postalCode=postal_code,
                )
            ],
            birthDate=birth_date,
        )

        return patient

    @staticmethod
    def get_example_patient():
        return PatientCreator.create_patient(
            patient_id=str(uuid4()),
            identifier_type_code="GKV",
            kvnr="X234567890",
            family_name="Königsstein",
            given_name="Ludger",
            address_line="Musterstr. 1",
            city="Berlin",
            postal_code="10623",
            birth_date="1935-06-22",
        )