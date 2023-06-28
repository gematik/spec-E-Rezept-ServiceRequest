from app_transport_framework_library.atf_bundle_processor import ATF_BundleProcessor
from example_helper.participants_mock import ParticipantsCreator
from example_helper.communication_mock import ICommunicator


from example_helper.participants_mock import ParticipantsCreator
from example_helper.communication_mock import FileSystemCommunicator


from app_transport_framework_library.models.message_to_send import MessageToSend
from app_transport_framework_library.models.bundle_content import (
    BundleContent,
)
from app_transport_framework_library.models.empfangsbestaetigung import (
    Empfangsbestaetigung,
)

from app_transport_framework_library.atf_bundle_processor import ATF_BundleProcessor
from Plegeeinrichtung.prescription_request_creator import PrescriptionRequestCreator

from AVS.use_case_handlers.rezeptanfrage_handler import RezeptanfrageHandler
from AVS.use_case_validators.rezeptanfrage_atf_validator import RezeptanfrageValidator



class Primärsystem:
    def __init__(self, name: str, communicator: ICommunicator, sender, software):
        self.name = name
        self.communicator = communicator

        self.processor = self.initialize_processor(sender, software)

    def initialize_processor(self, sender, software):
        processor = ATF_BundleProcessor(sender, software)
        processor.message_to_send_event.subscribe(self.on_new_message_to_send)
        processor.received_Empfangsbestaetigung_event.subscribe(
            self.on_received_Empfangsbestaetigung
        )
        processor.bundle_content_to_process_event.subscribe(
            self.on_focus_Ressource_to_process
        )
        return processor

    def on_new_message_to_send(self, message_to_send: MessageToSend):
        self.communicator.send(
            message_to_send.receiver,
            message_to_send.message_type,
            message_to_send.atf_bundle,
        )

    def on_received_Empfangsbestaetigung(
        self, empfangsbestaetigung: Empfangsbestaetigung
    ):
        pass

    def on_focus_Ressource_to_process(self, bundle_content):
        pass


class Pflegeeinrichtung(Primärsystem):
    def on_received_Empfangsbestaetigung(
        self, empfangsbestaetigung: Empfangsbestaetigung
    ):
        print(
            f"'{empfangsbestaetigung.receiver}' received Empfangsbestaetigung for '{empfangsbestaetigung.message_id}' from '{empfangsbestaetigung.sender}'"
        )
        print(
            empfangsbestaetigung.details.json(indent=4)
            .encode()
            .decode("unicode_escape")
        )

    def on_focus_Ressource_to_process(self, bundle_content: BundleContent):
        print(f"Processing Bundle with focus on '{bundle_content.code}'")
        if bundle_content.code == "eRezept_Rezeptanforderung;Rezeptbestaetigung":
            print("Pflegeinrichtung hat Rezeptbestaetigung erhalten.")


class Arztpraxis(Primärsystem):
    def on_focus_Ressource_to_process(self, bundle_content: BundleContent):
        print(f"Processing Bundle with focus on '{bundle_content.service_identifier.code}'")
        if bundle_content.service_identifier.code == "eRezept_Rezeptanforderung;Rezeptanfrage":
            message_to_send = RezeptanfrageHandler(sender_arztpraxis, software_arztpraxis).handle(bundle_content)
            self.on_new_message_to_send(message_to_send)


communicator = FileSystemCommunicator([])

sender_pflegeeinrichtung = ParticipantsCreator.create_sender(
    "pflegeheim.immergrün.arzt@sana-pflegeheime.kim.telematik", "Pflegeheim Immergrün"
)
software_pflegeeinrichtung = ParticipantsCreator.create_source(
    "PSSolutions",
    "Globotron 500",
    "2.1.3",
    "dev@ps_solutions.de",
    "https://ps_solutions.com/jira_helpdesk",
)
pflegeeinrichtung = Pflegeeinrichtung(
    "Pflegeeinrichtung",
    communicator,
    sender_pflegeeinrichtung,
    software_pflegeeinrichtung,
)

kim_address_arzt = "praxis.hasenbein@gluecklich.kim.telematik"
sender_arztpraxis = ParticipantsCreator.create_sender(
    kim_address_arzt, "Praxis Dr. Hasenbein"
)
software_arztpraxis = ParticipantsCreator.create_source(
    "DeltaCare Inc.",
    "PraxisFix",
    "1.3.2",
    "issues@praxisfix-deltacare.de",
    "https://deltacare.de/praxisfix/issues",
)

destination_arzt = ParticipantsCreator.create_destinations(
    kim_address_arzt, "Praxis Dr. Hasenbein", "http://www.praxis.hasenbein@test.de"
)

arztpraxis = Arztpraxis(
    "Praxis Dr. Hasenbein", communicator, sender_arztpraxis, software_arztpraxis
)

arztpraxis.processor.register_use_case_handler(
    "https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
    "eRezept_Rezeptanforderung;Rezeptanfrage",
    RezeptanfrageValidator(sender_arztpraxis, software_arztpraxis),
)


# add processors to the communicator
communicator.processors.extend([pflegeeinrichtung.processor, arztpraxis.processor])

# UC1_1 Rezeptanforderung wird von Pflegeeinrichtung gestellt und eine Rezeptbestätigung durch den Arzt erwartet
prescription_request = PrescriptionRequestCreator.create_prescription_request(
    sender_pflegeeinrichtung, software_pflegeeinrichtung, destination_arzt
)

communicator.send(
    receiver=kim_address_arzt,
    messageType=f"eRezept_Rezeptanforderung;Rezeptanfrage",
    message_bundle=prescription_request,
)
