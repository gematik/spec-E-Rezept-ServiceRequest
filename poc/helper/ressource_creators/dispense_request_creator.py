from typing import List, Dict, Union
from uuid import uuid4
from typing import List, Type
from fhir.resources.R4B.fhirtypes import ReferenceType
from fhir.resources.R4B.messageheader import (
    MessageHeaderDestination,
    MessageHeaderSource,
)
from fhir.resources.R4B.bundle import Bundle, BundleEntry
from fhir.resources.R4B.servicerequest import ServiceRequest
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.bundle import BundleEntry
from fhir.resources.R4B.servicerequest import ServiceRequest
from fhir.resources.R4B.practitioner import Practitioner
from fhir.resources.R4B.medication import Medication
from fhir.resources.R4B.medicationrequest import MedicationRequest
from fhir.resources.R4B.organization import Organization
from fhir.resources.R4B.patient import Patient
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.coverage import Coverage
from helper.ressource_creators.participant_creator import ParticipantsCreator
from helper.ressource_creators.service_request_creator import ServiceRequestCreator
from helper.ressource_creators.bundle_creator import BundleCreator
from helper.ressource_creators.organization_creator import OrganizationCreator
from helper.ressource_creators.patient_creator import PatientCreator


class ResourceExtractor:
    @staticmethod
    def get_by_type(
        bundle_entries: List[BundleEntry], type: Type
    ) -> Union[
        ServiceRequest, MedicationRequest, Medication, Organization, Patient, Coverage
    ]:
        return next(
            (entry for entry in bundle_entries if isinstance(entry, type)), None
        )

    @staticmethod
    def extract_identifiers(service_request: ServiceRequest):
        identifier_dict = {}
        for identifier in service_request.identifier:
            if (
                identifier.system
                == "https://gematik.de/fhir/erp-servicerequest/sid/RequestIdentifier"
            ):
                identifier_dict["RequestIdentifier"] = identifier.value.replace(
                    "urn:uuid:", ""
                )
        if service_request.id:
            identifier_dict["ProcedureIdentifier"] = service_request.id
        return identifier_dict

    @staticmethod
    def extract_references(service_request: ServiceRequest):
        reference_dict = {}
        if service_request.basedOn:
            reference_dict["based_on"] = service_request.basedOn[0].reference.replace(
                "urn:uuid:", ""
            )
        if service_request.subject:
            reference_dict["patient"] = service_request.subject.reference.replace(
                "urn:uuid:", ""
            )
        if service_request.requester:
            reference_dict["requester"] = service_request.requester.reference.replace(
                "urn:uuid:", ""
            )
        if service_request.performer:
            reference_dict["performer"] = service_request.performer[0].identifier
        return reference_dict


class DispenseRequestCreator:
    @staticmethod
    def create_dispense_request_bundle(
        status,
        sender_kim_address,
        software_info,
        recipient_kim_address,
        prescription_service_request: ServiceRequest,
        token_extension,
        use_case,
        use_case_display,
        note_text,
        reason_text,
    ) -> Bundle:

        source = ParticipantsCreator.create_source(
            software_info["name"],
            software_info["product"],
            software_info["version"],
            software_info["email"],
            software_info["endpoint"],
        )

        destination = ParticipantsCreator.create_destination(
            recipient_kim_address["display"], recipient_kim_address["telematik_id"]
        )

        requesting_organisation = (
            OrganizationCreator.get_example_pflegeheim_organization()
        )

        identifiers = ResourceExtractor.extract_identifiers(
            prescription_service_request
        )
        identifiers["kim_address_apotheke"] = recipient_kim_address["display"]
        patient = PatientCreator.get_example_patient()
        references = ResourceExtractor.extract_references(prescription_service_request)
        references["patient"] = patient.id

        service_request = DispenseRequestCreator.create_dispense_service_request(
            status, token_extension, identifiers, references, note_text, reason_text
        )

        dispense_additional_bundle_entries = BundleCreator.build_bundle_entries(
            [patient, requesting_organisation]
        )

        return BundleCreator.create_request_bundle(
            str(uuid4()),
            ParticipantsCreator.create_sender(
                sender_kim_address["telematik_id"], sender_kim_address["display"]
            ),
            source,
            destination,
            service_request,
            requesting_organisation.id,
            additional_bundle_entries=dispense_additional_bundle_entries,
            code_system="https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
            use_case=use_case,
            use_case_display=use_case_display,
        )

    @staticmethod
    def create_dispense_service_request(
        status,
        token_extension,
        identifiers: Dict[str, str],
        references: Dict[str, str],
        note_text,
        reason_text,
    ) -> ServiceRequest:
        service_request = ServiceRequestCreator.create_service_request(
            "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-dispense-request",
            "filler-order",
            "dispense-request",
            status,
            None,
            identifiers={
                "https://gematik.de/fhir/erp-servicerequest/sid/RequestIdentifier": identifiers[
                    "RequestIdentifier"
                ],
                "https://gematik.de/fhir/erp-servicerequest/sid/ProcedureIdentifier": identifiers[
                    "ProcedureIdentifier"
                ],
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
            note_text=note_text,
            reason_text=reason_text,
        )
        service_request.extension = []
        service_request.extension.append(token_extension)

        return service_request