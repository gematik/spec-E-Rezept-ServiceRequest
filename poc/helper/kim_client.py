import os
import shutil
import json
import logging  # Logging importieren
from datetime import datetime
from abc import ABC, abstractmethod

from helper.logging_setup import setup_logger

# Logger für KIMClient erstellen
logger = setup_logger("KIMClient", level=logging.ERROR)

class KIMClient(ABC):
    def __init__(self, client_name):
        self.client_name = client_name
        self.inbox = f"./{client_name}/inbox"
        self.outbox = f"./{client_name}/outbox"
        os.makedirs(self.inbox, exist_ok=True)
        os.makedirs(self.outbox, exist_ok=True)
        logger.info(f"KIM Client initialized: {client_name}")
    
    def send_message(self, recipient, kim_dienstkennung, subject, message_content, attachments=None):
        """
        Send a KIM message by saving a JSON file in the recipient's inbox.
        
        Parameters:
        - recipient: The name of the recipient client.
        - kim_dienstkennung: The KIM service ID for sending the message.
        - subject: The subject of the KIM message.
        - message_content: The main content of the message.
        - attachments: Optional list of file paths for attachments.
        """
        message_filename = f"message_{datetime.now().strftime('%Y%m%d%H%M%S')}.json"
        outbox_path = os.path.join(self.outbox, message_filename)

        # Include the necessary fields in the message structure
        message = {
            "kim_dienstkennung": kim_dienstkennung,
            "subject": subject,
            "content": message_content,
            "attachments": []
        }
        
        # If attachments are provided, add them to the message
        if attachments:
            for attachment in attachments:
                if os.path.isfile(attachment):
                    # Copy attachment to outbox
                    attachment_filename = os.path.basename(attachment)
                    attachment_outbox_path = os.path.join(self.outbox, attachment_filename)
                    shutil.copy(attachment, attachment_outbox_path)
                    # Record the attachment filename in the message
                    message["attachments"].append(attachment_filename)
                    logger.debug(f"Attachment {attachment} added to message.")
                else:
                    logger.warning(f"Warning: Attachment {attachment} not found.")
        
        # Write the message to the sender's outbox
        with open(outbox_path, "w") as f:
            json.dump(message, f, indent=2)
        
        # Transfer the message to the recipient's inbox
        recipient_inbox = f"./{recipient}/inbox"
        os.makedirs(recipient_inbox, exist_ok=True)
        shutil.move(outbox_path, os.path.join(recipient_inbox, message_filename))
        
        logger.info(f"Message sent from {self.client_name} to {recipient}: {message_filename}")
    
    def check_inbox(self):
        """
        Check if there are new messages in the inbox and process them.
        This function calls the abstract process_message method.
        """
        messages = os.listdir(self.inbox)
        for message_file in messages:
            message_path = os.path.join(self.inbox, message_file)
            
            with open(message_path, "r") as f:
                message_content = json.load(f)
            
            logger.info(f"New message received by {self.client_name}: {message_file}")
            
            # Use the process_message method (must be implemented in subclass)
            self.process_message(message_content)
            
            # Remove the message after processing
            os.remove(message_path)
            logger.debug(f"Message {message_file} processed and removed from inbox.")
    
    @abstractmethod
    def process_message(self, message_content):
        """
        Abstract method to process incoming messages. Must be implemented by subclasses.
        """
        pass


# Example subclass implementing the process_message method
class CustomKIMClient(KIMClient):
    def process_message(self, message_content):
        logger.info("Custom Processing: Handling message with subject: %s", message_content.get("subject"))
        logger.debug("Message Content: %s", message_content.get("content"))
        if message_content.get("attachments"):
            logger.debug("Attachments: %s", message_content.get("attachments"))


# Example Usage
if __name__ == "__main__":
    # Create an instance of the CustomKIMClient
    client_a = CustomKIMClient("Client_A")
    client_b = CustomKIMClient("Client_B")

    # Example attachments
    example_attachments = ["./sample_attachment.pdf"]
    
    # Client A sends a message to Client B with subject, KIM service ID, and attachments
    example_message = {
        "id": "msg001",
        "content": "This is a test message with a subject and attachments."
    }
    client_a.send_message("Client_B", "KIM123", "Test Subject", example_message, example_attachments)
    
    # Client B checks and processes its inbox
    client_b.check_inbox()