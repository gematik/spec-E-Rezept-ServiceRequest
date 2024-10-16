import logging
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from helper.kim_client import KIMClient
from helper.logging_setup import setup_logger

# Logger für die Apotheke einrichten
logger = setup_logger("Apotheke_C", level=logging.INFO)

class PharmacyKIMClient(KIMClient):
    def process_message(self, message_content):
        logger.debug("Empfangene Nachricht durch Apotheke: %s", message_content)

        inner_content = message_content.get("content", {})

        if inner_content.get("eventCode") == "#eRezept_Rezeptanforderung;Abgabeanfrage":
            logger.info("Apotheke hat eine Abgabeanfrage erhalten.")
            # Überprüfung der Nachricht auf den E-Rezept-Token
            e_prescription_token = inner_content.get("ePrescriptionToken")
            if e_prescription_token:
                logger.debug("E-Rezept-Token geprüft: %s", e_prescription_token)
                # Weiterleiten der Bestätigung an die Pflegeeinrichtung
                self.send_dispense_confirmation(inner_content.get("requester"))
            else:
                logger.warning("Kein gültiger E-Rezept-Token gefunden in der Abgabeanfrage.")
                logger.info("Empfangene Nachricht durch Apotheke: %s", message_content)

        else:
            logger.warning("Unerwartete Nachricht empfangen: %s", message_content)

        
        

    def send_dispense_confirmation(self, health_care_service):
        response = {
            "eventCode": "#eRezept_Rezeptanforderung;Abgabebestaetigung",
            "status": "completed",
            "confirmation": "Die Abgabe ist erfolgt."
        }
        # Loggen der Abgabebestätigung
        logger.info("Sende Abgabebestätigung an Pflegeeinrichtung: %s", health_care_service)
        self.send_message(health_care_service, "KIM-Abgabebestätigung", "Abgabebestaetigung", response)