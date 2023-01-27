Profile: GEM_PR_ERP_MEDREQ_CancellationBundle
Parent: Bundle
Id: GEM-PR-ERP-MEDREQ-CancellationBundle
Title: "GEM PR ERP MEDREQ Cancellation Bundle"
* insert Meta (GEM-PR-ERP-MEDREQ-CancellationBundle)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-CancellationBundle)
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
    CancellationHeader 1..1
* entry[CancellationHeader].link ..0
* entry[CancellationHeader].resource 1..
* entry[CancellationHeader].resource only GEM_PR_ERP_MEDREQ_CancellationHeader
* entry[CancellationHeader].search ..0
* entry[CancellationHeader].request ..0
* entry[CancellationHeader].response ..0

Instance: GEM_PR_ERP_MEDREQ_CancellationBundleExample_DispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationBundle
Usage: #example
Title: "Example of CancellationBundle by a DispensingOrganisation"
Description: "Example of a cancellation bundle of a medicationrequest initiated by a RequestingOrganization"
* id = "CancellationBundleExample-DispensingOrganisation"
* MetaInstance(GEM-PR-ERP-MEDREQ-CancellationBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2d77d48c-f177-4540-82b2-3a25d20d1cc9"
* type = #message
* timestamp = "2022-12-07T12:12:54.234+02:00"
* entry[+][CancellationHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/CancellationHeaderExample-DispensingOrganisation"
* entry[=][CancellationHeader].resource = CancellationHeaderExample_DispensingOrganisation

Instance: GEM_PR_ERP_MEDREQ_CancellationBundleExample_RequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationBundle
Usage: #example
Title: "Example of CancellationBundle by a RequestingOrganisation"
Description: "Example of a cancellation bundle of a medicationrequest initiated by a RequestingOrganization"
* id = "CancellationBundleExample-RequestingOrganisation"
* MetaInstance(GEM-PR-ERP-MEDREQ-CancellationBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2d77d48c-f177-4540-82b2-3a25d20d1cc9"
* type = #message
* timestamp = "2022-12-07T12:12:54.234+02:00"
* entry[+][CancellationHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/CancellationHeaderExample-RequestingOrganisation"
* entry[=][CancellationHeader].resource = CancellationHeaderExample_RequestingOrganisation

Instance: GEM_PR_ERP_MEDREQ_CancellationBundleExample_Practitioner
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationBundle
Usage: #example
Title: "Example of CancellationBundle by a Practitioner"
Description: "Example of a cancellation bundle of a medicationrequest initiated by a Practitioner"
* id = "CancellationBundleExmaple-Practitioner"
* MetaInstance(GEM-PR-RP-MEDREQ-CancellationBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2d77d48c-f177-4540-82b2-3a25d20d1cc9"
* type = #message
* timestamp = "2022-12-07T12:12:54.234+02:00"
* entry[+][CancellationHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/CancellationHeaderExample-Praxis"
* entry[=][CancellationHeader].resource = CancellationHeaderExample_Praxis