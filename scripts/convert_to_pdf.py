import os
import logging
from lxml import etree
import pdfkit
import pikepdf  # <-- Add this import

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s'
)

# Set paths relative to the script location
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
INPUT_FOLDER = os.path.join(SCRIPT_DIR, '../resources/XSLT-Test-Files')
XSLT_FILE = os.path.join(SCRIPT_DIR, '../resources/rezeptanforderung-stylesheet.xsl')

def transform_xml_with_xslt(xml_content, xslt_file):
    try:
        xslt = etree.parse(xslt_file)
        transform = etree.XSLT(xslt)
        xml_tree = etree.fromstring(xml_content.encode('utf-8'))
        html_tree = transform(xml_tree)
        return str(html_tree)
    except Exception as e:
        logging.error(f"XSLT transformation failed: {e}")
        return None

def remove_creation_date(pdf_filepath):
    try:
        with pikepdf.open(pdf_filepath, allow_overwriting_input=True) as pdf:
            if '/CreationDate' in pdf.docinfo:
                del pdf.docinfo['/CreationDate']
                pdf.save(pdf_filepath)
                logging.info(f"Removed /CreationDate from {pdf_filepath}")
    except Exception as e:
        logging.error(f"Failed to remove /CreationDate from {pdf_filepath}: {e}")

def process_xml_files(input_folder):
    logging.info(f"Scanning for XML files in: {input_folder}")
    found_any = False
    for root, dirs, files in os.walk(input_folder):
        for filename in files:
            if filename.endswith('.xml'):
                found_any = True
                xml_filepath = os.path.join(root, filename)
                base_filename = os.path.splitext(filename)[0]
                pdf_filepath = os.path.join(root, f'{base_filename}.pdf')

                logging.info(f"Processing: {xml_filepath}")
                try:
                    with open(xml_filepath, 'r', encoding='utf-8') as f:
                        xml_content = f.read()
                except Exception as e:
                    logging.error(f"Failed to read {xml_filepath}: {e}")
                    continue

                html_content = transform_xml_with_xslt(xml_content, XSLT_FILE)
                if html_content is None:
                    logging.error(f"Skipping {xml_filepath} due to transformation error.")
                    continue

                try:
                    pdfkit.from_string(html_content, pdf_filepath)
                    logging.info(f"Created PDF: {pdf_filepath}")
                    remove_creation_date(pdf_filepath)  # <-- Call the function here
                except Exception as e:
                    logging.error(f"Failed to create PDF for {xml_filepath}: {e}")

    if not found_any:
        logging.warning(f"No XML files found in {input_folder} or its subfolders.")

if __name__ == "__main__":
    process_xml_files(INPUT_FOLDER)
