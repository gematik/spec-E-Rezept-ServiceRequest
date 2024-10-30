import logging
import sys
import os
from uuid import uuid4


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from helper.ressource_creators.prescription_request_creator import (
    PrescriptionRequestCreator,
)
from helper.renderer.html_renderer import HTMLRenderer
from helper.kim_client import KIMClient
from helper.logging_setup import setup_logger
from helper.file_handler import FileHandler
from helper.fhir_bundle_processor import FHIR_Bundle_Processor
from helper.ressource_creators.dispense_request_creator import DispenseRequestCreator

from fhir.resources.R4B.messageheader import MessageHeader
from fhir.resources.R4B.bundle import Bundle
from fhir.resources.R4B.servicerequest import ServiceRequest

# Logger für die Pflegeeinrichtung einrichten
logger = setup_logger("Pflegeeinrichtung_A", level=logging.INFO)


class HealthCareServiceKIMClient(KIMClient):
    def __init__(self, client_name, kim_address, pvs_client, avs_client):
        self.pvs_client = pvs_client
        self.avs_client = avs_client
        super().__init__(client_name, kim_address)
        self.fhir_bundle_processor = FHIR_Bundle_Processor()
        self.html_renderer = HTMLRenderer()
        self.file_handler = FileHandler(self.attachment_folder, self.html_renderer)
        self.software_info = {
            "name": "HealthCare-Source",
            "product": "HealthCare-Software",
            "version": "1.0.0",
            "email": "info@hcs.email",
            "website": "https://ps_solutions.com/jira_helpdesk",
        }

    def process_message(self, message_content):
        return

    def handle_message_event(self, atf_request_bundle):
        """
        Verarbeitet den EventCode und leitet die Nachricht zur weiteren Bearbeitung weiter.
        """
        message_header = self.fhir_bundle_processor.extract_message_header(
            atf_request_bundle
        )

        if message_header.eventCoding.code == "eRezept_Rezeptanforderung;Rezeptbestaetigung":
            return self.handle_prescription_request_response(atf_request_bundle)
        elif message_header.eventCoding.code == "eRezept_Rezeptanforderung;Abgabebestaetigung":
            return self.handle_dispensation_request_response(atf_request_bundle)
        else:
            logger.warning(
                f"Unbekannter EventCode: {message_header.eventCoding.code}. Keine spezifische Verarbeitung definiert."
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

        filename = "atf_eRezept_Rezeptanforderung"

        attachments = []
        attachments.append(
            self.file_handler.create_xml_file(
                prescription_request_bundle.xml(), filename + ".xml"
            )
        )
        html = self.html_renderer.generate_html(prescription_request_bundle.xml())
        attachments.append(self.file_handler.write_html_file(html, filename + ".html"))
        attachments.append(
            self.file_handler.create_pdf_file_from_html(html, filename + ".pdf")
        )

        logger.info(
            "Sende Rezeptanforderung von Pflegeeinrichtung an: %s",
            arztpraxis.client_name,
        )
        logger.debug("Sende Rezeptanforderung von Pflegeeinrichtung an Arzt: %s", html)

        # Sende Rezeptanforderung an Arzt
        self.send_message(
            arztpraxis.client_name,
            "KIM-Rezeptanforderung",
            "Rezeptanforderung",
            html,
            attachments,
        )

        response_attachments = self.pvs_client.handle_message_event(
            prescription_request_bundle
        )
        self.handle_message_event(response_attachments)

    def handle_prescription_request_response(self, atf_request_bundle):
        """
        Verarbeitet eine Rezeptbestaetigung.
        """
        logger.info("Rezeptbestaetigung erhalten.")

        service_request: ServiceRequest = (
            self.fhir_bundle_processor.get_resource_by_type(
                atf_request_bundle.entry, ServiceRequest
            )
        )
        token = self.fhir_bundle_processor.get_token_from_service_request(
            service_request
        )
        if token is None:
            return

        dispense_request_bundle = DispenseRequestCreator.create_dispense_request_bundle(
            "active",
            self.kim_address,
            self.software_info,
            self.avs_client.kim_address,
            service_request,
            "eRezept_Rezeptanforderung;Abgabeanfrage",
            "Anfrage zur Erfüllung eines Rezeptes und Abgabe des Medikaments",
            "Bitte wie üblich zur Abholung bereitlegen.",
        )

        
        attachments, html = self.file_handler.create_files(dispense_request_bundle, "atf_eRezept_Abgabeanfrage")
    

        # Sende Abgabeanfrage an Apotheke
        self.send_message(
            self.avs_client.client_name,
            "KIM-Abgabeanfrage",
            "Abgabeanfrage",
            html,
            attachments,
        )

        dispensation_bundle = self.avs_client.handle_message_event(dispense_request_bundle)
        self.handle_message_event(dispensation_bundle)

    def handle_dispensation_request_response(self, atf_request_bundle):
        """
        Verarbeitet eine Abgabebestätigung.
        """


        service_request: ServiceRequest = (
            self.fhir_bundle_processor.get_resource_by_type(
                atf_request_bundle.entry, ServiceRequest
            )
        )

        logger.info("Abgabebestätigung erhalten. Diese hatte den Status '%s'", service_request.status)


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
