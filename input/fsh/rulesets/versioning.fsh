// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #active
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^version = "1.2.0"
* ^date = "2025-07-31"

RuleSet: VersioningInst
* status = #active
* experimental = false
* publisher = "gematik GmbH"
* version = "1.2.0"
* date = "2025-07-31"
* contact.name = "gematik GmbH"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de"

//TODO: Add meta.profile to Profiles

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
* meta.profile = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/{profileName}|1.2"
