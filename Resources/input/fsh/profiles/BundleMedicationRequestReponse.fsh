Profile: BundleMedicationRequestReponse
Parent: Bundle
Id: erp-medicationrequestresponse-bundle
Title: "Message Bundle for a response to a MedicationRequest"
Description: "A communication resource used for responding to a medication request"
* insert Meta
* id 1..1
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/BundleMedicationRequestResponse|0.1" (exactly)
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
    MedicationRequest 1..1 and
    Patient 1..1 and
    Organization 1..1
* entry[Header].link ..0
* entry[Header].resource 1..
* entry[Header].resource only MessageHeaderMedicationRequest
* entry[Header].search ..0
* entry[Header].request ..0
* entry[Header].response ..0
* entry[MedicationRequest].link ..0
* entry[MedicationRequest].resource 1..
* entry[MedicationRequest].resource only $KBV_PR_ERP_Prescription
* entry[MedicationRequest].search ..0
* entry[MedicationRequest].request ..0
* entry[MedicationRequest].response ..0
* entry[Patient].link ..0
* entry[Patient].resource 1..
* entry[Patient].resource only KBV_PR_FOR_Patient
* entry[Patient].search ..0
* entry[Patient].request ..0
* entry[Patient].response ..0
* entry[Organization].link ..0
* entry[Organization].resource 1..
* entry[Organization].resource only Organization
* entry[Organization].search ..0
* entry[Organization].request ..0
* entry[Organization].response ..0
// PlegeEinrichtung zu "RequestingOrganization" (oder Besser) Umbennnen
// ZustellTyp Codessystem : Selbstabholer ODER "Heimbelieferung durch Apotheke" ODER "über PflegeEinrichtung"
