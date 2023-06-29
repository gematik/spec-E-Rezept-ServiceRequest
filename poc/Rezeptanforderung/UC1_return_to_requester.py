from uuid import uuid4
from app_transport_framework_library.models.bundle_content import BundleContent
from Pflegeeinrichtung.use_case_validators.rezeptbestaetigung_atf_validator import RezeptbestaetigungValidator
from Pflegeeinrichtung.use_case_validators.abgabebestaetigung_atf_validator import AbgabebestaetigungValidator
from Pflegeeinrichtung.use_case_validators.abgabeanfrage_storno_atf_validator import AbgabeanfrageStornoValidator
from Pflegeeinrichtung.use_case_handlers.rezeptbestaetigung_handler import RezeptbestaetigungHandler
from Pflegeeinrichtung.use_case_handlers.abgabeanfrage_storno_handler import AbgabeanfrageStornoHandler
from Pflegeeinrichtung.ressource_creators.prescription_request_creator import PrescriptionRequestCreator
from Pflegeeinrichtung.ressource_creators.dispense_request_creator import DispenseRequestCreator
from PVS.use_case_validators.rezeptanfrage_atf_validator import RezeptanfrageValidator
from PVS.use_case_validators.rezeptanfrage_storno_atf_validator import RezeptanfrageStornoValidator
from PVS.use_case_handlers.rezeptanfrage_handler import RezeptanfrageHandler
from PVS.use_case_handlers.rezeptanfrage_storno_handler import RezeptanfrageStornoHandler
from AVS.use_case_validators.abgabeanfragen_validator import AbgabeanfrageValidator
from AVS.use_case_handlers.abgabeanfragen_handler import AbgabeanfragenHandler
from example_helper.communication_mock import FileSystemCommunicator
from example_helper.participants_mock import ParticipantsCreator
from example_helper.primaersystem import Primärsystem


class Pflegeeinrichtung(Primärsystem):
    def on_focus_Ressource_to_process(self, bundle_content: BundleContent):
        print(f"'{self.name }' processing Bundle with focus on '{bundle_content.service_identifier.code}'")
        if bundle_content.service_identifier.code == "eRezept_Rezeptanforderung;Rezeptbestaetigung":
            has_token, service_request = RezeptbestaetigungHandler(self.sender, self.software).handle(bundle_content)
            if has_token:
                dispense_request = DispenseRequestCreator.create_dispense_request_bundle(
                   "active", self.sender, self.software, apotheke.destination, service_request, "eRezept_Rezeptanforderung;Abgabeanfrage", "Anfrage zur Erfüllung eines Rezeptes und Abgabe des Medikaments","Bitte wie üblich zur Abholung bereitlegen.")
                communicator.send(
                    receiver=apotheke.kim_address,
                    messageType=f"eRezept_Rezeptanforderung;Abgabeanfrage",
                    message_bundle=dispense_request)
        elif bundle_content.service_identifier.code == "eRezept_Rezeptanforderung;Rezeptanfrage_Storno":
            AbgabeanfrageStornoHandler(self.sender, self.software).handle(bundle_content)
        elif bundle_content.service_identifier.code == "eRezept_Rezeptanforderung;Abgabebestaetigung":
            print("Received Abgabebestaetigung.")

class Arztpraxis(Primärsystem):
    def on_focus_Ressource_to_process(self, bundle_content: BundleContent):
        print(f"'{self.name }' processing Bundle with focus on '{bundle_content.service_identifier.code}'")
        if bundle_content.service_identifier.code == "eRezept_Rezeptanforderung;Rezeptanfrage":
            prescription_bundle = RezeptanfrageHandler(self.sender, self.software).handle(bundle_content)
            if prescription_bundle is not None: 
                communicator.send(
                        receiver=bundle_content.sender,
                        messageType=f"eRezept_Rezeptanforderung;Rezeptbestaetigung",
                        message_bundle=prescription_bundle)
        if bundle_content.service_identifier.code == "eRezept_Rezeptanforderung;Rezeptanfrage_Storno":
            RezeptanfrageStornoHandler(self.sender, self.software).handle(bundle_content)
            
