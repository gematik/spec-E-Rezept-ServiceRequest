Profile: GEM_PR_MEDREQ_EPrescriptionTokenIdentifier
Parent: Identifier
Id: GEM-PR-MEDREQ-EPrescriptionTokenIdentifier
Title: "GEM PR MEDREQ E Prescription Token Identifier"
Description: "Identifier für den E-Rezept Token"
* insert Meta (GEM-PR-MEDREQ-EPrescriptionTokenIdentifier)
* system 1..1 MS
* system = "https://gematik.de/fhir/erp/sid/GEM_NS_EPrescriptionToken" (exactly)
* value 1..1 MS
//TODO: fix Expression * value obeys GEM-INV-E-Prescription-Regex

Invariant: GEM-INV-E-Prescription-Regex
Description: "Regex Invariante zur Validierung eines E-Rezept Tokens"
Expression: "$this.toString().matches('^Task/[0-9]{3}.[0-9]{3}.[0-9]{3}.[0-9]{3}.[0-9]{3}.[0-9]{2}/$accept?ac=[A-Za-z0-9]+$')"
Severity: #error

Instance: GEM-NS-E-Prescription-Token
InstanceOf: NamingSystem
Usage: #definition
Title: "GEM NS E Prescription Token"
Description: "NamingSystem for Gematik E-Prescription Token"
* name = "GEM_NS_EPrescriptionToken"
* status = #draft
* kind = #identifier
* date = "2023-02-01"
* publisher = "gematik GmbH"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de/"
* responsible = "gematik GmbH"
* description = "E-Rezept Token"
* uniqueId.type = #uri
* uniqueId.value = "https://gematik.de/fhir/erp/sid/GEM_NS_EPrescriptionToken"
* uniqueId.preferred = true