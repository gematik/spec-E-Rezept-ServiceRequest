Profile: GEM_PR_ERP_MEDREQ_DispenseInformationBundle
Parent: Bundle
Id: gem-pr-erp-medreq-dispense-information-bundle
Title: "GEM PR ERP MEDREQ Dispense Information Bundle"
Description: "Communication resource for sending dispenseInformation about a medication requisition."
* insert Meta (GEM_PR_ERP_MEDREQ_DispenseInformationBundle)
* insert MetaProfile (GEM_PR_ERP_MEDREQ_DispenseInformationBundle)
* id 1..1
* identifier 1..
* identifier.system 1..
* identifier.system = "urn:ietf:rfc:3986" (exactly)
* identifier.value 1..
* identifier.value ^short = "Eindeutige UUID des Bundles"
* type = #message (exactly)
* timestamp 1..
* entry 1..
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #closed
* entry contains
    MessageHeader 1..1 and
    Prescription 1..1 and
    Patient 1..1 and
    RequestingOrganization 0..1 and
    DispensingOrganization 0..1 and
    DispenseInformation 1..1
* entry[MessageHeader].link ..0
* entry[MessageHeader].resource 1..
* entry[MessageHeader].resource only GEM_PR_ERP_MEDREQ_MessageHeader
* entry[MessageHeader].search ..0
* entry[MessageHeader].request ..0
* entry[MessageHeader].response ..0
* entry[Prescription].link ..0
* entry[Prescription].resource 1..
* entry[Prescription].resource only KBV_PR_ERP_Prescription
* entry[Prescription].search ..0
* entry[Prescription].request ..0
* entry[Prescription].response ..0
* entry[Patient].link ..0
* entry[Patient].resource 1..
* entry[Patient].resource only KBV_PR_FOR_Patient
* entry[Patient].search ..0
* entry[Patient].request ..0
* entry[Patient].response ..0
* entry[RequestingOrganization].link ..0
* entry[RequestingOrganization].resource 1..
* entry[RequestingOrganization].resource only GEM_PR_ERP_MEDREQ_Organization
* entry[RequestingOrganization].search ..0
* entry[RequestingOrganization].request ..0
* entry[RequestingOrganization].response ..0
* entry[DispensingOrganization].link ..0
* entry[DispensingOrganization].resource 1..
* entry[DispensingOrganization].resource only GEM_PR_ERP_MEDREQ_Organization
* entry[DispensingOrganization].search ..0
* entry[DispensingOrganization].request ..0
* entry[DispensingOrganization].response ..0
* entry[DispenseInformation].link ..0
* entry[DispenseInformation].resource 1..
* entry[DispenseInformation].resource only GEM_ERP_PR_MedicationDispense
* entry[DispenseInformation].search ..0
* entry[DispenseInformation].request ..0
* entry[DispenseInformation].response ..0

Instance: SumatripanMedication
InstanceOf: Medication
Title:   "Sample Medication Sumatripan"
Usage: #inline
* id = "001413e4-a5e9-48da-9b07-c17bab476407"
* meta.profile[+] = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[=].valueCodeableConcept.coding.system = "http://snomed.info/sct"
* extension[=].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[=].valueCodeableConcept.coding.code = #763158003
* extension[=].valueCodeableConcept.coding.display = "Medicinal product (product)"
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[=].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category"
* extension[=].valueCoding.code = #00
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[=].valueBoolean = false
* extension[+].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[=].valueCode = #N1
* code.coding[+].system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding[=].code = #06313728
* code.text = "Sumatriptan-1a Pharma 100 mg Tabletten"
* form.coding[+].system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM"
* form.coding[=].code = #TAB
* amount.numerator.unit = "St"
* amount.numerator.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension[=].valueString = "20 St."
* amount.denominator.value = 1

Instance: GEM_ERP_PR_MedicationDispenseExample
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #inline
Title: "GEM ERP PR Medication Dispense Example"
Description: "Example of a GEM_ERP_PR_MedicationDispense"
* id = "c312572d-165c-4b4e-8617-a58ced204939"
* MetaInstance(GEM_ERP_PR_MedicationDispenseExample)
* contained[+] = SumatripanMedication
* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "160.000.033.491.280.78"
* status = #completed
* medicationReference.reference = "#001413e4-a5e9-48da-9b07-c17bab476407"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X234567890"
* performer[+].actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer[=].actor.identifier.value = "3-abc-1234567890"
* whenHandedOver = "2022-02-28"
* dosageInstruction[+].text = "1-0-1-0"


Instance: DispenseInformationExample
InstanceOf: GEM_PR_ERP_MEDREQ_DispenseInformationBundle
Usage: #example
Title: "Example of DispenseInformationBundle"
Description: "Example of DispenseInformationBundle to provide a complete information ressource about the dispense"
* id = "4321fb9d-bdf4-4c59-b4d6-aedf092a3502"
* MetaInstance(GEM_PR_ERP_MEDREQ_DispenseInformationBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2e3200df-66e1-4c82-90e1-1bdec82f8442"
* type = #message
* timestamp = "2022-12-12T12:12:54.234+02:00"
* entry[+][MessageHeader].resource = MessageHeaderExampleDispensingOrganisation
* entry[+][Prescription].resource = KBV_PR_ERP_PrescriptionExample
* entry[+][Patient].resource = KBV_PR_FOR_PatientExample
* entry[+][RequestingOrganization].resource = RequestingOrganizationExample
* entry[+][DispensingOrganization].resource = DispensingOrganizationExample
* entry[+][DispenseInformation].resource = GEM_ERP_PR_MedicationDispenseExample