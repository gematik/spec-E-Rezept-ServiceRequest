Profile: MessageHeaderMedicationRequst
Parent: MessageHeader
Id: erp-medicationrequest-header
* insert Meta
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    Rezeptendempfaenger named Rezeptendempfaenger 1..1 and
* extension[Rezeptendempfaenger].value[x] 1..

// hier OID anfragende Organisation
* event[x] only Coding
* event[x] from OrganizationTypeVS

* sender 1..
* sender only Reference(Organization)
* sender.reference 1..
* source.endpoint = "https://ehex.de/KIM" (exactly)