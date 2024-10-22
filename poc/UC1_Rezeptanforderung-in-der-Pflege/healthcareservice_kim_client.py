import logging
import sys
import os
from uuid import uuid4



sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from helper.ressource_creators.prescription_request_creator import PrescriptionRequestCreator
from helper.renderer.html_renderer import HTMLRenderer
from helper.kim_client import KIMClient
from helper.logging_setup import setup_logger
from helper.file_handler import FileHandler

# Logger für die Pflegeeinrichtung einrichten
logger = setup_logger("Pflegeeinrichtung_A", level=logging.INFO)


class HealthCareServiceKIMClient(KIMClient):
    def __init__(self, client_name, kim_address, pvs_client):
        self.pvs_client = pvs_client
        super().__init__(client_name, kim_address)
        self.html_renderer = HTMLRenderer()
        self.file_handler = FileHandler(self.attachment_folder,self.html_renderer)
        self.software_info = {
            "name": "HealthCare-Source",
            "product": "HealthCare-Software",
            "version": "1.0.0",
            "email": "info@hcs.email",
            "website": "https://ps_solutions.com/jira_helpdesk",
        }

    def process_message(self, message_content):
        logger.debug(
            "Empfangene Nachricht durch Pflegeeinrichtung: %s", message_content
        )
        inner_content = message_content.get("content", {})
        if inner_content.get("eventCode") == "#eRezept_Abgabebestaetigung":
            logger.info("Pflegeeinrichtung hat eine Abgabebestaetigung erhalten.")

        elif (
            inner_content.get("eventCode")
            == "#eRezept_Rezeptanforderung;Rezeptbestaetigung"
        ):
            logger.info("Pflegeeinrichtung hat eine Rezeptbestaetigung erhalten.")

            # Logik für die Bearbeitung des E-Rezept-Tokens
            if inner_content.get("ePrescriptionToken"):
                logger.info(
                    "E-Rezept-Token erhalten: %s", inner_content["ePrescriptionToken"]
                )
                self.send_dispensation_request(
                    "Apotheke_C",
                    inner_content.get("requester"),
                    inner_content.get("medication"),
                    inner_content.get("ePrescriptionToken"),
                )

            else:
                logger.warning(
                    "Kein gültiger E-Rezept-Token gefunden in der Rezeptbestaetigung."
                )
                logger.info(
                    "Empfangene Nachricht durch Pflegeeinrichtung: %s", message_content
                )

        elif (
            inner_content.get("eventCode")
            == "#eRezept_Rezeptanforderung;Rezeptanfrage_Storno"
        ):
            logger.info(
                "Pflegeeinrichtung hat eine Stornierung der Rezeptanforderung erhalten."
            )

        elif (
            inner_content.get("eventCode")
            == "#eRezept_Rezeptanforderung;Abgabebestaetigung"
        ):
            logger.info("Pflegeeinrichtung hat eine Abgabebestaetigung erhalten.")

        else:
            logger.warning(
                "Unerwartete Nachricht mit eventCode '%s' empfangen: %s ",
                inner_content.get("eventCode"),
                message_content,
            )

    def send_prescription_request(self, arztpraxis, patient_info, medication_info):
        request_id = str(uuid4())
        prescription_request_bundle, prescription_service_request = (
            PrescriptionRequestCreator.create_request_bundle(
                "eRezept_Rezeptanforderung;Rezeptanfrage",
                "Anfrage an einen Arzt ein Rezept auszustellen",
                request_id,
                "return-to-requester",
                self.kim_address,
                self.software_info,
                arztpraxis.kim_address,
                "active",
                "https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs",
                "medication-runs-out",
                "Medikament läuft am 31.01.2025 aus. Es sind noch 7 stk übrig.",
            )
        )

        attachments = []
        attachments.append(self.file_handler.create_xml_file(prescription_request_bundle.xml(), "atf_eRezept_Rezeptanforderung.xml"))
        html = self.html_renderer.generate_html(prescription_request_bundle.xml())
        attachments.append(self.file_handler.write_html_file(html, "atf_eRezept_Rezeptanforderung.html"))
        attachments.append(self.file_handler.create_pdf_file_from_html(html, "atf_eRezept_Rezeptanforderung.pdf"))

        logger.info(
            "Sende Rezeptanforderung von Pflegeeinrichtung an: %s",
            arztpraxis.client_name,
        )
        logger.debug(
            "Sende Rezeptanforderung von Pflegeeinrichtung an Arzt: %s", html
        )

        # Sende Rezeptanforderung an Arzt
        self.send_message(
            arztpraxis.client_name,
            "KIM-Rezeptanforderung",
            "Rezeptanforderung",
            html,
            attachments,
        )

        self.pvs_client.process_prescription_request(prescription_request_bundle)     

    def send_dispensation_request(
        self, pharmacy_name, patient_info, medication_info, ePrescriptionToken
    ):
        message_content = {
            "eventCode": "#eRezept_Rezeptanforderung;Abgabeanfrage",
            "status": "active",
            "patient": patient_info,
            "medication": medication_info,
            "requester": self.client_name,
            "ePrescriptionToken": f"{ePrescriptionToken}",
            "organizationType": "PFL",
        }

        logger.info("Sende Abgabeanfrage von Pflegeeinrichtung an: %s", pharmacy_name)
        logger.debug(
            "Sende Abgabeanfrage von Pflegeeinrichtung an %s: %s",
            pharmacy_name,
            message_content,
        )

        # Sende Rezeptanforderung an Arzt
        self.send_message(
            pharmacy_name, "KIM-Abgabeanfrage", "Abgabeanfrage", message_content
        )


if __name__ == "__main__":
    logger.info("Initialisiere Clients...")
    health_care_service_client = HealthCareServiceKIMClient("Pflegeeinrichtung_A")

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
        "Arzt_B", patient_info, medication_info
    )
