// Originally defined on lines 1 - 62
Profile: GEM_PR_ERP_MEDREQ_RequestBundle
Parent: Bundle
Id: GEM-PR-ERP-MEDREQ-RequestBundle
Title: "GEM PR ERP MEDREQ Request Bundle"
Description: "A communication resource for collecting information objects needed to request a medication"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-RequestBundle"
* ^version = "1.0"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-RequestBundle|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0
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
    RequestHeader 0.. and
    MedicationRequest 0.. and
    Patient 0.. and
    Practitioner 0.. and
    RequestingOrganization 0.. and
    DispensingOrganization 0..
* entry[RequestHeader] 1..1
* entry[MedicationRequest] 1..1
* entry[Patient] 1..1
* entry[Practitioner] 0..1
* entry[RequestingOrganization] 1..1
* entry[DispensingOrganization] 0..1
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
* entry[Patient].resource only KBV_PR_FOR_Patient
* entry[Patient].search ..0
* entry[Patient].request ..0
* entry[Patient].response ..0
* entry[Practitioner].link ..0
* entry[Practitioner].resource 1..
* entry[Practitioner].resource only https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner
* entry[Practitioner].search ..0
* entry[Practitioner].request ..0
* entry[Practitioner].response ..0
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

// Originally defined on lines 65 - 87
Instance: RequestBundleExample_RequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_RequestBundle
Title: "Example of RequestBundle initiated by a RequestingOrganisation"
Description: "Example of a bundle for a medicationrequest requested by a RequestingOrganization"
Usage: #example
* id = "006b8559-3353-44dd-9888-c21aca51d696"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* type = #message
* timestamp = "2022-12-03T16:55:42.154+02:00"
* entry[0][RequestHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/MessageHeaderExampleRequestingOrganisation"
* entry[0][RequestHeader].resource = MessageHeaderExampleRequestingOrganisation
* entry[0][MedicationRequest].fullUrl = "https://gematik.de/fhir/MedicationRequest/MedicationRequestExampleSelfPickup"
* entry[0][MedicationRequest].resource = MedicationRequestExampleSelfPickup
* entry[0][Patient].fullUrl = "https://gematik.de/fhir/Patient/KBV-PR-FOR-PatientExample"
* entry[0][Patient].resource = KBV_PR_FOR_PatientExample
* entry[0][Practitioner].fullUrl = "https://gematik.de/fhir/Practitioner/KBV-PR-FOR-PractitionerExample"
* entry[0][Practitioner].resource = KBV_PR_FOR_PractitionerExample
* entry[0][RequestingOrganization].fullUrl = "https://gematik.de/fhir/RequestingOrganization/a8efd0b3-58c3-48f7-89f5-67f86dd298e8"
* entry[0][RequestingOrganization].resource = RequestingOrganizationExample
* entry[0][DispensingOrganization].fullUrl = "https://gematik.de/fhir/DispensingOrganization/f89adcee-7fe3-4b06-bc5f-e17b592a3a5f"
* entry[0][DispensingOrganization].resource = DispensingOrganizationExample

// Originally defined on lines 89 - 111
Instance: RequestBundleExample_DispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_RequestBundle
Title: "Example of RequestBundle initiated by a DispensingOrganisation"
Description: "Example of a bundle for a medicationrequest triggered by a DispensingOrganisation for a RequestingOrganization"
Usage: #example
* id = "c6cac749-8a4d-4341-a6c6-14d7441bb759"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:f4bb6000-fc6c-4cf0-b021-57bd0d77673f"
* type = #message
* timestamp = "2022-12-01T12:12:54.234+02:00"
* entry[0][RequestHeader].fullUrl = "https://gematik.de/fhir/RequestHeader/MessageHeaderExampleDispensingOrganisation"
* entry[0][RequestHeader].resource = MessageHeaderExampleDispensingOrganisation
* entry[0][MedicationRequest].fullUrl = "https://gematik.de/fhir/MedicationRequest/MessageHeaderExampleDispensingOrganisation"
* entry[0][MedicationRequest].resource = MedicationRequestExampleDispensingOrganisation
* entry[0][Patient].fullUrl = "https://gematik.de/fhir/Patient/KBV-PR-FOR-PatientExample"
* entry[0][Patient].resource = KBV_PR_FOR_PatientExample
* entry[0][Practitioner].fullUrl = "https://gematik.de/fhir/Practitioner/KBV-PR-FOR-PractitionerExample"
* entry[0][Practitioner].resource = KBV_PR_FOR_PractitionerExample
* entry[0][RequestingOrganization].fullUrl = "https://gematik.de/fhir/RequestingOrganization/a8efd0b3-58c3-48f7-89f5-67f86dd298e8"
* entry[0][RequestingOrganization].resource = RequestingOrganizationExample
* entry[0][DispensingOrganization].fullUrl = "https://gematik.de/fhir/DispensingOrganization/f89adcee-7fe3-4b06-bc5f-e17b592a3a5f"
* entry[0][DispensingOrganization].resource = DispensingOrganizationExample

