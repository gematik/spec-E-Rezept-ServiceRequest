from typing import List
from uuid import uuid4
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
            value="hans@ytopp-gluecklich.kim.telematik",
        ),
        display="Receiver",
    )
    destinations = [
        MessageHeaderDestination(
            endpoint="http://ytopp-gluecklich.de/issues", receiver=receiver
        )
    ]

    return destinations


def get_example_serviceRequest() -> ServiceRequest:
    request_identifier = str(uuid4())
    predis_identifier = str(uuid4())
    vorgangs_id = str(uuid4())
    medication = MedicationCreator.get_example_medication()
    patient = PatientCreator.get_example_patient()
    requesting_organisation = OrganizationCreator.get_example_organization()
    reason_references = [
        ObservationCreator.get_example_observation_datetime(),
        ObservationCreator.get_example_observation_quantity(),
    ]
    medication_request = MedicationRequestCreator.create_medication_request(
        "160.100.000.000.001.36", medication.id, patient.id, "2mal tägl. 5ml", True
    )

    return ServiceRequestCreator.create_service_request(
        request_identifier,
        predis_identifier,
        medication_request.id,
        vorgangs_id,
        patient,
        requesting_organisation,
        performer_identifier="hans@ytopp-gluecklich.kim.telematik",
        reason_code="medication-runs-out",
        reason_references=reason_references,
        note_text="Medikament läuft am 31.01.2023 aus. Es sind noch 7 stk übrig.",
    )


message_id = str(uuid4())
bundle_to_send = MessageContainerCreator.create_prescriptionRequest_bundle(
    message_id,
    sender=get_example_sender(),
    source=get_example_source(),
    destinations=get_example_practitioner_destinations(),
    service_request=get_example_serviceRequest(),
)

print(bundle_to_send)
