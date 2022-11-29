Profile: GEM_PR_ERP_MEDREQ_DispenseInformationBundle
Parent: Bundle
Id: GEM_PR_ERP_MEDREQ_DispenseInformationBundle
Title: "GEM_PR_ERP_MEDREQ_DispenseInformationBundle"
Description: "Communication resource for sending dispenseInformation about a medication requisition."
* insert Meta
* id 1..1
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/BundleMedicationRequestDispenseInformation|0.1" (exactly)
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
* entry[Header].resource only MessageHeaderMedicationRequest
* entry[Header].search ..0
* entry[Header].request ..0
* entry[Header].response ..0
* entry[DispenseInformation].link ..0
* entry[DispenseInformation].resource 1..
* entry[DispenseInformation].resource only $GEM_ERP_PR_MedicationDispense
* entry[DispenseInformation].search ..0
* entry[DispenseInformation].request ..0
* entry[DispenseInformation].response ..0