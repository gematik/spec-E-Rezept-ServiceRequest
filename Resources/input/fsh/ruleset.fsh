RuleSet: Meta
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"

RuleSet: MetaProfile (profileName)
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/{profileName}|0.9" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0
* meta.tag 0..0

RuleSet: MetaInstance(profileName)
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/{profileName}|0.9" (exactly)