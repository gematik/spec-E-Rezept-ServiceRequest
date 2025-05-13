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
from helper.file_handler import FileHandler
from helper.fhir_bundle_processor import FHIR_Bundle_Processor
from helper.ressource_creators.dispense_request_creator import DispenseRequestCreator
from helper.fhir_attachment_handler import FHIRAttachmentHandler

from fhir.resources.R4B.servicerequest import ServiceRequest

logger = logging.getLogger("Pflegeheim")

class HealthCareServiceKIMClient(KIMClient):
    def __init__(self, client_name, sender_info, pvs_client, avs_client):
        logger.debug(f"HealthCareServiceKIMClient für {client_name} initialisiert.")
        self.pvs_client = pvs_client
        self.avs_client = avs_client
        super().__init__(client_name, sender_info)
        self.fhir_bundle_processor = FHIR_Bundle_Processor()
        self.html_renderer = HTMLRenderer()
        self.file_handler = FileHandler(self.attachment_folder, self.html_renderer)
        self.software_info = {
            "name": "HealthCare-Source",
            "product": "HealthCare-Software",
            "version": "1.0.0",
            "email": "info@hcs.email",
            "endpoint": "mailto:healthcare-service@test.kim.de",
        }

    def process_message(self, message_content):
        FileAttachmentHandler = FHIRAttachmentHandler(message_content["attachments"])
        fhir_bundle = FileAttachmentHandler.get_fhir_bundle()
        if fhir_bundle:
            self.handle_message_event(fhir_bundle)
        else:
            logger.error("FHIR Bundle konnte nicht verarbeitet werden.")
        return

    def handle_message_event(self, atf_request_bundle):
        """
        Verarbeitet den EventCode und leitet die Nachricht zur weiteren Bearbeitung weiter.
        """
        message_header = self.fhir_bundle_processor.extract_message_header(
            atf_request_bundle
        )

        if (
            message_header.eventCoding.code
            == "eRezept_Rezeptanforderung;Rezeptbestaetigung"
        ):
            return self.handle_prescription_request_response(atf_request_bundle)
        elif (
            message_header.eventCoding.code
            == "eRezept_Rezeptanforderung;Abgabebestaetigung"
        ):
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
                self.sender_info,
                self.software_info,
                arztpraxis.sender_info,
                "active",
                "https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs",
                "exhausted-range",
                "Medikament läuft am 31.01.2025 aus. Es sind noch 7 stk übrig.",
                "Wird weiterhin benötigt, bitte um Verlängerung."
            )
        )

        attachments, html  = self.file_handler.create_file(prescription_request_bundle, "atf_eRezept_Rezeptanforderung")

    

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
        token_extension = self.fhir_bundle_processor.get_token_from_service_request(
            service_request
        )
        if token_extension is None:
            return

        dispense_request_bundle = DispenseRequestCreator.create_dispense_request_bundle(
            "active",
            self.sender_info,
            self.software_info,
            self.avs_client.sender_info,
            service_request,
            token_extension,
            "eRezept_Rezeptanforderung;Abgabeanfrage",
            "Anfrage zur Erfüllung eines Rezeptes und Abgabe des Medikaments",
            "Bitte wie üblich zur Abholung bereitlegen.",
            "Wir kommen zur üblichen Zeit, und parken gerne wieder auf dem Hinterhof"
        )

        attachments, html  = self.file_handler.create_file(dispense_request_bundle, "atf_eRezept_Abgabeanfrage")

        logger.info(
            "Sende Abgabeanfrage an: %s",
            self.avs_client.client_name,
        )
        # Sende Abgabeanfrage an Apotheke
        self.send_message(
            self.avs_client.client_name,
            "KIM-Abgabeanfrage",
            "Abgabeanfrage",
            html,
            attachments,
        )


    def handle_dispensation_request_response(self, atf_request_bundle):
        """
        Verarbeitet eine Abgabebestätigung.
        """

        service_request: ServiceRequest = (
            self.fhir_bundle_processor.get_resource_by_type(
                atf_request_bundle.entry, ServiceRequest
            )
        )

        logger.info(
            "Abgabebestätigung erhalten. Diese hatte den Status '%s'",
            service_request.status,
        )