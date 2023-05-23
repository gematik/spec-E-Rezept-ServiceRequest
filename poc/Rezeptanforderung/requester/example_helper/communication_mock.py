import os


class Communicator:
    def send(self, receiver: str, messageType: str, message: str):
        print(f"Sende '{messageType}' an '{receiver}'")
        self.write_result_ressource(receiver, messageType, message)

    def write_result_ressource(self, folder: str, file_name: str, ressource: str):
        path = os.path.join("./Rezeptanforderung/example_inbox/" + folder)
        if not os.path.exists(path):
            os.makedirs(path)
        file_name = file_name.replace(";", "_")
        with open(f"{path}/{file_name}.json", "w") as file:
            file.write(ressource)
            file.close()
