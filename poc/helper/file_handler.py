import os
from fhir.resources.R4B.bundle import Bundle, BundleEntry

class FileHandler:
    def __init__(self, attachment_folder, html_renderer=None):
        self.attachment_folder = attachment_folder
        self.html_renderer = html_renderer

    def _write_file(self, content, filename, mode="w", encoding="utf-8"):
        attachment_path = os.path.join(self.attachment_folder, filename)

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

    def create_xml_file(self, bundle_as_xml, filename):
        # Assuming `bundle.xml()` gives XML content as string
        return self._write_file(bundle_as_xml, filename)