import os
import json
from lxml import etree
import pdfkit
from fhir.resources.R4B.bundle import Bundle

# Set the locations relative to the script
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
INPUT_FOLDER = os.path.join(SCRIPT_DIR, '../fsh-generated/resources')
OUTPUT_FOLDER = os.path.join(SCRIPT_DIR, './pdf_files')
XSLT_FILE = os.path.join(SCRIPT_DIR, '../xslt-stylesheets/rezeptanforderung.xsl')

# Delete the output folder if it exists, then recreate it
if os.path.exists(OUTPUT_FOLDER):
    for filename in os.listdir(OUTPUT_FOLDER):
        file_path = os.path.join(OUTPUT_FOLDER, filename)
        if os.path.isfile(file_path):
            os.unlink(file_path)
        elif os.path.isdir(file_path):
            os.rmdir(file_path)
else:
    os.makedirs(OUTPUT_FOLDER)

# Ensure the output folder exists
os.makedirs(OUTPUT_FOLDER, exist_ok=True)

# Function to convert JSON to XML using FHIR library
def json_to_xml_fhir(json_content):
    bundle = Bundle(**json_content)  # Create a Bundle resource from JSON content
    xml_content = bundle.xml()  # Convert the Bundle to XML
    return xml_content

# Function to apply XSLT to XML
def transform_xml_with_xslt(xml_content, xslt_file):
    xslt = etree.parse(xslt_file)
    transform = etree.XSLT(xslt)
    xml_tree = etree.fromstring(xml_content.encode('utf-8'))
    html_tree = transform(xml_tree)
    return str(html_tree)

# Main script to process files
def process_fhir_files():
    for filename in os.listdir(INPUT_FOLDER):
        if filename.endswith('.json'):
            input_filepath = os.path.join(INPUT_FOLDER, filename)
            base_filename = os.path.splitext(filename)[0]

            # Step 1: Convert JSON to XML using FHIR library
            with open(input_filepath, 'r') as f:
                json_content = json.load(f)
                if json_content.get('resourceType') == 'Bundle':
                    xml_content = json_to_xml_fhir(json_content)
                else:
                    print(f'Skipping {filename}: Not a Bundle resource')
                    continue
                  
            # Step 2: Transform XML with XSLT to HTML
            html_content = transform_xml_with_xslt(xml_content, XSLT_FILE)
            html_filepath = os.path.join(OUTPUT_FOLDER, f'{base_filename}.html')
            with open(html_filepath, 'w') as f:
                f.write(html_content)

           # Step 3: Convert HTML to PDF using xhtml2pdf
            pdf_filepath = os.path.join(OUTPUT_FOLDER, f'{base_filename}.pdf')
            pdfkit.from_string(html_content, pdf_filepath)

            # Optionally, remove the intermediate HTML file
            os.remove(html_filepath)

            print(f'Processed {filename} -> {base_filename}.pdf')

if __name__ == "__main__":
    process_fhir_files()
