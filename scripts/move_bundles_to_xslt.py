import os
import subprocess
import shutil
import logging

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, '..'))
INPUT_FOLDER = os.path.join(PROJECT_ROOT, 'fsh-generated/resources')
OUTPUT_FOLDER = os.path.join(PROJECT_ROOT, 'resources/XSLT-Test-Files')
TEMP_XML_FOLDER = os.path.join(OUTPUT_FOLDER, '_temp')

CATEGORY_MAP = [
    ("eRezept_Rezeptanforderung;Rezeptanfrage\"",           "1_Rezeptanforderung"),
    ("eRezept_ParenteraleZubereitung;Rezeptanfrage\"",           "1_Rezeptanforderung"),
    ("eRezept_Rezeptanforderung;Rezeptbestaetigung\"",      "2_Rezeptbestätigung"),
    ("eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung\"", "3_Rezeptablehnung"),
    ("eRezept_Rezeptanforderung;Rezeptanfrage_Storno\"", "3_Rezeptablehnung"),
    ("eRezept_Rezeptanforderung;Abgabeanfrage\"",           "4_Dispensieran­forderung"),
    ("eRezept_Rezeptanforderung;Abgabeanfrage_Ablehnung\"", "5_Dispensierablehnung"),
    ("eRezept_Rezeptanforderung;Abgabebestaetigung\"",      "6_Dispensierbestätigung"),
    ("eRezept_ParenteraleZubereitung;Rezeptbestaetigung\"",      "2_Rezeptbestätigung"),
    ("eRezept_Rezeptanforderung;NachrichtKopie\"",          "7_Kopie"),
]

def create_output_folders(base_path):
    for _, folder in CATEGORY_MAP:
        path = os.path.join(base_path, folder)
        os.makedirs(path, exist_ok=True)

def find_category(xml_content):
    for key, folder in CATEGORY_MAP:
        if key in xml_content:
            return folder
    return None

def run_firely_bulk_conversion():
    # Bulk push and save all JSON files as XML
    rel_input = os.path.relpath(INPUT_FOLDER, PROJECT_ROOT) + "/"
    rel_temp = os.path.relpath(TEMP_XML_FOLDER, PROJECT_ROOT)
    # Remove temp folder if it exists
    if os.path.exists(TEMP_XML_FOLDER):
        shutil.rmtree(TEMP_XML_FOLDER)
    os.makedirs(TEMP_XML_FOLDER, exist_ok=True)
    
    # Push all resources
    push_path = rel_input + 'Bundle-*'
    print(push_path)
    
    result_push = subprocess.run(['fhir', 'push', push_path], cwd=PROJECT_ROOT, capture_output=True, text=True)
    if result_push.returncode != 0:
        print(f"[Firely] Error pushing {rel_input}:\n{result_push.stderr}")
        return False
    
    print(result_push.stdout)

    # Save all as XML
    result_save = subprocess.run(['fhir', 'save', '--all', '--xml', '--pretty'], cwd=TEMP_XML_FOLDER + "/", capture_output=True, text=True)
    if result_save.returncode != 0:
        print(f"[Firely] Error saving all XMLs to {rel_temp}:\n{result_save.stderr}")
        return False

    return True

def sort_xml_files():
    create_output_folders(OUTPUT_FOLDER)
    for filename in os.listdir(TEMP_XML_FOLDER):
        if filename.endswith('.xml'):
            xml_path = os.path.join(TEMP_XML_FOLDER, filename)
            with open(xml_path, 'r', encoding='utf-8') as f:
                xml_content = f.read()
            # Check if this is a Bundle resource
            if '<Bundle' not in xml_content:
                #logging.info(f"{filename} is not a Bundle. Skipping.")
                continue
            category_folder = find_category(xml_content)
            if category_folder:
                dest_folder = os.path.join(OUTPUT_FOLDER, category_folder)
                shutil.copyfile(xml_path, os.path.join(dest_folder, filename))
                #logging.info(f"Moved {filename} to {category_folder}")
            else:
                logging.warning(f"No category for {filename}, skipping.")


def cleanup_temp_folder():
    if os.path.exists(TEMP_XML_FOLDER):
        shutil.rmtree(TEMP_XML_FOLDER)
        logging.info(f"Deleted temp folder {TEMP_XML_FOLDER}")

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(levelname)s] %(message)s')
    
    # Cleanup
    subprocess.run(['fhir', 'clear'])
    if os.path.exists(OUTPUT_FOLDER):
        shutil.rmtree(OUTPUT_FOLDER)
        logging.info(f"Deleted output folder {OUTPUT_FOLDER}")
        
    # Run
    run_firely_bulk_conversion()
    sort_xml_files()
    cleanup_temp_folder()
