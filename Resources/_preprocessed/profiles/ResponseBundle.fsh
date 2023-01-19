// Originally defined on lines 1 - 69
Profile: GEM_PR_ERP_MEDREQ_ResponseBundle
Parent: Bundle
Id: GEM-PR-ERP-MEDREQ-ResponseBundle
Title: "GEM PR ERP MEDREQ Response Bundle"
Description: "A communication resource for collecting information objects needed for responding to a medication request"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-ResponseBundle"
* ^version = "1.0"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-ResponseBundle|1.0" (exactly)
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
    ResponseHeader 0.. and
    Prescription 0.. and
    Patient 0.. and
    Practitioner 0.. and
    PrescribingOrganization 0.. and
    RequestingOrganization 0.. and
    DispensingOrganization 0..
* entry[ResponseHeader] 1..1
* entry[Prescription] 1..1
* entry[Patient] 1..1
* entry[Practitioner] 1..1
* entry[PrescribingOrganization] 1..1
* entry[RequestingOrganization] 1..1
* entry[DispensingOrganization] 0..1
* entry[ResponseHeader].link ..0
* entry[ResponseHeader].resource 1..
* entry[ResponseHeader].resource only GEM_PR_ERP_MEDREQ_ResponseHeader
* entry[ResponseHeader].search ..0
* entry[ResponseHeader].request ..0
* entry[ResponseHeader].response ..0
* entry[Prescription].link ..0
* entry[Prescription].resource 1..
* entry[Prescription].resource only KBV_PR_ERP_Prescription
* entry[Prescription].search ..0
* entry[Prescription].request ..0
* entry[Prescription].response ..0
* entry[Patient].link ..0
* entry[Patient].resource 1..
* entry[Patient].resource only https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient
* entry[Patient].search ..0
* entry[Patient].request ..0
* entry[Patient].response ..0
* entry[Practitioner].link ..0
* entry[Practitioner].resource 1..
* entry[Practitioner].resource only https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner
* entry[Practitioner].search ..0
* entry[Practitioner].request ..0
* entry[Practitioner].response ..0
* entry[PrescribingOrganization].link ..0
* entry[PrescribingOrganization].resource 1..
* entry[PrescribingOrganization].resource only GEM_PR_ERP_MEDREQ_Organization
* entry[PrescribingOrganization].search ..0
* entry[PrescribingOrganization].request ..0
* entry[PrescribingOrganization].response ..0
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

// Originally defined on lines 71 - 87
Instance: KBV_PR_FOR_PractitionerExample
InstanceOf: KBV_PR_FOR_Practitioner
Title: "KBV_PR_FOR_PractitionerExample"
Description: "Example of a KBV_PR_FOR_Practitioner"
Usage: #inline
* id = "KBV-PR-FOR-PractitionerExample"
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#LANR
* identifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
* identifier.value = "754236701"
* name.use = #official
* name.family = "Schulz"
* name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name.family.extension.valueString = "Schulz"
* name.given = "Ben"
* qualification[0].code = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type#00
* qualification[1].code = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung#Berufsbezeichnung
* qualification[1].code.text = "Facharzt für Allgemeinmedizin"

// Originally defined on lines 89 - 107
Instance: KBV_PR_ERP_PrescriptionExample
InstanceOf: KBV_PR_ERP_Prescription
Title: "KBV_PR_ERP_PrescriptionExample"
Description: "Example of a KBV_PR_ERP_Prescription"
Usage: #inline
* id = "KBV-PR-ERP-PrescriptionExample"
* extension[0][Notdienstgebuehr].valueBoolean = false
* extension[0][BVG].valueBoolean = false
* extension[0][Mehrfachverordnung].extension[0][Kennzeichen].valueBoolean = false
* medicationReference = Reference(MedicationExamplePZN)
* subject = Reference(KBV_PR_FOR_PatientExample)
* authoredOn = "2022-12-04"
* requester = Reference(KBV_PR_FOR_PractitionerExample)
* dosageInstruction.extension[Dosierungskennzeichen].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension[Dosierungskennzeichen].valueBoolean = true
* dosageInstruction.text = "3mal täglich dünn auftragen"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true
* insurance = Reference(KBV_PR_FOR_CoverageExample)

// Originally defined on lines 109 - 127
Instance: KBV_PR_FOR_CoverageExample
InstanceOf: KBV_PR_FOR_Coverage
Usage: #inline
* id = "KBV-PR-FOR-CoverageExample"
* extension[0][BesonderePersonengruppe].url = "http://fhir.de/StructureDefinition/gkv/besondere-personengruppe"
* extension[0].url = "http://fhir.de/StructureDefinition/gkv/besondere-personengruppe"
* extension[0].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_PERSONENGRUPPE#00
* extension[1].url = "http://fhir.de/StructureDefinition/gkv/dmp-kennzeichen"
* extension[1].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DMP#00
* extension[2].url = "http://fhir.de/StructureDefinition/gkv/wop"
* extension[2].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ITA_WOP#01
* extension[3].url = "http://fhir.de/StructureDefinition/gkv/versichertenart"
* extension[3].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS#1
* status = #active
* type = http://fhir.de/CodeSystem/versicherungsart-de-basis#SEL
* beneficiary = Reference(Patient/30635f5d-c233-4500-94e8-6414940236aa)
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "108018347"
* payor.display = "AOK Baden-Württemberg"

// Originally defined on lines 129 - 153
Instance: ResponseBundleExample
InstanceOf: GEM_PR_ERP_MEDREQ_ResponseBundle
Title: "GEM PR ERP MEDREQ Response Bundle Example"
Description: "Example of a response bundle for a medicationrequest"
Usage: #example
* id = "ResponseBundleExample"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* type = #message
* timestamp = "2022-12-04T08:52:41.153+02:00"
* entry[0][ResponseHeader].fullUrl = "https://gematik.de/fhir/ResponseHeader/00dd7c71-ef9c-4d68-ab8a-e4e160b9806c"
* entry[0][ResponseHeader].resource = ResponseHeaderExample
* entry[0][Prescription].fullUrl = "https://gematik.de/fhir/Prescription/KBV-PR-ERP-PrescriptionExample"
* entry[0][Prescription].resource = KBV_PR_ERP_PrescriptionExample
* entry[0][Patient].fullUrl = "https://gematik.de/fhir/Patient/KBV-PR-FOR-PatientExample"
* entry[0][Patient].resource = KBV_PR_FOR_PatientExample
* entry[0][Practitioner].fullUrl = "https://gematik.de/fhir/Practitioner/KBV-PR-FOR-PractitionerExample"
* entry[0][Practitioner].resource = KBV_PR_FOR_PractitionerExample
* entry[0][PrescribingOrganization].fullUrl = "https://gematik.de/fhir/PrescribingOrganization/PrescribingOrganizationExample"
* entry[0][PrescribingOrganization].resource = PrescribingOrganizationExample
* entry[0][RequestingOrganization].fullUrl = "https://gematik.de/fhir/RequestingOrganization/RequestingOrganizationExample"
* entry[0][RequestingOrganization].resource = RequestingOrganizationExample
* entry[0][DispensingOrganization].fullUrl = "https://gematik.de/fhir/DispensingOrganization/DispensingOrganizationExample"
* entry[0][DispensingOrganization].resource = DispensingOrganizationExample

