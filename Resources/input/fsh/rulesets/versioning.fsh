// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^version = "1.2"
* ^date = "2025-01-01"

RuleSet: VersioningInst
* status = #draft
* experimental = false
* publisher = "gematik GmbH"
* version = "1.2"
* date = "2025-01-01"
* contact.name = "gematik GmbH"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"

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
