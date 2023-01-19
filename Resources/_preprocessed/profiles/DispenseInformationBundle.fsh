// Originally defined on lines 1 - 62
Profile: GEM_PR_ERP_MEDREQ_DispenseInformationBundle
Parent: Bundle
Id: GEM-PR-ERP-MEDREQ-DispenseInformationBundle
Title: "GEM PR ERP MEDREQ Dispense Information Bundle"
Description: "Communication resource for sending dispenseInformation about a medication requisition."
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-DispenseInformationBundle"
* ^version = "1.0"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-DispenseInformationBundle|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0
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
    MessageHeader 0.. and
    Prescription 0.. and
    Patient 0.. and
    RequestingOrganization 0.. and
    DispensingOrganization 0.. and
    DispenseInformation 0..
* entry[MessageHeader] 1..1
* entry[Prescription] 1..1
* entry[Patient] 1..1
* entry[RequestingOrganization] 0..1
* entry[DispensingOrganization] 0..1
* entry[DispenseInformation] 1..1
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

// Originally defined on lines 64 - 90
Instance: SumatripanMedication
InstanceOf: Medication
Title: "Sample Medication Sumatripan"
Usage: #inline
* id = "SumatripanMedication"
* meta.profile[0] = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[0].valueCodeableConcept.coding.system = "http://snomed.info/sct"
* extension[0].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[0].valueCodeableConcept.coding.code = #763158003
* extension[0].valueCodeableConcept.coding.display = "Medicinal product (product)"
* extension[1].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[1].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category"
* extension[1].valueCoding.code = #00
* extension[2].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[2].valueBoolean = false
* extension[3].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[3].valueCode = #N1
* code.coding[0].system = "http://fhir.de/CodeSystem/ifa/pzn"
* code.coding[0].code = #06313728
* code.text = "Sumatriptan-1a Pharma 100 mg Tabletten"
* form.coding[0].system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM"
* form.coding[0].code = #TAB
* amount.numerator.unit = "St"
* amount.numerator.extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension[0].valueString = "20 St."
* amount.denominator.value = 1

// Originally defined on lines 92 - 109
Instance: GEM_ERP_PR_MedicationDispenseExample
InstanceOf: GEM_ERP_PR_MedicationDispense
Title: "GEM ERP PR Medication Dispense Example"
Description: "Example of a GEM_ERP_PR_MedicationDispense"
Usage: #inline
* id = "GEM-ERP-PR-MedicationDispenseExample"
* contained[0] = SumatripanMedication
* identifier[0].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[0].value = "160.000.033.491.280.78"
* status = #completed
* medicationReference.reference = "#SumatripanMedication"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X234567890"
* performer[0].actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* performer[0].actor.identifier.value = "3-abc-1234567890"
* whenHandedOver = "2022-02-28"
* dosageInstruction[0].text = "1-0-1-0"

// Originally defined on lines 112 - 134
Instance: DispenseInformationExample
InstanceOf: GEM_PR_ERP_MEDREQ_DispenseInformationBundle
Title: "Example of DispenseInformationBundle"
Description: "Example of DispenseInformationBundle to provide a complete information ressource about the dispense"
Usage: #example
* id = "DispenseInformationExample"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2e3200df-66e1-4c82-90e1-1bdec82f8442"
* type = #message
* timestamp = "2022-12-12T12:12:54.234+02:00"
* entry[0][MessageHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/MessageHeaderExampleDispensingOrganisation"
* entry[0][MessageHeader].resource = MessageHeaderExampleDispensingOrganisation
* entry[0][Prescription].fullUrl = "https://gematik.de/fhir/Prescription/KBV-PR-ERP-PrescriptionExample"
* entry[0][Prescription].resource = KBV_PR_ERP_PrescriptionExample
* entry[0][Patient].fullUrl = "https://gematik.de/fhir/Patient/KBV-PR-FOR-PatientExample"
* entry[0][Patient].resource = KBV_PR_FOR_PatientExample
* entry[0][RequestingOrganization].fullUrl = "https://gematik.de/fhir/RequestingOrganization/RequestingOrganizationExample"
* entry[0][RequestingOrganization].resource = RequestingOrganizationExample
* entry[0][DispensingOrganization].fullUrl = "https://gematik.de/fhir/DispensingOrganization/DispensingOrganizationExample"
* entry[0][DispensingOrganization].resource = DispensingOrganizationExample
* entry[0][DispenseInformation].fullUrl = "https://gematik.de/fhir/MedicationDispense/GEM-ERP-PR-MedicationDispenseExample"
* entry[0][DispenseInformation].resource = GEM_ERP_PR_MedicationDispenseExample

