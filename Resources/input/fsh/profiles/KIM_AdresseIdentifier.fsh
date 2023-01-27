Profile: GEM_PR_MEDREQ_KIMAdresse
Parent: Identifier
Id: gem-pr-medreq-kim-adresse
Title: "GEM PR MEDREQ KIM-Adresse"
Description: "Identifier zur Angabe der KIM-Adresse"
* system = $kim

Instance: GEM-NS-KIM-Adresse
InstanceOf: NamingSystem
Usage: #definition
Title: "GEM NS KIM-Adresse"
Description: "NamingSystem for Gematik KIM-Adresse"
* name = "GEM_NS_KIM-Adresse"
* status = #active
* kind = #identifier
* date = "2023-02-01"
* publisher = "gematik GmbH"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de/"
* responsible = "gematik GmbH"
* description = "E-Rezept Token"
* uniqueId.type = #uri
* uniqueId.value = $kim
* uniqueId.preferred = true