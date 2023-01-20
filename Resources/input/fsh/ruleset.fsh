RuleSet: Meta (profileName)
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/{profileName}"
* ^version = "1.0"

RuleSet: MetaValueSet(profileName)
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/ValueSet/{profileName}"
* ^version = "1.0"

RuleSet: MetaCodeSystem(profileName)
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/CodeSystem/{profileName}"
* ^version = "1.0"

RuleSet: MetaProfile (profileName)
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/{profileName}|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0

RuleSet: MetaInstance(profileName)
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/{profileName}|0.9"

Bundle.entry[0].resource.ofType(MessageHeader).extension[3].value.ofType(Coding) | ValueSet https://gematik.de/fhir/erpmedreqcom/ValueSet/CancellationReasonTypeVS vom Validator nicht gefunden