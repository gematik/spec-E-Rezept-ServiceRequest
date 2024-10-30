import os
import sys
from fhir.resources.R4B.bundle import Bundle, BundleEntry
from helper.logging_setup import setup_logger
import logging
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
logger = setup_logger("FileHandler", level=logging.ERROR)

class FileHandler:
    def __init__(self, attachment_folder, html_renderer=None):
        self.attachment_folder = attachment_folder
        self.html_renderer = html_renderer


    def create_files(self, prescription_request_response, filename):
        self.create_file(prescription_request_response.json(ident = 4), filename + ".json")

        attachments = []
        attachments.append(
            self.create_file(
                prescription_request_response.xml(), filename + ".xml"
            )
        )
        html = self.html_renderer.generate_html(prescription_request_response.xml())
        attachments.append(self.write_html_file(html, filename + ".html"))
        attachments.append(
            self.create_pdf_file_from_html(html, filename + ".pdf")
        )
        
        return attachments, html

    def _write_file(self, content, filename, mode="w", encoding="utf-8"):
        attachment_path = os.path.join(self.attachment_folder, filename)

        logger.info("Writing File %s",attachment_path )

        with open(attachment_path, mode, encoding=encoding) as attachment_file:
            attachment_file.write(content)

        return {
            "filename": filename,
            "attachment_path": attachment_path
        }

    def write_html_file(self, html, filename):
        return self._write_file(html, filename)

    def create_pdf_file_from_html(self, html, filename):
        # Assuming self.html_renderer has a method `html_to_pdf`
        pdf_path = os.path.join(self.attachment_folder, filename)
        self.html_renderer.html_to_pdf(html, pdf_path)

        return {
            "filename": filename,
            "attachment_path": pdf_path
        }

    def create_file(self, content, filename):
        return self._write_file(content, filename)
    