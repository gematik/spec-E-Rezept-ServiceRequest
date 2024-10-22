import logging
import os
import lxml.etree as ET
from bs4 import BeautifulSoup
import pdfkit

logger = logging.getLogger(__name__)
class HTMLRenderer:
    def __init__(self):
        pass

    def generate_html(self, xml_string: str, xsl_file_path: str = None) -> str:
        # Convert the XML string to bytes to handle encoding declaration issues
        if isinstance(xml_string, str):
            xml_string = xml_string.encode('utf-8')

        # Parse the XML string
        try:
            xml_tree = ET.XML(xml_string)
        except ET.XMLSyntaxError as e:
            raise ValueError(f"Invalid XML input: {e}")

        # If no xsl_file_path is provided, use the default 'rezeptanforderung.xsl'
        if xsl_file_path is None:
            script_dir = os.path.dirname(os.path.abspath(__file__))  # Get the current script directory
            xsl_file_path = os.path.join(script_dir, 'rezeptanforderung.xsl')

        # Load the XSL file
        try:
            with open(xsl_file_path, 'r') as xsl_file:
                xsl_tree = ET.parse(xsl_file)
        except FileNotFoundError:
            raise FileNotFoundError(f"XSL file '{xsl_file_path}' not found")
        except ET.XMLSyntaxError as e:
            raise ValueError(f"Invalid XSL file: {e}")

        # Perform the transformation
        transform = ET.XSLT(xsl_tree)
        transformed_html = transform(xml_tree)

        # Convert the transformed HTML tree to string
        html_string = ET.tostring(transformed_html, pretty_print=True, method="html", encoding="UTF-8").decode("utf-8")

        # Beautify the HTML output
        soup = BeautifulSoup(html_string, "html.parser")
        beautified_html = soup.prettify()

        return beautified_html
    
    def html_to_pdf(self, html_content: str, output_pdf_path: str) -> None:
        """
        Convert the given HTML content to a PDF and save it to the specified file path,
        ensuring UTF-8 encoding and adjusting margins and layout to prevent content from being cut off.
        
        :param html_content: The HTML content to convert to PDF
        :param output_pdf_path: The path where the PDF should be saved
        """
        # Ensure UTF-8 encoding is used in the HTML content
        html_content = f"""<!DOCTYPE html>
        <html lang="de">
        <head>
            <meta charset="UTF-8">
            <title>Rezeptanforderung</title>
            <style>
                body {{
                    font-size: 12px;
                    line-height: 1.6;
                }}
                .content {{
                    margin: 0 auto;
                    width: 80%;
                }}
            </style>
        </head>
        <body>
        <div class="content">
        {html_content}
        </div>
        </body>
        </html>"""

        try:
            # Options to ensure UTF-8 encoding and set page size to A4 with larger margins
            options = {
                'encoding': "UTF-8",
                'page-size': 'A4',  # Set page size to A4
                'dpi': 400,  # Ensures high resolution
                'zoom': 1.0  # Adjust zoom to fit content better
            }
            pdfkit.from_string(html_content, output_pdf_path, options=options)
            logger.info(f"PDF successfully created at {output_pdf_path}")
        except Exception as e:
            raise RuntimeError(f"Failed to create PDF: {e}")