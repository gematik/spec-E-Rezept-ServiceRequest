from example_helper.communication_mock import ICommunicator


from app_transport_framework_library.atf_bundle_processor import ATF_BundleProcessor
from app_transport_framework_library.models.empfangsbestaetigung import Empfangsbestaetigung
from app_transport_framework_library.models.message_to_send import MessageToSend


class Primärsystem:
    def __init__(self, name: str, kim_address: str, communicator: ICommunicator, sender, software, destination):
        self.name = name
        self.kim_address = kim_address
        self.communicator = communicator
        self.sender = sender
        self.software = software
        self.destination = destination
        self.processor = self.initialize_processor(sender, software)

    def initialize_processor(self, sender, software):
        processor = ATF_BundleProcessor(sender, software)
        processor.message_to_send_event.subscribe(self.on_new_message_to_send)
        processor.received_Empfangsbestaetigung_event.subscribe(self.on_received_Empfangsbestaetigung)
        processor.bundle_content_to_process_event.subscribe(self.on_focus_Ressource_to_process)
        return processor

    def on_new_message_to_send(self, message_to_send: MessageToSend):
        self.communicator.send(
            message_to_send.receiver,
            message_to_send.message_type,
            message_to_send.atf_bundle,
        )

    def on_received_Empfangsbestaetigung(self, empfangsbestaetigung: Empfangsbestaetigung):
        print(f"'{empfangsbestaetigung.receiver}' received Empfangsbestaetigung for '{empfangsbestaetigung.message_id}' from '{empfangsbestaetigung.sender}'")
        print(empfangsbestaetigung.details.json(indent=4)
            .encode()
            .decode("unicode_escape")
        )

    def on_focus_Ressource_to_process(self, bundle_content):
        pass