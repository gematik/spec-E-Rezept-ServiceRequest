from uuid import uuid4
from fhir.resources.practitioner import Practitioner
from fhir.resources.humanname import HumanName
from fhir.resources.extension import Extension
from fhir.resources.codeableconcept import CodeableConcept
from fhir.resources.coding import Coding
from fhir.resources.identifier import Identifier
from fhir.resources.fhirtypes import PractitionerQualificationType


class PractitionerCreator:
    @staticmethod
    def build_practitioner(name_use: str, family: str, given: list, prefix: list, prefix_valueCode: str, qualifications: list, identifiers: list) -> Practitioner:
        practitioner = Practitioner.construct()
        practitioner.id = str(uuid4())
        practitioner.meta = {"profile": [
            "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner|1.1.0"]}
        practitioner.name = [
            HumanName(
                use=name_use,
                family=family,
                _family={"extension": [Extension(
                    url="http://hl7.org/fhir/StructureDefinition/humanname-own-name", valueString=family)]},
                given=given,
                prefix=prefix,
                #    _prefix={"extension": [Extension(
                #         url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier", valueCode=prefix_valueCode)]}
            )
        ]
        practitioner.qualification = [PractitionerQualificationType(code=CodeableConcept(coding=[Coding(
            system=q['system'], code=q['code'])], text=q.get('text', ''))) for q in qualifications]
        practitioner.identifier = [Identifier(type=CodeableConcept(coding=[Coding(
            system=i['type']['system'], code=i['type']['code'])]), system=i['system'], value=i['value']) for i in identifiers]

        return practitioner

    @staticmethod
    def get_example_practitioner() -> Practitioner:
        name_use = "official"
        family = "Topp-Glücklich"
        given = ["Hans"]
        prefix = ["Dr. med."]
        prefix_valueCode = "AC"
        qualifications = [
            {"system": "https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type",
                "code": "00", "text": "Arzt"},
            {"system": "https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung",
                "code": "Berufsbezeichnung", "text": "Hausarzt"}
        ]
        identifiers = [
            {"type": {"system": "http://terminology.hl7.org/CodeSystem/v2-0203", "code": "LANR"},
                "system": "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR", "value": "838382202"},
            {"type": {"system": "http://terminology.hl7.org/CodeSystem/v2-0203", "code": "PRN"},
                "system": "https://gematik.de/fhir/sid/telematik-id", "value": "1-838382202"}
        ]

        return PractitionerCreator.build_practitioner(name_use, family, given, prefix, prefix_valueCode, qualifications, identifiers)