class Apotheke(Primärsystem):
    def on_focus_Ressource_to_process(self, bundle_content: BundleContent):
        print(f"'{self.name }' processing Bundle with focus on '{bundle_content.service_identifier.code}'")
        if bundle_content.service_identifier.code == "eRezept_Rezeptanforderung;Abgabeanfrage":
            abgabe_bundle = AbgabeanfragenHandler(self.sender, self.software).handle(bundle_content)
            communicator.send(
                    receiver=bundle_content.sender,
                    messageType=f"eRezept_Rezeptanforderung;Abgabebestaetigung",
                    message_bundle=abgabe_bundle)


communicator = FileSystemCommunicator([])

# Initialise Pflegeeinrichtung
def create_primaersystem_and_register_handlers(name, kim_address, website, software_info, handlers, system_class):
    sender = ParticipantsCreator.create_sender(kim_address, name)
    software = ParticipantsCreator.create_source(
        software_info['name'],
        software_info['product'],
        software_info['version'],
        software_info['email'],
        software_info['website']
    )
    destination = ParticipantsCreator.create_destinations(kim_address, name, website)

    system = system_class(name,kim_address, communicator, sender, software, destination)

    for service_identifier, handler_class in handlers.items():
        system.processor.register_use_case_handler(
            "https://gematik.de/fhir/atf/CodeSystem/service-identifier-cs",
            service_identifier,
            handler_class(sender, software)
        )

    return system

software_info_pflegeeinrichtung = {
    'name': "PSSolutions",
    'product': "Globotron 500",
    'version': "2.1.3",
    'email': "dev@ps_solutions.de",
    'website': "https://ps_solutions.com/jira_helpdesk"
}

handlers_pflegeeinrichtung = {
    "eRezept_Rezeptanforderung;Rezeptbestaetigung": RezeptbestaetigungValidator,
    "eRezept_Rezeptanforderung;Rezeptanfrage_Storno": RezeptanfrageStornoValidator,
    "eRezept_Rezeptanforderung;Abgabebestaetigung": AbgabebestaetigungValidator,
    "eRezept_Rezeptanforderung;Abgabeanfrage_Storno":AbgabeanfrageStornoValidator
}

pflegeeinrichtung = create_primaersystem_and_register_handlers(
    "Pflegeeinrichtung Immergrün",
    "pflegeheim.immergrün.arzt@sana-pflegeheime.kim.telematik",
    "http://www.pflegeheim.immgergruen@test.de",
    software_info_pflegeeinrichtung,
    handlers_pflegeeinrichtung,
    Pflegeeinrichtung
)

#Initialise Arztpraxis
software_info_arztpraxis = {
    'name': "DeltaCare Inc.",
    'product': "PraxisFix",
    'version': "1.3.2",
    'email': "issues@praxisfix-deltacare.de",
    'website': "https://deltacare.de/praxisfix/issues"
}

handlers_arztpraxis = {
    "eRezept_Rezeptanforderung;Rezeptanfrage": RezeptanfrageValidator,
    "eRezept_Rezeptanforderung;Rezeptanfrage_Storno": RezeptanfrageStornoValidator
}

arztpraxis = create_primaersystem_and_register_handlers(
    "Arztpraxis",
    "praxis.hasenbein@gluecklich.kim.telematik",
    "http://www.arztpraxis.hasenbein@test.de",
    software_info_arztpraxis,
    handlers_arztpraxis,
    Arztpraxis
)

# Initialise Apotheke
software_info_apotheke = {
    'name': "ApoSoft Gmbh",
    'product': "ApoFlott",
    'version': "1.1.3",
    'email': "issues@apo-flott.de",
    'website': "https://aposoft.de/issues",
}

handlers_apotheke = {
    "eRezept_Rezeptanforderung;Abgabeanfrage": AbgabeanfrageValidator,
    "eRezept_Rezeptanforderung;Abgabeanfrage_Storno": AbgabeanfrageStornoValidator
}

apotheke = create_primaersystem_and_register_handlers(
    "Test Apotheke",
    "arbeitsplatz-1@test-apotheke.kim.telematik",
    "http://www.test-apotheke.de",
    software_info_apotheke,
    handlers_apotheke,
    Apotheke
)


# add processors to the communicator
communicator.processors.extend([pflegeeinrichtung.processor, arztpraxis.processor, apotheke.processor])

