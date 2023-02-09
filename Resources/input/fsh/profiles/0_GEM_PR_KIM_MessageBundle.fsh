Profile: GEM_PR_KIM_MessageBundle
Parent: Bundle
Id: GEM-PR-KIM-MessageBundle
Title: "GEM_PR_KIM_MessageBundle"
Description: "Basic Bundle for communication of FHIR Ressources with KIM Messages"
* ^status = #draft

//Slice für identifier
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
* entry ^slicing.rules = #open
* entry contains
    MessageHeader 1..1
* entry[MessageHeader].resource 1..
* entry[MessageHeader].resource only GEM_PR_KIM_MessageHeader

// Invariante zum Auflösen der Referenzen