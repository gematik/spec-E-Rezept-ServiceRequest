from typing import List
from uuid import uuid4
from example_helper.communication_mock import (
    Communicator,
)
from ressource_creators.oberservation_creator import ObservationCreator
from ressource_creators.organization_creator import OrganizationCreator
from ressource_creators.patient_creator import PatientCreator
from ressource_creators.medication_creator import MedicationCreator
from ressource_creators.medication_request_creator import MedicationRequestCreator
from ressource_creators.service_request_creator import ServiceRequestCreator
from ressource_creators.message_container_creator import MessageContainerCreator
from fhir.resources.fhirtypes import ReferenceType, ContactPointType
from fhir.resources.identifier import Identifier
from fhir.resources.messageheader import MessageHeaderDestination, MessageHeaderSource
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.bundle import BundleEntry


def get_example_sender() -> ReferenceType:
    sender = ReferenceType(
        identifier=Identifier(
            system="http://gematik.de/fhir/sid/KIM-Adresse",
            value="pflegeheim.immergrün.arzt@sana-pflegeheime.kim.telematik",
        ),
        display="Sender",
    )
    return sender


def get_example_source() -> MessageHeaderSource:
    receiver_source = MessageHeaderSource(
        name="PSSolutions",
        software="Globotron 500",
        version="2.1.3",
        contact=ContactPointType(system="email", value="dev@ps_solutions.com"),
        endpoint="https://ps_solutions.com/jira_helpdesk",
    )
    return receiver_source


def get_example_practitioner_destinations() -> List[MessageHeaderDestination]:
    receiver = ReferenceType(
        identifier=Identifier(
            system="http://gematik.de/fhir/sid/KIM-Adresse",
            value="practitioner@gluecklich.kim.telematik",
        ),
        display="Receiver",
    )
    destinations = [
        MessageHeaderDestination(
            endpoint="http://@gluecklich.de/issues", receiver=receiver
        )
    ]

    return destinations


def get_example_serviceRequest(
    patient_id: str,
    requesting_organisation_id: str,
    medication_request_id: str,
    observation_1_id: str,
    observation_2_id: str,
) -> ServiceRequest:
    request_identifier = str(uuid4())
    predis_identifier = str(uuid4())
    vorgangs_id = str(uuid4())

    reason_references = [
        observation_1_id,
        observation_2_id,
    ]

    return ServiceRequestCreator.create_service_request(
        request_identifier,
        predis_identifier,
        medication_request_id,
        vorgangs_id,
        patient_id,
        requesting_organisation_id,
        performer_identifier="practitioner@gluecklich.kim.telematik",
        reason_code="medication-runs-out",
        reason_references=reason_references,
        note_text="Medikament läuft am 31.01.2023 aus. Es sind noch 7 stk übrig.",
    )


def create_bundle_entries():
    medication = MedicationCreator.get_example_medication()
    patient = PatientCreator.get_example_patient()
    medication_request = MedicationRequestCreator.create_medication_request(
        "160.100.000.000.001.36", medication.id, patient.id, "2mal tägl. 5ml", True
    )
    requesting_organisation = OrganizationCreator.get_example_organization()
    observation_1 = ObservationCreator.get_example_observation_datetime()
    observation_2 = ObservationCreator.get_example_observation_quantity()
    return (
        medication,
        patient,
        medication_request,
        requesting_organisation,
        observation_1,
        observation_2,
    )


message_id = str(uuid4())

sender = get_example_sender()
source = get_example_source()
destinations = get_example_practitioner_destinations()


(
    medication,
    patient,
    medication_request,
    requesting_organisation,
    observation_1,
    observation_2,
) = create_bundle_entries()

bundle_to_send = MessageContainerCreator.create_prescriptionRequest_bundle(
    message_id,
    sender,
    source,
    destinations,
    service_request=get_example_serviceRequest(
        patient.id,
        requesting_organisation.id,
        medication_request.id,
        observation_1.id,
        observation_2.id,
    ),
    additional_bundle_entries=[
        BundleEntry(fullUrl=f"urn:uuid:{medication.id}", resource=medication),
        BundleEntry(fullUrl=f"urn:uuid:{patient.id}", resource=patient),
        BundleEntry(
            fullUrl=f"urn:uuid:{medication_request.id}", resource=medication_request
        ),
        BundleEntry(
            fullUrl=f"urn:uuid:{requesting_organisation.id}",
            resource=requesting_organisation,
        ),
        BundleEntry(fullUrl=f"urn:uuid:{observation_1.id}", resource=observation_1),
        BundleEntry(fullUrl=f"urn:uuid:{observation_2.id}", resource=observation_2),
    ],
)


print(bundle_to_send.json(indent=4))
communicator = Communicator()

communicator.send(
    "practitioner@gluecklich.kim.telematik",
    f"eRezept_Rezeptanforderung;Rezeptanfrage",
    bundle_to_send.json(indent=4),
)
