Profile: GEM_PR_ERP_MEDREQ_CancellationBundle
Parent: Bundle
Id: GEM-PR-ERP-MEDREQ-CancellationBundle
Title: "GEM PR ERP MEDREQ Cancellation Bundle"
* insert Meta (GEM_PR_ERP_MEDREQ_CancellationBundle)
* insert MetaProfile (GEM_PR_ERP_MEDREQ_CancellationBundle)
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
* id = "b3a37c29-6b34-442e-91a3-8a1343115e1a"
* MetaInstance(GEM_PR_ERP_MEDREQ_CancellationBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2d77d48c-f177-4540-82b2-3a25d20d1cc9"
* type = #message
* timestamp = "2022-12-07T12:12:54.234+02:00"
* entry[+][CancellationHeader].resource = CancellationHeaderExample_DispensingOrganisation

Instance: GEM_PR_ERP_MEDREQ_CancellationBundleExample_RequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationBundle
Usage: #example
Title: "Example of CancellationBundle by a RequestingOrganisation"
Description: "Example of a cancellation bundle of a medicationrequest initiated by a RequestingOrganization"
* id = "7fa39618-5e2e-4e14-a38b-02ee9a6a016f"
* MetaInstance(GEM_PR_ERP_MEDREQ_CancellationBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2d77d48c-f177-4540-82b2-3a25d20d1cc9"
* type = #message
* timestamp = "2022-12-07T12:12:54.234+02:00"
* entry[+][CancellationHeader].resource = CancellationHeaderExample_RequestingOrganisation

Instance: GEM_PR_ERP_MEDREQ_CancellationBundleExmaple_Practitioner
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationBundle
Usage: #example
Title: "Example of CancellationBundle by a Practitioner"
Description: "Example of a cancellation bundle of a medicationrequest initiated by a Practitioner"
* id = "3744277b-27d5-470c-b5c5-38d3e9535dbd"
* MetaInstance(GEM_PR_ERP_MEDREQ_CancellationBundle)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:2d77d48c-f177-4540-82b2-3a25d20d1cc9"
* type = #message
* timestamp = "2022-12-07T12:12:54.234+02:00"
* entry[+][CancellationHeader].resource = CancellationHeaderExample_Praxis