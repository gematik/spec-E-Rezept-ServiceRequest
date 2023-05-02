Profile: IdentifierEPrescriptionToken
Parent: Identifier
Id: identifier-eprescription-token
Title: "Identifier für ein E-Rezept-Token"
Description: "Identifier, der ein E-Rezept-Token enthält"
* insert Meta (identifier-eprescription-token)
* system 1..1 MS
* system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken" (exactly)
* value 1..1 MS
  * ^short = "Angabe des E-Rezept-Tokens"
  * ^comment = "Der Token hat die Form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. Siehe [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."

Instance: NamingSystemEPrescriptionToken
InstanceOf: NamingSystem
Usage: #definition
Title: "E-Rezept-Token NamingSystem"
Description: "NamingSystem zur Angabe eines E-Rezept-Tokens"
* name = "NamingSystemEPrescriptionToken"
* status = #draft
* kind = #identifier
* date = "2023-02-01"
* publisher = "gematik GmbH"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de/"
* responsible = "gematik GmbH"
* description = "NamingSystem zur Angabe eines E-Rezept-Tokens"
* uniqueId.type = #uri
* uniqueId.value = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken" //fhir/erp da es irgendwann in dieses Repo migrieren soll
* uniqueId.preferred = true