import os
import logging
from fhir.resources.R4B.bundle import Bundle
from fhir.resources.R4B.messageheader import MessageHeader
from fhir.resources.R4B.servicerequest import ServiceRequest
from fhir.resources.R4B.medication import Medication
from fhir.resources.R4B.patient import Patient
from fhir.resources.R4B.medicationrequest import MedicationRequest
from fhir.resources.R4B.organization import Organization
from fhir.resources.R4B.observation import Observation
import xmltodict

logger = logging.getLogger(__name__)

class FHIRAttachmentHandler:
    def __init__(self, attachments):
        self.attachments = attachments

    def get_event_code(self):
        xml_file_path = self.find_xml_attachment()
        if xml_file_path and os.path.exists(xml_file_path):
            logger.info(f"XML-Anhang gefunden: {xml_file_path}")
            fhir_bundle = self.parse_fhir_bundle(xml_file_path)
            if fhir_bundle:
                event_code = self.extract_event_code(fhir_bundle)
                if event_code:
                    return event_code
                else:
                    logger.error("EventCode konnte nicht extrahiert werden.")
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

    def clean_fhir_dict(self, data):
        """
        Clean the dictionary recursively, ensuring lists where needed and removing invalid fields.
        """
        if isinstance(data, dict):
            clean_dict = {}
            for key, value in data.items():
                if key == '@value':
                    return value
                elif key == 'profile' and not isinstance(value, list):
                    clean_dict[key] = [value] if isinstance(value, str) else value
                elif key.startswith('@'):
                    continue
                else:
                    clean_dict[key] = self.clean_fhir_dict(value)
            return clean_dict
        elif isinstance(data, list):
            return [self.clean_fhir_dict(item) for item in data]
        else:
            return data

    def parse_fhir_bundle(self, xml_file_path):
        """
        Parses and validates a FHIR Bundle from an XML file, ensuring that entries are valid.
        """
        try:
            with open(xml_file_path, 'r', encoding='utf-8') as f:
                xml_content = f.read()

            # Log the raw XML content for debugging
            logger.debug(f"Raw XML content:\n{xml_content}")

            # Convert the XML content into a Python dictionary
            xml_dict = xmltodict.parse(xml_content)

            # Clean the dictionary to remove invalid attributes
            cleaned_dict = self.clean_fhir_dict(xml_dict['Bundle'])

            # Log the cleaned dictionary structure for debugging
            logger.debug(f"Cleaned dictionary structure:\n{cleaned_dict}")

            # Create an empty Bundle object and manually process the entries
            bundle = Bundle.construct()

            # Handle bundle-level metadata
            bundle.meta = self.clean_fhir_dict(cleaned_dict.get('meta', {}))
            bundle.identifier = cleaned_dict.get('identifier', None)

            # **Ensure the `type` field is correctly set**
            bundle_type = cleaned_dict.get('type', None)

            # Debugging log to see what `type` is being parsed
            logger.debug(f"Bundle type before cleanup: {bundle_type}")

            if not bundle_type or bundle_type == 'None':
                logger.error("Bundle type is missing or None, setting default to 'message'")
                bundle_type = 'message'  # Set to default 'message' type if none is provided
            elif bundle_type not in ['document', 'message', 'transaction', 'batch', 'collection', 'searchset', 'history']:
                logger.error(f"Invalid Bundle type '{bundle_type}' provided. Setting default to 'message'.")
                bundle_type = 'message'

            # Explicitly set bundle type
            bundle.type = bundle_type

            # Log the type field after validation
            logger.debug(f"Bundle type after validation: {bundle.type}")

            bundle.timestamp = cleaned_dict.get('timestamp', None)

            # Process each entry in the bundle
            for entry_dict in cleaned_dict.get('entry', []):
                resource_type = entry_dict.get('resource', {}).get('resourceType')

                logger.debug(f"Processing resource of type: {resource_type}")

                # Manually parse each resource by its type
                if resource_type == "MessageHeader":
                    resource = self.parse_resource(entry_dict['resource'], MessageHeader)
                elif resource_type == "ServiceRequest":
                    resource = self.parse_resource(entry_dict['resource'], ServiceRequest)
                elif resource_type == "Medication":
                    resource = self.parse_resource(entry_dict['resource'], Medication)
                elif resource_type == "Patient":
                    resource = self.parse_resource(entry_dict['resource'], Patient)
                elif resource_type == "MedicationRequest":
                    resource = self.parse_resource(entry_dict['resource'], MedicationRequest)
                elif resource_type == "Organization":
                    resource = self.parse_resource(entry_dict['resource'], Organization)
                elif resource_type == "Observation":
                    resource = self.parse_resource(entry_dict['resource'], Observation)
                else:
                    logger.warning(f"Unknown resource type: {resource_type}")
                    continue

                if resource:
                    logger.debug(f"Resource parsed successfully: {resource_type}")
                    bundle.entry.append(Bundle.Entry(resource=resource))

            logger.info("Bundle parsed successfully.")
            return bundle

        except Exception as e:
            logger.error(f"Error processing FHIR message: {e}")
            return None

    def parse_resource(self, resource_dict, resource_class):
        """
        Clean and parse individual resource into the correct FHIR resource object.
        """
        try:
            cleaned_resource_dict = self.clean_fhir_dict(resource_dict)
            allowed_fields = resource_class.__fields__.keys()
            filtered_data = self.filter_allowed_fields(cleaned_resource_dict, allowed_fields)
            return resource_class.parse_obj(filtered_data)
        except Exception as e:
            logger.error(f"Error parsing {resource_class.__name__}: {e}")
            return None

    def filter_allowed_fields(self, resource_dict, allowed_fields):
        """
        Filters out fields that are not valid according to the FHIR resource schema.
        """
        return {k: v for k, v in resource_dict.items() if k in allowed_fields}

    def extract_event_code(self, fhir_bundle):
        message_header = self.find_message_header(fhir_bundle)
        if message_header:
            return message_header.eventCoding.code
        return None

    def find_message_header(self, fhir_bundle):
        for entry in fhir_bundle.entry:
            if isinstance(entry.resource, MessageHeader):
                return entry.resource
        return None