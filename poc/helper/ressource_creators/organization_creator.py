from uuid import uuid4
from fhir.resources.R4B.organization import Organization
from fhir.resources.R4B.extension import Extension
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.coding import Coding
from fhir.resources.R4B.address import Address
from fhir.resources.R4B.contactpoint import ContactPoint
from fhir.resources.R4B.meta import Meta
from fhir.resources.R4B.codeableconcept import CodeableConcept
from fhir.resources.R4B.fhirprimitiveextension import FHIRPrimitiveExtension


class OrganizationCreator:
    @staticmethod
    def create_organization(
        org_id: str,
        kim_address: str,
        telematik_id: str,
        bsnr: str,
        address_line: str,
        city: str,
        postal_code: str,
        name: str,
        phone: str,
    ) -> Organization:
        organization = Organization(
            id=org_id,
            meta=Meta(
                profile=[
                    "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-organization"
                ]
            ),
            identifier=[
                Identifier(
                    type=CodeableConcept(
                        coding=[
                            Coding(
                                code="kim-2.0",
                                system="https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType",
                            ),
                        ]
                    ),
                    system="http://gematik.de/fhir/sid/KIM-Adresse",
                    value=kim_address,
                ),
                Identifier(
                    type=CodeableConcept(
                        coding=[
                            Coding(
                                system="http://terminology.hl7.org/CodeSystem/v2-0203",
                                code="PRN",
                            ),
                        ]
                    ),
                    system="https://gematik.de/fhir/sid/telematik-id",
                    value=telematik_id,
                ),
                Identifier(
                    type=CodeableConcept(
                        coding=[
                            Coding(
                                system="http://terminology.hl7.org/CodeSystem/v2-0203",
                                code="BSNR",
                            ),
                        ]
                    ),
                    system="https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR",
                    value=bsnr,
                ),
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
                        ),
                    ],
                    city=city,
                    postalCode=postal_code,
                )
            ],
            name=name,
            telecom=[ContactPoint(system="phone", value=phone)],
        )

        return organization

    @staticmethod
    def get_example_pflegeheim_organization():
        return OrganizationCreator.create_organization(
            org_id=str(uuid4()),
            kim_address="pflegeheim.immergrün.arzt@sana-pflegeheime.kim.telematik",
            telematik_id="1-031234567",
            bsnr="031234567",
            address_line="Musterstr. 2",
            city="Berlin",
            postal_code="10623",
            name="Pflegeheim Immergrün",
            phone="0301234567",
        )
    
    @staticmethod
    def get_example_apotheken_organization():
        return OrganizationCreator.create_organization(
            org_id=str(uuid4()),
            kim_address="apotheke@kim.telematik.de",
            telematik_id="1-431234567",
            bsnr="544234567",
            address_line="Malerstraße. 1",
            city="Berlin",
            postal_code="10523",
            name="Adler Apotheke",
            phone="0305234567",
        )