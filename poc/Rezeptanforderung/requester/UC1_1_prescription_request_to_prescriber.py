from example_helper.communication_mock import (
    Communicator,
)
from example_helper.participants_mock import ParticipantsCreator
from ressource_creators.prescription_request_creator import (
    PrescriptionRequestCreator,
)


from app_transport_framework_library.models.message_to_send import MessageToSend
from app_transport_framework_library.models.bundle_focus_content import (
    BundleFocusContent,
)
from app_transport_framework_library.models.empfangsbestaetigung import (
    Empfangsbestaetigung,
)

from app_transport_framework_library.atf_bundle_processor import ATF_BundleProcessor

communicator = Communicator()


def on_new_message_to_send(message_to_send: MessageToSend):
    communicator.send(
        message_to_send.receiver,
        message_to_send.message_type,
        message_to_send.atf_bundle.json(indent=4),
    )
    if message_to_send.receiver == kim_address_arzt:
        processor_arztpraxis.process_bundle(message_to_send.atf_bundle)
    elif message_to_send.receiver == kim_address_pflegeeinrichtung:
        processor_pflegeeinrichtung.process_bundle(
            message_to_send.atf_bundle
        )


def on_received_Empfangsbestaetigung(empfangsbestaetigung: Empfangsbestaetigung):
    print(
         f"'{empfangsbestaetigung.receiver}' received Empfangsbestaetigung for '{empfangsbestaetigung.message_id}' from '{empfangsbestaetigung.sender}'"
    )
    print(empfangsbestaetigung.details.json(indent=4))


def on_focus_Ressource_to_process_pflegeinrichtung(bundle_content: BundleFocusContent):
    print(f"Processing Bundle with focus on '{bundle_content.code}'")
    if bundle_content.code == "eRezept_Rezeptanforderung;Rezeptbestaetigung":
        print("Pflegeinrichtung hat Rezeptbestaetigung erhalten.")


def on_focus_Ressource_to_process_arztpraxis(bundle_content: BundleFocusContent):
    print(f"Processing Bundle with focus on '{bundle_content.code}'")
    if bundle_content.code == "eRezept_Rezeptanforderung;Rezeptanfrage":
        print("Arztpraxis hat Rezeptanforderung erhalten.")


# initialise ATF for Pflegeeinrichtung
kim_address_pflegeeinrichtung = (
    "pflegeheim.immergrün.arzt@sana-pflegeheime.kim.telematik"
)
sender_pflegeeinrichtung = ParticipantsCreator.create_sender(
    kim_address_pflegeeinrichtung, "Pflegeheim Immergrün"
)
software_pflegeeinrichtung = ParticipantsCreator.create_source(
    "PSSolutions",
    "Globotron 500",
    "2.1.3",
    "dev@ps_solutions.de",
    "https://ps_solutions.com/jira_helpdesk",
)
processor_pflegeeinrichtung = ATF_BundleProcessor(
    sender_pflegeeinrichtung, software_pflegeeinrichtung
)
processor_pflegeeinrichtung.message_to_send_event.subscribe(on_new_message_to_send)
processor_pflegeeinrichtung.received_Empfangsbestaetigung_event.subscribe(
    on_received_Empfangsbestaetigung
)
processor_pflegeeinrichtung.focus_Ressource_to_process_event.subscribe(
    on_focus_Ressource_to_process_pflegeinrichtung
)
kim_address_arzt = "hasenbein@gluecklich.kim.telematik"
destination_arzt = ParticipantsCreator.create_destinations(
    kim_address_arzt, "Praxis Dr. Hasenbein", "https://unknown.endpoint.de"
)


# initialise ATF for Arztpraxis
sender_arztpraxis = ParticipantsCreator.create_sender(
    "hasenbein@gluecklich.kim.telematik", "Praxis Dr. Hasenbein"
)
software_arztpraxis = ParticipantsCreator.create_source(
    "DeltaCare Inc.",
    "PraxisFix",
    "1.3.2",
    "issues@praxisfix-deltacare.de",
    "https://deltacare.de/praxisfix/issues",
)
processor_arztpraxis = ATF_BundleProcessor(sender_arztpraxis, software_arztpraxis)
processor_arztpraxis.message_to_send_event.subscribe(on_new_message_to_send)
processor_arztpraxis.received_Empfangsbestaetigung_event.subscribe(
    on_received_Empfangsbestaetigung
)
processor_arztpraxis.focus_Ressource_to_process_event.subscribe(
    on_focus_Ressource_to_process_arztpraxis
)

# UC1_1 Rezeptanforderung wird von Pflegeeinrichtung gestellt und eine Rezeptbestätigung durch den Arzt erwartet
prescription_request = PrescriptionRequestCreator.create_prescription_request(
    sender_pflegeeinrichtung, software_pflegeeinrichtung, destination_arzt
)

communicator.send(
    receiver="practitioner@gluecklich.kim.telematik",
    messageType=f"eRezept_Rezeptanforderung;Rezeptanfrage",
    message=prescription_request.json(indent=4),
)
processor_arztpraxis.process_bundle(prescription_request)
