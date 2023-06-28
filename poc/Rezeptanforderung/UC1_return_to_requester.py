from app_transport_framework_library.atf_bundle_processor import ATF_BundleProcessor
from app_transport_framework_library.models.message_to_send import MessageToSend
from app_transport_framework_library.atf_bundle_processor import ATF_BundleProcessor
from app_transport_framework_library.models.bundle_content import BundleContent
from app_transport_framework_library.models.empfangsbestaetigung import Empfangsbestaetigung
from PVS.use_case_handlers.rezeptanfrage_handler import RezeptanfrageHandler
from PVS.use_case_validators.rezeptanfrage_atf_validator import RezeptanfrageValidator
from Pflegeeinrichtung.use_case_handlers.rezeptbestaetigung_handler import RezeptbestaetigungHandler
from Pflegeeinrichtung.use_case_validators.rezeptbestaetigung_atf_validator import RezeptbestaetigungValidator
from Pflegeeinrichtung.ressource_creators.prescription_request_creator import PrescriptionRequestCreator
from Pflegeeinrichtung.ressource_creators.dispense_request_creator import DispenseRequestCreator
from example_helper.communication_mock import FileSystemCommunicator, ICommunicator
from example_helper.participants_mock import ParticipantsCreator



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
        print(f"'{empfangsbestaetigung.receiver}' received Empfangsbestaetigung for '{empfangsbestaetigung.message_id}' from '{empfangsbestaetigung.sender}'")
        print(empfangsbestaetigung.details.json(indent=4)
            .encode()
            .decode("unicode_escape")
        )

    def on_focus_Ressource_to_process(self, bundle_content):
        pass


class Pflegeeinrichtung(Primärsystem):
    def on_focus_Ressource_to_process(self, bundle_content: BundleContent):
        print(f"'{self.name }' processing Bundle with focus on '{bundle_content.service_identifier.code}'")
        if bundle_content.service_identifier.code == "eRezept_Rezeptanforderung;Rezeptbestaetigung":
            has_taken = RezeptbestaetigungHandler(sender_pflegeeinrichtung, software_pflegeeinrichtung).handle(bundle_content)
            if has_taken:
                dispense_request = DispenseRequestCreator.create_dispense_request_bundle(
                   sender_pflegeeinrichtung, software_pflegeeinrichtung, destination_apotheke, bundle_content)
                communicator.send(
                    receiver=kim_address_apotheke,
                    messageType=f"eRezept_Rezeptanforderung;Abgabeanfrage",
                    message_bundle=dispense_request,
)
                

            


class Arztpraxis(Primärsystem):
    def on_focus_Ressource_to_process(self, bundle_content: BundleContent):
        print(f"'{self.name }' processing Bundle with focus on '{bundle_content.service_identifier.code}'")
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

pflegeeinrichtung.processor.register_use_case_handler(
    "https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
    "eRezept_Rezeptanforderung;Rezeptbestaetigung",
    RezeptbestaetigungValidator(sender_pflegeeinrichtung,software_pflegeeinrichtung )
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
kim_address_apotheke = "arbeitsplatz-1@test-apotheke.kim.telematik"
sender_apotheke = ParticipantsCreator.create_sender(
    kim_address_apotheke, "Test Apotheke"
)
software_apotheke = ParticipantsCreator.create_source(
    "DeltaCare Inc.",
    "PraxisFix",
    "1.3.2",
    "issues@praxisfix-deltacare.de",
    "https://deltacare.de/praxisfix/issues",
)

destination_apotheke = ParticipantsCreator.create_destinations(
    kim_address_apotheke, "Testapotheke", "http://www.test-apotheke.de"
)


# add processors to the communicator
communicator.processors.extend([pflegeeinrichtung.processor, arztpraxis.processor])

# UC1_1 Rezeptanforderung wird von Pflegeeinrichtung gestellt und eine Rezeptbestätigung durch den Arzt erwartet
prescription_request = PrescriptionRequestCreator.create_prescription_request_bundle(
    "return-to-requester", sender_pflegeeinrichtung, software_pflegeeinrichtung, destination_arzt
)

communicator.send(
    receiver=kim_address_arzt,
    messageType=f"eRezept_Rezeptanforderung;Rezeptanfrage",
    message_bundle=prescription_request,
)
