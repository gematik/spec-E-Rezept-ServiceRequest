Profile: GEM_PR_ERP_MEDREQ_DispenseInformationBundle
Parent: Bundle
Id: gem-pr-erp-medreq-dispense-information-bundle
Title: "GEM PR ERP MEDREQ Dispense Information Bundle"
Description: "Communication resource for sending dispenseInformation about a medication requisition."
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_DispenseInformationBundle)
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
    Header 1..1 and
    DispenseInformation 1..1
* entry[Header].link ..0
* entry[Header].resource 1..
* entry[Header].resource only GEM_PR_ERP_MEDREQ_MessageHeaderMedicationRequest
* entry[Header].search ..0
* entry[Header].request ..0
* entry[Header].response ..0
* entry[DispenseInformation].link ..0
* entry[DispenseInformation].resource 1..
* entry[DispenseInformation].resource only https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription
* entry[DispenseInformation].search ..0
* entry[DispenseInformation].request ..0
* entry[DispenseInformation].response ..0