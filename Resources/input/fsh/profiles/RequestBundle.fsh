Profile: GEM_PR_ERP_MEDREQ_RequestBundle
Parent: Bundle
Id: gem-pr-erp-medreq-request-bundle
Title: "GEM PR ERP MEDREQ Request Bundle"
Description: "A communication resource for collecting information objects needed to request a medication"
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
    RequestHeader 1..1 and
    MedicationRequest 1..1 and
    Patient 1..1 and
    RequestingOrganization 1..1 and
    DispensingOrganization 0..1
* entry[RequestHeader].link ..0
* entry[RequestHeader].resource 1..
* entry[RequestHeader].resource only GEM_PR_ERP_MEDREQ_MessageHeader
* entry[RequestHeader].search ..0
* entry[RequestHeader].request ..0
* entry[RequestHeader].response ..0
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


Instance: RequestBundleExample_RequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_RequestBundle
Usage: #example
Title: "Example of RequestBundle by a RequestingOrganisation"
Description: "Example of a bundle for a medicationrequest requested by a RequestingOrganization"
* id = "6febb835-2e73-4028-9285-e6ca253597f6"
* MetaInstance(GEM_PR_ERP_MEDREQ_RequestBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* type = #message
* timestamp = "2022-12-03T16:55:42.154+02:00"
* entry[+][RequestHeader].resource = RequestHeaderExampleRequestingOrganisation
* entry[+][MedicationRequest].resource = MedicationRequestExampleSelfPickup
* entry[+][Patient].resource = KBV_PR_FOR_PatientExample
* entry[+][RequestingOrganization].resource = RequestingOrganizationExample
* entry[+][DispensingOrganization].resource = DispensingOrganizationExample

Instance: RequestBundleExample_DispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_RequestBundle
Usage: #example
Title: "Example of RequestBundle by a DispensingOrganisation"
Description: "Example of a bundle for a medicationrequest triggered by a DispensingOrganisation for a RequestingOrganization"
* id = "eef90d54-892a-4dcb-b1e6-2fad40b2c3e7"
* MetaInstance(GEM_PR_ERP_MEDREQ_RequestBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:f4bb6000-fc6c-4cf0-b021-57bd0d77673f"
* type = #message
* timestamp = "2022-12-01T12:12:54.234+02:00"
* entry[+][RequestHeader].resource = RequestHeaderExampleDispensingOrganisation
* entry[+][MedicationRequest].resource = MedicationRequestExampleDispensingOrganisation
* entry[+][Patient].resource = KBV_PR_FOR_PatientExample
* entry[+][RequestingOrganization].resource = RequestingOrganizationExample
* entry[+][DispensingOrganization].resource = DispensingOrganizationExample