# UC1_1 bis UC1_4: 
# UC_1_1: Pflegeeinrichtung stellt Rezeptanforderung an eine Arztpraxis 
# UC_1_2: Arztpraxis schickt ein Rezeptbestätigung mit E-Rezept Token zurück an die Pflegeeinrichtung
# UC_1_3: Pflegeeinrichtung schickt Rezeptbestätigung mit E-Rezept Token an die Apotheke
# UC_1_4: Apotheke Antwortet mit Abgabeinformationen
request_id = str(uuid4())
prescription_request_bundle, prescription_service_request = PrescriptionRequestCreator.create_request_bundle(
    "eRezept_Rezeptanforderung;Rezeptanfrage",
    "Anfrage an einen Arzt ein Rezept auszustellen",
    request_id, 
    "return-to-requester", 
    pflegeeinrichtung.sender, 
    pflegeeinrichtung.software, 
    arztpraxis.destination, 
    "active", 
    "https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs", 
    "medication-runs-out",
    "Medikament läuft am 31.01.2023 aus. Es sind noch 7 stk übrig."
)

communicator.send(
    receiver=arztpraxis.kim_address,
    messageType=f"eRezept_Rezeptanforderung;Rezeptanfrage",
    message_bundle=prescription_request_bundle,
) 
# UC1_Storno_1: Rezeptanforderung wird von Pflegeeinrichtung storniert
prescription_request_storno_bundle, prescription_service_request_storno = PrescriptionRequestCreator.create_request_bundle(
    "eRezept_Rezeptanforderung;Rezeptanfrage_Storno",
    "Abbruch der Rezeptanfrage",
    request_id, 
    "return-to-requester", 
    pflegeeinrichtung.sender, 
    pflegeeinrichtung.software, 
    arztpraxis.destination, 
    "revoked", 
    "https://gematik.de/fhir/erp-servicerequest/CodeSystem/cancellation-reason-cs", 
    "medication-stopped",
    "Patient verstorben"
)

communicator.send(
    receiver=arztpraxis.kim_address,
    messageType=f"eRezept_Rezeptanforderung;Rezeptanfrage_Storno",
    message_bundle=prescription_request_storno_bundle,
)

# UC1_Storno_2: Rezeptanforderung wird vom Arzt storniert
prescription_request_storno_bundle, prescription_service_request_storno = PrescriptionRequestCreator.create_request_bundle(
    "eRezept_Rezeptanforderung;Rezeptanfrage_Storno",
    "Abbruch der Abgabeanfrage",
    request_id, 
    "return-to-requester", 
    arztpraxis.sender, 
    arztpraxis.software, 
    pflegeeinrichtung.destination, 
    "revoked", 
    "https://gematik.de/fhir/erp-servicerequest/CodeSystem/cancellation-reason-cs", 
    "medication-paused",
    "Symptome abgeklungen"
)

communicator.send(
    receiver=pflegeeinrichtung.kim_address,
    messageType=f"eRezept_Rezeptanforderung;Rezeptanfrage_Storno",
    message_bundle=prescription_request_storno_bundle,
)

# UC1_Storno_3: Pflegeeinrichtung storniert die Abgabe bei der Apotheke
dispense_request = DispenseRequestCreator.create_dispense_request_bundle(
    "revoked", pflegeeinrichtung.sender, pflegeeinrichtung.software, apotheke.destination, prescription_service_request, "eRezept_Rezeptanforderung;Abgabeanfrage_Storno", "Abbruch der Abgabeanfrage", "Verschreibung fehlerhaft")
communicator.send(
    receiver=apotheke.kim_address,
    messageType=f"eRezept_Rezeptanforderung;Abgabeanfrage_Storno",
    message_bundle=dispense_request)

# UC1_Storno_4: Die Apotheke storniert die Abgabeanfrage bei der Pflegeinrichtung
dispense_request = DispenseRequestCreator.create_dispense_request_bundle(
    "revoked", apotheke.sender, apotheke.software, pflegeeinrichtung.destination, prescription_service_request, "eRezept_Rezeptanforderung;Abgabeanfrage_Storno", "Abbruch der Abgabeanfrage","Fertigarzenimittel nicht vorrätig")
communicator.send(
    receiver=pflegeeinrichtung.kim_address,
    messageType=f"eRezept_Rezeptanforderung;Abgabeanfrage_Storno",
    message_bundle=dispense_request)