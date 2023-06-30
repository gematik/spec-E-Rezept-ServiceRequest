
from typing import List, Dict, Union
from uuid import uuid4
from typing import List, Type
from app_transport_framework_library.models.bundle_content import BundleContent
from fhir.resources.fhirtypes import ReferenceType
from fhir.resources.messageheader import MessageHeaderDestination, MessageHeaderSource
from fhir.resources.bundle import Bundle, BundleEntry
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.identifier import Identifier
from fhir.resources.bundle import BundleEntry
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.practitioner import Practitioner
from fhir.resources.medication import Medication
from fhir.resources.medicationrequest import MedicationRequest
from fhir.resources.organization import Organization
from fhir.resources.patient import Patient
from fhir.resources.identifier import Identifier
from fhir.resources.coverage import Coverage

from Pflegeeinrichtung.ressource_creators.message_container_creator import MessageContainerCreator
from Pflegeeinrichtung.ressource_creators.service_request_creator import ServiceRequestCreator

class ResourceExtractor:
    @staticmethod
    def get_by_type(bundle_entries: List[BundleEntry], type: Type) -> Union[ServiceRequest, MedicationRequest, Medication, Organization, Patient, Coverage]:
        return next((entry for entry in bundle_entries if isinstance(entry, type)), None)

    @staticmethod
    def extract_identifiers(service_request: ServiceRequest):
        identifier_dict = {}
        for identifier in service_request.identifier:
            if identifier.system == "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier":
                identifier_dict["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"] = identifier.value.replace("urn:uuid:","")
            elif identifier.system == "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier":
                identifier_dict["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier"] = identifier.value.replace("urn:uuid:","")
        if service_request.id:
            identifier_dict["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"] = service_request.id
        return identifier_dict

    @staticmethod
    def extract_references(service_request: ServiceRequest):
        reference_dict = {}
        if service_request.basedOn:
            reference_dict["based_on"] = service_request.basedOn[0].reference.replace("urn:uuid:","")
        if service_request.subject:
            reference_dict["patient"] = service_request.subject.reference.replace("urn:uuid:","")
        if service_request.requester:
            reference_dict["requester"] = service_request.requester.reference.replace("urn:uuid:","")
        if service_request.performer:
            reference_dict["performer"] = service_request.performer[0].identifier
        return reference_dict

class BundleBuilder:
    @staticmethod
    def build_entries( resource_list ):
        response_bundle_entries = []
        for resource in resource_list:
            response_bundle_entries.append(BundleEntry(fullUrl=f"urn:uuid:{resource.id}", resource=resource))

        return response_bundle_entries

class DispenseRequestCreator:
    @staticmethod
    def create_dispense_request_bundle(
        status,
        sender: ReferenceType,
        source: MessageHeaderSource,
        destinations: List[MessageHeaderDestination],
        prescription_service_request: ServiceRequest,
        use_case,
        use_case_display,
        note_text
    ) -> Bundle:
        
        identifiers = ResourceExtractor.extract_identifiers(prescription_service_request)
        identifiers["kim_address_apotheke"] = destinations[0].name
        references = ResourceExtractor.extract_references(prescription_service_request)
        service_request = DispenseRequestCreator.create_dispense_service_request(status, identifiers, references, note_text)

        build_entries = [prescription_service_request]

        dispense_additional_bundle_entries = BundleBuilder.build_entries(build_entries)

        return MessageContainerCreator.create_request_bundle(
            str(uuid4()),
            sender,
            source,
            destinations,
            service_request,
            additional_bundle_entries=dispense_additional_bundle_entries,
            code_system="https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
            use_case=use_case,
            use_case_display=use_case_display
        )
    
    
    @staticmethod
    def create_dispense_service_request(
        status,
        identifiers: Dict[str, str],
        references: Dict[str, str],
        note_text
    ) -> ServiceRequest:
        return ServiceRequestCreator.create_service_request(
            "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-dispense-request",
            "filler-order",
            "dispense-request",
            status,
            None,
            identifiers={
                "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier": identifiers["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"],
                "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier": identifiers["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier"],
                "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier": identifiers["https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"],
            },
            references={
                "based_on": references["based_on"],
                "patient": references["patient"],
                "requester": references["requester"],
                "performer": Identifier(
                    system="http://gematik.de/fhir/sid/KIM-Adresse",
                    value=identifiers["kim_address_apotheke"],
                ),
            },
            reason_system=None,
            reason_code=None,
            reason_references=None,
            note_text=note_text
        )
