from typing import List, Dict
from uuid import uuid4
from fhir.resources.fhirtypes import ReferenceType
from fhir.resources.identifier import Identifier
from fhir.resources.messageheader import MessageHeaderDestination, MessageHeaderSource
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.bundle import Bundle, BundleEntry
from Pflegeeinrichtung.ressource_creators.medication_creator import MedicationCreator
from Pflegeeinrichtung.ressource_creators.medication_request_creator import MedicationRequestCreator
from Pflegeeinrichtung.ressource_creators.message_container_creator import MessageContainerCreator
from Pflegeeinrichtung.ressource_creators.oberservation_creator import ObservationCreator
from Pflegeeinrichtung.ressource_creators.organization_creator import OrganizationCreator
from Pflegeeinrichtung.ressource_creators.patient_creator import PatientCreator
from Pflegeeinrichtung.ressource_creators.service_request_creator import ServiceRequestCreator


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
    ) -> ServiceRequest:
        return ServiceRequestCreator.create_service_request(
            "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-prescription-request",
            "order",
            "prescription-request",
            status,
            order_detail_code,
            identifiers={
                "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier": identifiers["request"],
                "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier": identifiers["predis"],
                "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier": identifiers["vorgangs"],
            },
            references={
                "based_on": identifiers["medication_request"],
                "patient": identifiers["patient"],
                "requester": identifiers["requesting_organisation"],
                "performer": Identifier(
                    system="http://gematik.de/fhir/sid/KIM-Adresse",
                    value="practitioner@gluecklich.kim.telematik",
                ),
            },
            reason_code="medication-runs-out",
            reason_references=reason_references,
            note_text="Medikament läuft am 31.01.2023 aus. Es sind noch 7 stk übrig.",
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
        requesting_organisation = OrganizationCreator.get_example_organization()
        observations = [
            ObservationCreator.get_example_observation_datetime(),
            ObservationCreator.get_example_observation_quantity(),
        ]

        return {
            "medication": medication,
            "patient": patient,
            "medication_request": medication_request,
            "requesting_organisation": requesting_organisation,
            "observations": observations,
        }

    @staticmethod
    def create_prescription_request_bundle(
        type: str,
        sender: ReferenceType,
        source: MessageHeaderSource,
        destinations: List[MessageHeaderDestination],
    ) -> Bundle:
        identifiers = {
            name: PrescriptionRequestCreator.create_identifier()
            for name in [
                "message",
                "request",
                "predis",
                "vorgangs",
                "patient",
                "requesting_organisation",
                "medication_request",
            ]
        }

        entries = PrescriptionRequestCreator.create_bundle_entries()
        observations_ids = [obs.id for obs in entries["observations"]]
        service_request = PrescriptionRequestCreator.create_service_request(
            "active", type, observations_ids, identifiers
        )

        bundle_entries = [
            BundleEntry(fullUrl=f"urn:uuid:{entry.id}", resource=entry)
            for entry_name, entry in entries.items()
            if entry_name != "observations"
        ] + [
            BundleEntry(fullUrl=f"urn:uuid:{obs.id}", resource=obs)
            for obs in entries["observations"]
        ]

        return MessageContainerCreator.create_request_bundle(
            identifiers["message"],
            sender,
            source,
            destinations,
            service_request,
            additional_bundle_entries=bundle_entries,
            code_system="https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
            use_case="eRezept_Rezeptanforderung;Rezeptanfrage",
            use_case_display="Anfrage an einen Arzt ein Rezept auszustellen"
        )
