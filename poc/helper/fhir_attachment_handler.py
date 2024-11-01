import os
import logging
from fhir.resources.R4B.bundle import Bundle

logger = logging.getLogger(__name__)
class FHIRAttachmentHandler:
    def __init__(self, attachments):
        self.attachments = attachments

    def get_fhir_bundle(self):
        xml_file_path = self.find_xml_attachment()
        if xml_file_path and os.path.exists(xml_file_path):
            logger.debug(f"XML-Anhang gefunden: {xml_file_path}")
            fhir_bundle = self.parse_fhir_bundle(xml_file_path)
            if fhir_bundle:
                return fhir_bundle
            else:
                logger.error("FHIR Bundle konnte nicht verarbeitet werden.")
        else:
            logger.error("XML-Anhang nicht gefunden.")
        return None

    def find_xml_attachment(self):
        for attachment in self.attachments:
            if attachment.get("filename", "").endswith(".xml"):
                return attachment.get("path")
        return None

    def parse_fhir_bundle(self, xml_file_path):
        with open(xml_file_path, 'rb') as f:
            xml_inhalt = f.read()
        bundle = Bundle.parse_raw(xml_inhalt, content_type='application/fhir+xml')
        return bundle