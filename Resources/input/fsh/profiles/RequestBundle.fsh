Profile: GEM_PR_ERP_MEDREQ_RequestBundle
Parent: Bundle
Id: GEM-PR-ERP-MEDREQ-RequestBundle
Title: "GEM PR ERP MEDREQ Request Bundle"
Description: "A communication resource for collecting information objects needed to request a medication"
* insert Meta (GEM_PR_ERP_MEDREQ_RequestBundle)
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
    Practitioner 0..1 and
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
* entry[Patient].resource only KBV_PR_FOR_Patient
* entry[Patient].search ..0
* entry[Patient].request ..0
* entry[Patient].response ..0
* entry[Practitioner].link ..0
* entry[Practitioner].resource 1..
* entry[Practitioner].resource only $KBV_PR_FOR_Practitioner
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


Instance: RequestBundleExample_RequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_RequestBundle
Usage: #example
Title: "Example of RequestBundle initiated by a RequestingOrganisation"
Description: "Example of a bundle for a medicationrequest requested by a RequestingOrganization"
* id = "006b8559-3353-44dd-9888-c21aca51d696"
* MetaInstance(RequestBundleExample_RequestingOrganisation)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* type = #message
* timestamp = "2022-12-03T16:55:42.154+02:00"
* entry[+][RequestHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/3a0fa348-fc66-4f29-b842-cbad1523c846"
* entry[=][RequestHeader].resource = MessageHeaderExampleRequestingOrganisation
* entry[+][MedicationRequest].fullUrl = "https://gematik.de/fhir/MedicationRequest/fe63895a-c5df-4598-ba4a-d2fee3477cb9"
* entry[=][MedicationRequest].resource = MedicationRequestExampleSelfPickup
* entry[+][Patient].fullUrl = "https://gematik.de/fhir/Patient/b04f58bc-bb37-4490-9561-2e6954764c4a"
* entry[=][Patient].resource = KBV_PR_FOR_PatientExample
* entry[+][Practitioner].fullUrl = "https://gematik.de/fhir/Practitioner/fcdcfa8a-b1ff-488f-b32f-16359cd78596"
* entry[=][Practitioner].resource = KBV_PR_FOR_PractitionerExample
* entry[+][RequestingOrganization].fullUrl = "https://gematik.de/fhir/RequestingOrganization/a8efd0b3-58c3-48f7-89f5-67f86dd298e8"
* entry[=][RequestingOrganization].resource = RequestingOrganizationExample
* entry[+][DispensingOrganization].fullUrl = "https://gematik.de/fhir/DispensingOrganization/f89adcee-7fe3-4b06-bc5f-e17b592a3a5f"
* entry[=][DispensingOrganization].resource = DispensingOrganizationExample

Instance: RequestBundleExample_DispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_RequestBundle
Usage: #example
Title: "Example of RequestBundle initiated by a DispensingOrganisation"
Description: "Example of a bundle for a medicationrequest triggered by a DispensingOrganisation for a RequestingOrganization"
* id = "c6cac749-8a4d-4341-a6c6-14d7441bb759"
* MetaInstance(GEM_PR_ERP_MEDREQ_RequestBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:f4bb6000-fc6c-4cf0-b021-57bd0d77673f"
* type = #message
* timestamp = "2022-12-01T12:12:54.234+02:00"
* entry[+][RequestHeader].fullUrl = "https://gematik.de/fhir/RequestHeader/b2e0e631-42fd-4d8a-a7b2-a2f54fe70bf7"
* entry[=][RequestHeader].resource = MessageHeaderExampleDispensingOrganisation
* entry[+][MedicationRequest].fullUrl = "https://gematik.de/fhir/MedicationRequest/b2e0e631-42fd-4d8a-a7b2-a2f54fe70bf7"
* entry[=][MedicationRequest].resource = MedicationRequestExampleDispensingOrganisation
* entry[+][Patient].fullUrl = "https://gematik.de/fhir/Patient/b04f58bc-bb37-4490-9561-2e6954764c4a"
* entry[=][Patient].resource = KBV_PR_FOR_PatientExample
* entry[+][Practitioner].fullUrl = "https://gematik.de/fhir/Practitioner/fcdcfa8a-b1ff-488f-b32f-16359cd78596"
* entry[=][Practitioner].resource = KBV_PR_FOR_PractitionerExample
* entry[+][RequestingOrganization].fullUrl = "https://gematik.de/fhir/RequestingOrganization/a8efd0b3-58c3-48f7-89f5-67f86dd298e8"
* entry[=][RequestingOrganization].resource = RequestingOrganizationExample
* entry[+][DispensingOrganization].fullUrl = "https://gematik.de/fhir/DispensingOrganization/f89adcee-7fe3-4b06-bc5f-e17b592a3a5f"
* entry[=][DispensingOrganization].resource = DispensingOrganizationExample