import logging
from healthcareservice_kim_client import HealthCareServiceKIMClient
from pvs_kim_client import PvsKIMClient
from pharmacy_kim_client import PharmacyKIMClient
from helper.logging_setup import setup_logger

# Logger für das Hauptskript
logger = setup_logger("Main", level=logging.INFO)

def main():
    # Instanzen für alle beteiligten Parteien erstellen
    logger.info("Initialisiere Clients...")
    health_care_service_client = HealthCareServiceKIMClient("Pflegeeinrichtung_A")
    doctor_client = PvsKIMClient("Arzt_B")
    pharmacy_client = PharmacyKIMClient("Apotheke_C")

    # Schritt 1: Pflegeeinrichtung sendet eine Rezeptanforderung an den Arzt
    logger.info("Schritt 1: Rezeptanforderung von Pflegeeinrichtung an Arzt")
    patient_info = {
        "name": "Max Mustermann",
        "insuranceNumber": "G123456",
        "birthDate": "1980-05-15"
    }
    medication_info = {
        "medicationName": "Ibuprofen 400mg",
        "quantity": 2,
        "instructions": "Take one tablet every 8 hours as needed."
    }
    health_care_service_client.send_prescription_request("Arzt_B", patient_info, medication_info)

    # Arzt überprüft seinen Posteingang und bearbeitet die Rezeptanforderung
    logger.info("Schritt 2: Arzt bearbeitet die Rezeptanforderung")
    doctor_client.check_inbox()

    # Pflegeeinrichtung erhält die Antwort mit dem E-Rezept-Token vom Arzt
    logger.info("Schritt 3: Pflegeeinrichtung erhält E-Rezept-Token und sendet es an Apotheke")
    health_care_service_client.check_inbox()

    # Apotheke überprüft ihren Posteingang und bestätigt die Abgabe des Medikaments
    logger.info("Schritt 4: Apotheke erhält den E-Rezept-Token und bestätigt die Abgabe")
    pharmacy_client.check_inbox()
    health_care_service_client.check_inbox()

if __name__ == "__main__":
    main()