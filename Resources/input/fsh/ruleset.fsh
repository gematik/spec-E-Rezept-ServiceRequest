// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^version = "1.0"

RuleSet: Meta (profileName)
* insert Versioning
* ^url = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/{profileName}"

RuleSet: MetaValueSet(profileName)
* insert Versioning
* ^url = "https://gematik.de/fhir/erp-servicerequest/ValueSet/{profileName}"

RuleSet: MetaCodeSystem(profileName)
* insert Versioning
* ^url = "https://gematik.de/fhir/erp-servicerequest/CodeSystem/{profileName}"

RuleSet: MetaInstance(profileName)
* meta.profile = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/{profileName}"
