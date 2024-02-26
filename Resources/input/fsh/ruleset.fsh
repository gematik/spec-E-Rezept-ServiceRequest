RuleSet: Meta (profileName)
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/{profileName}"
* ^version = "1.0"

RuleSet: MetaValueSet(profileName)
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erp-servicerequest/ValueSet/{profileName}"
* ^version = "1.0"

RuleSet: MetaCodeSystem(profileName)
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erp-servicerequest/CodeSystem/{profileName}"
* ^version = "1.0"

RuleSet: MetaInstance(profileName)
* meta.profile = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/{profileName}"
