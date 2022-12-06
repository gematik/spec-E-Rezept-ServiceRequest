Profile: GEM_PR_ERP_MEDREQ_CancellationBundle
Parent: Bundle
Id: gem-pr-erp-medreq-cancellation-bundle
Title: "GEM PR ERP MEDREQ Cancellation Bundle"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_CancellationBundle)
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
    CancellationHeader 1..1
* entry[CancellationHeader].link ..0
* entry[CancellationHeader].resource 1..
* entry[CancellationHeader].resource only GEM_PR_ERP_MEDREQ_CancellationHeader
* entry[CancellationHeader].search ..0
* entry[CancellationHeader].request ..0
* entry[CancellationHeader].response ..0