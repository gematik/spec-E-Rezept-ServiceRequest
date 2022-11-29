RuleSet: Meta
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"

RuleSet: MetaProfile (profileName)
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/{profileName}|0.1" (exactly)

RuleSet: Meta-Inst
* status = #draft
* experimental = false
* version = "1.0"
* publisher = "gematik GmbH"