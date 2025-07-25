import os
from lxml import etree
import pdfkit

# Set your input folder path here (absolute or relative)
INPUT_FOLDER = os.path.abspath('../XSLT-Test-Files')

# Path to your XSLT file
XSLT_FILE = os.path.abspath('../rezeptanforderung-stylesheet.xsl')

def transform_xml_with_xslt(xml_content, xslt_file):
    xslt = etree.parse(xslt_file)
    transform = etree.XSLT(xslt)
    xml_tree = etree.fromstring(xml_content.encode('utf-8'))
    html_tree = transform(xml_tree)
    return str(html_tree)

def process_xml_files(input_folder):
    for root, dirs, files in os.walk(input_folder):
        for filename in files:
            if filename.endswith('.xml'):
                xml_filepath = os.path.join(root, filename)
                base_filename = os.path.splitext(filename)[0]
                pdf_filepath = os.path.join(root, f'{base_filename}.pdf')

                # Read XML file
                with open(xml_filepath, 'r', encoding='utf-8') as f:
                    xml_content = f.read()

                # Transform XML to HTML
                html_content = transform_xml_with_xslt(xml_content, XSLT_FILE)

                # Convert HTML to PDF
                pdfkit.from_string(html_content, pdf_filepath)

                print(f'Processed {xml_filepath} -> {pdf_filepath}')

if __name__ == "__main__":
    process_xml_files(INPUT_FOLDER)
