Profile: GEM_PR_ERP_MEDREQ_RequestBundle
Parent: Bundle
Id: gem-pr-erp-medreq-request-bundle
Title: "GEM PR ERP MEDREQ Request Bundle"
Description: "A communication resource used for requesting a medication"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_RequestBundle)
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
    MedicationRequest 1..1 and
    Patient 1..1 and
    RequestingOrganization 1..1
* entry[Header].link ..0
* entry[Header].resource 1..
* entry[Header].resource only GEM_PR_ERP_MEDREQ_MessageHeaderMedicationRequest
* entry[Header].search ..0
* entry[Header].request ..0
* entry[Header].response ..0
* entry[MedicationRequest].link ..0
* entry[MedicationRequest].resource 1..
* entry[MedicationRequest].resource only GEM_PR_ERP_MEDREQ_MedicationRequest
* entry[MedicationRequest].search ..0
* entry[MedicationRequest].request ..0
* entry[MedicationRequest].response ..0
* entry[Patient].link ..0
* entry[Patient].resource 1..
* entry[Patient].resource only $KBV_PR_FOR_Patient
* entry[Patient].search ..0
* entry[Patient].request ..0
* entry[Patient].response ..0
* entry[RequestingOrganization].link ..0
* entry[RequestingOrganization].resource 1..
* entry[RequestingOrganization].resource only GEM_PR_ERP_MEDREQ_RequestingOrganization
* entry[RequestingOrganization].search ..0
* entry[RequestingOrganization].request ..0
* entry[RequestingOrganization].response ..0