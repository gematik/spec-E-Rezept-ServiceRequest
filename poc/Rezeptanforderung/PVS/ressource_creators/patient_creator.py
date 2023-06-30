from uuid import uuid4
from fhir.resources.patient import Patient
from fhir.resources.humanname import HumanName
from fhir.resources.extension import Extension
from fhir.resources.fhirprimitiveextension import FHIRPrimitiveExtension
from fhir.resources.identifier import Identifier
from fhir.resources.address import Address
from fhir.resources.codeableconcept import CodeableConcept
from fhir.resources.coding import Coding


class PatientCreator:
    @staticmethod
    def build_patient(name_use: str, family: str, given: list, identifiers: list, addresses: list, birth_date: str) -> Patient:
        patient = Patient.construct()
        patient.id = str(uuid4())
        patient.meta = {"profile": [
            "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"]}
        patient.name = [
            HumanName(
                use=name_use,
                family=family,
                _family={"extension": [Extension(
                    url="http://hl7.org/fhir/StructureDefinition/humanname-own-name", valueString=family)]},
                given=given
            )
        ]
        patient.identifier = [Identifier(type=CodeableConcept(coding=[Coding(
            system=i['type']['system'], code=i['type']['code'])]), system=i['system'], value=i['value']) for i in identifiers]
        patient.address = [Address(type=a['type'], line=a['line'], _line=[FHIRPrimitiveExtension(extension=[Extension(url=e['url'], valueString=e['valueString'])]) for e in a['_line']],
                                   city=a['city'], postalCode=a['postalCode']) for a in addresses]
        patient.birthDate = birth_date

        return patient

    @staticmethod
    def get_example_patient() -> Patient:
        name_use = "official"
        family = "Königsstein"
        given = ["Ludger"]
        identifiers = [
            {"type": {"system": "http://fhir.de/CodeSystem/identifier-type-de-basis", "code": "GKV"},
             "system": "http://fhir.de/sid/gkv/kvid-10", "value": "X234567890"}
        ]
        addresses = [
            {"type": "both", "line": ["Musterstr. 1"], "_line": [{"url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber", "valueString": "1"},
                                                                  {"url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName", "valueString": "Musterstr."}],
             "city": "Berlin", "postalCode": "10623"}
        ]
        birth_date = "1935-06-22"

        return PatientCreator.build_patient(name_use, family, given, identifiers, addresses, birth_date)
