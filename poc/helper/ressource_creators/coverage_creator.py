from uuid import uuid4
from fhir.resources.R4B.coverage import Coverage
from fhir.resources.R4B.extension import Extension
from fhir.resources.R4B.codeableconcept import CodeableConcept
from fhir.resources.R4B.coding import Coding
from fhir.resources.R4B.reference import Reference
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.period import Period

class CoverageCreator:
    @staticmethod
    def build_coverage(status: str, extensions: list, payor_identifier: dict, payor_display: str, type_code: str, type_system: str, beneficiary_reference: str, period_end: str) -> Coverage:
        coverage = Coverage(
            id=str(uuid4()),
            meta={"profile": ["https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Coverage|1.1.0"]},
            status=status,
            extension=[Extension(url=e['url'], valueCoding=Coding(system=e['valueCoding']['system'], code=e['valueCoding']['code'])) for e in extensions],
            payor=[Reference(identifier=Identifier(system=payor_identifier['system'], value=payor_identifier['value']), display=payor_display)],
            type=CodeableConcept(coding=[Coding(system=type_system, code=type_code)]),
            beneficiary=Reference(reference="urn:uuid:" +beneficiary_reference),
            period=Period(end=period_end)
        )
        return coverage


    @staticmethod
    def get_example_coverage() -> Coverage:
        status = "active"
        extensions = [
            {"url": "http://fhir.de/StructureDefinition/gkv/besondere-personengruppe", "valueCoding": {"system": "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_PERSONENGRUPPE", "code": "00"}},
            {"url": "http://fhir.de/StructureDefinition/gkv/dmp-kennzeichen", "valueCoding": {"system": "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DMP", "code": "00"}},
            {"url": "http://fhir.de/StructureDefinition/gkv/wop", "valueCoding": {"system": "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ITA_WOP", "code": "72"}},
            {"url": "http://fhir.de/StructureDefinition/gkv/versichertenart", "valueCoding": {"system": "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS", "code": "3"}}
        ]
        payor_identifier = {"system": "http://fhir.de/sid/arge-ik/iknr", "value": "108416214"}
        payor_display = "AOK Bayern Die Gesundh."
        type_code = "GKV"
        type_system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
        beneficiary_reference = "Patient/Example-Patient"
        period_end = "2040-04-01"

        return CoverageCreator.build_coverage(status, extensions, payor_identifier, payor_display, type_code, type_system, beneficiary_reference, period_end)