Profile: GEM_ERP_PR_MEDREQ_Bundle
Parent: Bundle
Id: gem-erp-pr-medreq-bundle
Title: "GEM ERP PR MEDREQ Bundle"
Description: "Bundle that is used for MedicationRequests with KIM"
* insert Meta (GEM_ERP_PR_MEDREQ_Bundle)
* insert MetaProfile (GEM_ERP_PR_MEDREQ_Bundle)
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
* entry ^slicing.rules = #open
* entry contains
    MessageHeader 1..1 and
    ServiceRequest 1..* and
    MedicationRequest 0..* and
    DispenseInformation 0..* and
    Patient 1..1 and
    Practitioner 0..*
* entry[MessageHeader].resource only GEM_PR_ERP_MEDREQ_MessageHeader
* entry[ServiceRequest].resource only GEM_PR_ERP_MEDREQ_ServiceRequest
* entry[MedicationRequest].resource only GEM_PR_ERP_MEDREQ_MedicationRequest
* entry[DispenseInformation].resource only GEM_ERP_PR_MedicationDispense
* entry[Patient].resource only $KBV_PR_FOR_Patient
* entry[Practitioner].resource only $KBV_PR_FOR_Practitioner
