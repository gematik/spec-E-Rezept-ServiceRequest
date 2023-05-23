import os
from typing import List
from app_transport_framework_library.atf_bundle_processor import ATF_BundleProcessor
from fhir.resources.bundle import Bundle


class Communicator:
    def __init__(self, processor_list: List[ATF_BundleProcessor]):
        self.processors = processor_list

    def send(self, receiver: str, messageType: str, message_bundle: Bundle):
        print(f"Sende '{messageType}' an '{receiver}'")
        self.write_result_ressource(receiver, messageType, message_bundle.json(indent=4))

        # Check if receiver matches processor address
        for processor in self.processors:
            if receiver == processor.sender['identifier'].value:
                processor.process_bundle(message_bundle)
                break

    def write_result_ressource(self, folder: str, file_name: str, ressource: str):
        path = os.path.join("./Rezeptanforderung/example_inbox/" + folder)
        if not os.path.exists(path):
            os.makedirs(path)
        file_name = file_name.replace(";", "_")
        with open(f"{path}/{file_name}.json", "w") as file:
            file.write(ressource)
            file.close()
