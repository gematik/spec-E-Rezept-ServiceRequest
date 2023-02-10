Extension: GEM_EX_MEDREQ_EPrescriptionToken
Id: GEM-EX-MEDREQ-EPrescriptionToken
Title: "GEM EX MEDREQ E Prescription Token"
Description: "This extension carries an eprescription token"
* insert Meta (GEM-EX-MEDREQ-EPrescriptionToken)
* value[x] only Identifier
* value[x].system = "https://gematik.de/fhir/erp/sid/GEM_NS_EPrescriptionToken" (exactly)
//TODO: fix Expression * value[x].value obeys GEM-INV-E-Prescription-Regex

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