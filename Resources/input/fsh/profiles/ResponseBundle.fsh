Profile: GEM_PR_ERP_MEDREQ_ResponseBundle
Parent: Bundle
Id: gem-pr-erp-medreq-response-bundle
Title: "GEM PR ERP MEDREQ Response Bundle"
Description: "A communication resource for collecting information objects needed for responding to a medication request"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_ResponseBundle)
* id 1..1
* identifier 1..
* identifier.system 1..
* identifier.system = "urn:ietf:rfc:3986" (exactly)
* identifier.value 1..
* identifier.value ^short = "Eindeutige UUID"
* type = #message (exactly)
* timestamp 1..
* entry 1..
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #closed
* entry contains
    ResponseHeader 1..1 and
    Prescription 1..1 and
    Patient 1..1 and
    RequestingOrganization 1..1 and
    DispensingOrganization 0..1
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
* entry[Patient].resource only $KBV_PR_FOR_Patient
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

Instance: KBV_PR_FOR_PractitionerExample
InstanceOf: KBV_PR_FOR_Practitioner
Usage: #inline
Title: "KBV_PR_FOR_PractitionerExample"
Description: "Example of a KBV_PR_FOR_Practitioner"
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#LANR
* identifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
* identifier.value = "754236701"
* name.use = #official
* name.family = "Schulz"
* name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name.family.extension.valueString = "Schulz"
* name.given = "Ben"
* qualification[0].code = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type#00
* qualification[+].code = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung#Berufsbezeichnung
* qualification[=].code.text = "Facharzt für Allgemeinmedizin"

Instance: KBV_PR_ERP_PrescriptionExample
InstanceOf: KBV_PR_ERP_Prescription
Usage: #inline
Title: "KBV_PR_ERP_PrescriptionExample"
Description: "Example of a KBV_PR_ERP_Prescription"
* id = "5fb9b3b5-df19-4a7a-8d19-0dee164da7fe"
* extension[+][Notdienstgebuehr].valueBoolean = false
* extension[+][BVG].valueBoolean = false
* extension[+][Mehrfachverordnung].extension[+][Kennzeichen].valueBoolean = false
* medicationReference = Reference(MedicationExamplePZN)
* subject = Reference(KBV_PR_FOR_PatientExample)
* authoredOn = "2022-12-04T08:51:40.153+02:00"
* requester = Reference(KBV_PR_FOR_PractitionerExample)
* dosageInstruction.extension[Dosierungskennzeichen].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension[Dosierungskennzeichen].valueBoolean = true
* dosageInstruction.text = "3mal täglich dünn auftragen"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true
* insurance = Reference(KBV_PR_FOR_CoverageExample)

Instance: KBV_PR_FOR_CoverageExample
InstanceOf: KBV_PR_FOR_Coverage
Usage: #inline
* extension[0].url = "http://fhir.de/StructureDefinition/gkv/besondere-personengruppe"
* extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_PERSONENGRUPPE#00
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/dmp-kennzeichen"
* extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DMP#00
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/wop"
* extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ITA_WOP#01
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/versichertenart"
* extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS#1
* status = #active
* type = http://fhir.de/CodeSystem/versicherungsart-de-basis#SEL
* beneficiary = Reference(Patient/30635f5d-c233-4500-94e8-6414940236aa)
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "108018347"
* payor.display = "AOK Baden-Württemberg"

Instance: ResponseBundleExample1
InstanceOf: GEM_PR_ERP_MEDREQ_ResponseBundle
Usage: #example
Title: "GEM PR ERP MEDREQ Response Bundle Example1"
Description: "Example of a response bundle for a medicationrequest"
* id = "f9c235cc-757d-11ed-a1eb-0242ac120002"
* MetaInstance(GEM_PR_ERP_MEDREQ_ResponseBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* type = #message
* timestamp = "2022-12-04T08:52:41.153+02:00"
* entry[+][ResponseHeader].resource = ResponseHeaderExample
* entry[+][Prescription].resource = KBV_PR_ERP_PrescriptionExample
* entry[+][Patient].resource = KBV_PR_FOR_PatientExample
* entry[+][RequestingOrganization].resource = RequestingOrganizationExample
* entry[+][DispensingOrganization].resource = DispensingOrganizationExample