// Originally defined on lines 1 - 26
Profile: GEM_PR_ERP_MEDREQ_CancellationBundle
Parent: Bundle
Id: GEM-PR-ERP-MEDREQ-CancellationBundle
Title: "GEM PR ERP MEDREQ Cancellation Bundle"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-CancellationBundle"
* ^version = "1.0"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-CancellationBundle|1.0" (exactly)
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
* entry contains CancellationHeader 0..
* entry[CancellationHeader] 1..1
* entry[CancellationHeader].link ..0
* entry[CancellationHeader].resource 1..
* entry[CancellationHeader].resource only GEM_PR_ERP_MEDREQ_CancellationHeader
* entry[CancellationHeader].search ..0
* entry[CancellationHeader].request ..0
* entry[CancellationHeader].response ..0

// Originally defined on lines 28 - 40
Instance: GEM_PR_ERP_MEDREQ_CancellationBundleExample_DispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationBundle
Title: "Example of CancellationBundle by a DispensingOrganisation"
Description: "Example of a cancellation bundle of a medicationrequest initiated by a RequestingOrganization"
Usage: #example
* id = "CancellationBundleExample-DispensingOrganisation"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2d77d48c-f177-4540-82b2-3a25d20d1cc9"
* type = #message
* timestamp = "2022-12-07T12:12:54.234+02:00"
* entry[0][CancellationHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/CancellationHeaderExample-DispensingOrganisation"
* entry[0][CancellationHeader].resource = CancellationHeaderExample_DispensingOrganisation

// Originally defined on lines 42 - 54
Instance: GEM_PR_ERP_MEDREQ_CancellationBundleExample_RequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationBundle
Title: "Example of CancellationBundle by a RequestingOrganisation"
Description: "Example of a cancellation bundle of a medicationrequest initiated by a RequestingOrganization"
Usage: #example
* id = "CancellationBundleExample-RequestingOrganisation"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2d77d48c-f177-4540-82b2-3a25d20d1cc9"
* type = #message
* timestamp = "2022-12-07T12:12:54.234+02:00"
* entry[0][CancellationHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/CancellationHeaderExample-RequestingOrganisation"
* entry[0][CancellationHeader].resource = CancellationHeaderExample_RequestingOrganisation

// Originally defined on lines 56 - 68
Instance: GEM_PR_ERP_MEDREQ_CancellationBundleExample_Practitioner
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationBundle
Title: "Example of CancellationBundle by a Practitioner"
Description: "Example of a cancellation bundle of a medicationrequest initiated by a Practitioner"
Usage: #example
* id = "CancellationBundleExmaple-Practitioner"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2d77d48c-f177-4540-82b2-3a25d20d1cc9"
* type = #message
* timestamp = "2022-12-07T12:12:54.234+02:00"
* entry[0][CancellationHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/CancellationHeaderExample-Praxis"
* entry[0][CancellationHeader].resource = CancellationHeaderExample_Praxis

