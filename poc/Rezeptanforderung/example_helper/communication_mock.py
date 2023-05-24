import os
from typing import List
from app_transport_framework_library.atf_bundle_processor import ATF_BundleProcessor
from fhir.resources.bundle import Bundle


class ICommunicator:
    def send(self, receiver: str, messageType: str, message_bundle: Bundle):
        pass


class FileSystemCommunicator(ICommunicator):
    def __init__(self, processors: List[ATF_BundleProcessor]):
        self.processors = processors

    def send(self, receiver: str, messageType: str, message_bundle: Bundle):
        print(f"Sende '{messageType}' an '{receiver}'")
        self.write_result_ressource(
            receiver, messageType, message_bundle.json(indent=4,ensure_ascii=False))

        # Check if receiver matches processor address
        for processor in self.processors:
            if receiver == processor.sender['identifier'].value:
                processor.process_bundle(message_bundle)
                break

    def write_result_ressource(self, folder: str, file_name: str, ressource: str):
        path = os.path.join("./example_inbox/" + folder)
        if not os.path.exists(path):
            os.makedirs(path)
        file_name = file_name.replace(";", "_")
        with open(f"{path}/{file_name}.json", "w") as file:
            file.write(ressource.encode().decode(
                'unicode_escape'))
