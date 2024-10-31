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
                ],
                tag=[
                    Coding(
                        code="owner",
                        system="https://gematik.de/fhir/directory/CodeSystem/Origin"
                    )

                ]
            ),
            identifier=[
                Identifier(
                    system="https://gematik.de/fhir/sid/telematik-id",
                    value=telematik_id,
                )
            ],
            address=[
                Address(
                    type="both",
                    line=[address_line],
                    city=city,
                    postalCode=postal_code,
                )
            ],
            name=name,
             contact=[
                {
                    "telecom": [
                        ContactPoint(system="phone", value=phone),
                        ContactPoint(system="email", value=kim_address),
                    ]
                }
            ]
            
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