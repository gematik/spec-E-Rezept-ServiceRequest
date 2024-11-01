import logging
from healthcareservice_kim_client import HealthCareServiceKIMClient
from pvs_kim_client import PvsKIMClient
from avs_kim_client import PharmacyKIMClient
 


logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)-30s - %(levelname)-8s - %(message)s'
)


logger = logging.getLogger("Main")


def main():
    logger.debug("Initialisiere Clients...")
    pvs_client = PvsKIMClient(
        "Arztpraxis",
        {
            "kim_address": "mailto:practitioner@test.kim.de",
            "telematik_id": "5-test-telematik-id-praxis",
            "display": "Praxis Hans Topp-Glücklich",
        },
    )
    avs_client = PharmacyKIMClient(
        "Apotheke",
        {
            "kim_address": "mailto:pharmacy@test.kim.de",
            "telematik_id": "5-test-telematik-id-apotheke",
            "display": "Test Apotheke",
        },
    )
    health_care_service_client = HealthCareServiceKIMClient(
        "Pflegeheim Immergrün",
        {
            "kim_address": "mailto:pflegeheim@test.kim.de",
            "telematik_id": "5-test-telematik-id-pflegeinrichtung",
            "display": "Pflegeheim Immergrün",
        },
        pvs_client,
        avs_client,
    )

    # Schritt 1: Pflegeeinrichtung sendet eine Rezeptanforderung an den Arzt
    logger.info("Schritt 1: Rezeptanforderung von Pflegeeinrichtung an Arzt")
    patient_info = {
        "name": "Max Mustermann",
        "insuranceNumber": "G123456",
        "birthDate": "1980-05-15",
    }
    medication_info = {
        "medicationName": "Ibuprofen 400mg",
        "quantity": 2,
        "instructions": "Take one tablet every 8 hours as needed.",
    }
    health_care_service_client.send_prescription_request(
        pvs_client, patient_info, medication_info
    )

    # Arzt überprüft seinen Posteingang und bearbeitet die Rezeptanforderung
    logger.info("Schritt 2: Arzt bearbeitet die Rezeptanforderung")
    pvs_client.process_inbox()

    # Pflegeeinrichtung erhält die Antwort mit dem E-Rezept-Token vom Arzt
    logger.info(
        "Schritt 3: Pflegeeinrichtung erhält E-Rezept-Token und sendet es an Apotheke"
    )
    health_care_service_client.process_inbox()

    # Apotheke überprüft ihren Posteingang und bestätigt die Abgabe des Medikaments
    logger.info(
        "Schritt 4: Apotheke erhält den E-Rezept-Token und bestätigt die Abgabe"
    )
    avs_client.process_inbox()
    health_care_service_client.process_inbox()


if __name__ == "__main__":
    main()
