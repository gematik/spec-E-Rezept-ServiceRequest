import random
import string


class FachdienstMock:
    def __init__(self):
        self.token_prefix = "Task/160."
        self.token_suffix = "/$accept?ac="

    def generate_random_task_id(self):
        # Erzeugen eines zufälligen Task-ID
        random_task_id = '.'.join(str(random.randint(100, 999))
                                  for _ in range(4))
        return self.token_prefix + random_task_id

    def activate(self):
        # Erzeugen eines zufälligen Hexadezimal-Codes
        random_hex = ''.join(random.choices(string.hexdigits, k=64))
        random_task_id = self.generate_random_task_id()
        return random_task_id + self.token_suffix + random_hex