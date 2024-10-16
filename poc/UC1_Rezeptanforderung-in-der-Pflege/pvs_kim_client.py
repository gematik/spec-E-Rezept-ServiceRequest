import logging
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from helper.kim_client import KIMClient
from helper.logging_setup import setup_logger

# Logger für den Arzt einrichten
logger = setup_logger("Arzt_B", level=logging.INFO)

class PvsKIMClient(KIMClient):
    def process_message(self, message_content):
        # Empfangene Nachricht prüfen
        logger.debug("Empfangene Nachricht durch Arzt: %s", message_content)
        inner_content = message_content.get("content", {})

        if inner_content.get("eventCode") == "#eRezept_Rezeptanforderung;Rezeptanfrage":
            # Arzt verarbeitet die Rezeptanforderung
            logger.info("Arzt hat eine Rezeptanforderung erhalten.")
            prescription_id = "RX123456"
            access_code = "AC987654"
            
            # Sicherstellen, dass der `requester` korrekt aus der eingehenden Nachricht extrahiert wird
            requester = inner_content.get("requester")
            if not requester:
                logger.warning("Der `requester` ist nicht in der Nachricht angegeben.")
                requester = "Unbekannt"

            # Antwort mit E-Rezept-Token erstellen
            response = {
                "eventCode": "#eRezept_Rezeptanforderung;Rezeptbestaetigung",
                "status": "completed",
                "ePrescriptionToken": f"{prescription_id}:{access_code}",
                "originalRequest": inner_content
            }

            # Antwort zurück an die Pflegeeinrichtung senden
            logger.info("Sende E-Rezept-Bestätigung an: %s", requester)
            self.send_message(requester, "KIM-E-Rezept-Bestätigung", "Rezeptbestaetigung", response)

        else:
            logger.warning("Unerwartete Nachricht empfangen: %s", message_content)