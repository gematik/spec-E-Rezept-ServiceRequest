from typing import List, Dict
from uuid import uuid4
import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))
from fhir.resources.R4B.fhirtypes import ReferenceType
from fhir.resources.R4B.identifier import Identifier
from fhir.resources.R4B.messageheader import (
    MessageHeaderDestination,
    MessageHeaderSource,
)
from fhir.resources.R4B.servicerequest import ServiceRequest
from fhir.resources.R4B.bundle import Bundle, BundleEntry
from helper.ressource_creators.medication_creator import MedicationCreator
from helper.ressource_creators.medication_request_creator import (
    MedicationRequestCreator,
)
from helper.ressource_creators.bundle_creator import BundleCreator
from helper.ressource_creators.oberservation_creator import ObservationCreator
from helper.ressource_creators.organization_creator import OrganizationCreator
from helper.ressource_creators.patient_creator import PatientCreator
from helper.ressource_creators.service_request_creator import ServiceRequestCreator
from helper.ressource_creators.participant_creator import ParticipantsCreator


class PrescriptionRequestCreator:
    @staticmethod
    def create_identifier() -> str:
        return str(uuid4())

    @staticmethod
    def create_service_request(
        status: str,
        order_detail_code: str,
        reason_references: List[str],
        identifiers: Dict[str, str],
        reason_system,
        reason_code,
        reason_text,
        note_text
    ) -> ServiceRequest:
        
        # Check for required keys
        required_keys = ["RequestIdentifier", "ProcedureIdentifier", "medication_request", "patient", "requesting_organisation"]
        missing_keys = [key for key in required_keys if key not in identifiers]
        if missing_keys:
            raise KeyError(f"Missing required keys in identifiers: {', '.join(missing_keys)}")

        return ServiceRequestCreator.create_service_request(
            "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-prescription-request",
            "order",
            "prescription-request",
            status,
            order_detail_code,
            identifiers={
                "https://gematik.de/fhir/erp-servicerequest/sid/RequestIdentifier": identifiers.get("RequestIdentifier"),
                "https://gematik.de/fhir/erp-servicerequest/sid/ProcedureIdentifier": identifiers.get("ProcedureIdentifier"),
            },
            references={
                "based_on": identifiers.get("medication_request"),
                "patient": identifiers.get("patient"),
                "requester": identifiers.get("requesting_organisation"),
                "performer": Identifier(
                    system="http://gematik.de/fhir/sid/KIM-Adresse",
                    value="practitioner@gluecklich.kim.telematik",
                ),
            },
            reason_system=reason_system,
            reason_code=reason_code,
            reason_references=reason_references,
            reason_text=reason_text,
            note_text=note_text
        )

    @staticmethod
    def create_bundle_entries():
        medication = MedicationCreator.get_example_medication()
        patient = PatientCreator.get_example_patient()
        medication_request = MedicationRequestCreator.create_medication_request(
            "160.100.000.000.001.36",
            medication.id,
            patient.id,
            "2mal tägl. 5ml",
            True,
        )
        requesting_organisation = OrganizationCreator.get_example_pflegeheim_organization()
        observations = [
            ObservationCreator.get_example_observation_datetime(patient.id),
            ObservationCreator.get_example_observation_quantity(patient.id),
        ]

        return {
            "medication": medication,
            "patient": patient,
            "medication_request": medication_request,
            "requesting_organisation": requesting_organisation,
            "observations": observations,
        }

    @staticmethod
    def create_request_bundle(
        use_case,
        use_case_display,
        request_id,
        type: str,
        sender_info,
        software_info,
        recipient_kim_address,
        status,
        reason_system,
        reason_code,
        reason_text,
        note_text
    ) -> Bundle:
        identifiers = {
            name: PrescriptionRequestCreator.create_identifier()
            for name in ["message", "ProcedureIdentifier"]
        }

        sender_info = ParticipantsCreator.create_sender(
            sender_info["telematik_id"], sender_info["display"]
        )

        source = ParticipantsCreator.create_source(
            software_info["name"],
            software_info["product"],
            software_info["version"],
            software_info["email"],
            software_info["endpoint"],
        )

        destination = ParticipantsCreator.create_destination(recipient_kim_address['display'], recipient_kim_address['kim_address'])

        entries = PrescriptionRequestCreator.create_bundle_entries()
        identifiers["RequestIdentifier"] = request_id
        identifiers["patient"] = entries["patient"].id
        identifiers["medication_request"] = entries["medication_request"].id
        identifiers["requesting_organisation"] = entries["requesting_organisation"].id
        observations_ids = [obs.id for obs in entries["observations"]]
        service_request = PrescriptionRequestCreator.create_service_request(
            status,
            type,
            observations_ids,
            identifiers,
            reason_system,
            reason_code,
            reason_text,
            note_text
        )

        bundle_entries = [
            BundleEntry(fullUrl=f"urn:uuid:{entry.id}", resource=entry)
            for entry_name, entry in entries.items()
            if entry_name != "observations"
        ] + [
            BundleEntry(fullUrl=f"urn:uuid:{obs.id}", resource=obs)
            for obs in entries["observations"]
        ]

        return (
            BundleCreator.create_request_bundle(
                identifiers["message"],
                sender_info,
                source,
                destination,
                service_request,
                entries["requesting_organisation"].id,
                additional_bundle_entries=bundle_entries,
                code_system="https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
                use_case=use_case,
                use_case_display=use_case_display,
            ),
            service_request,
        )
