Profile: GEM_PR_MEDREQ_TIMAdresse
Parent: Identifier
Id: gem-pr-medreq-tim-adresse
Title: "GEM PR MEDREQ TIM-Adresse"
Description: "Identifier zur Angabe der TIM-Adresse"
* system = $tim


Instance: GEM-NS-TIM-Adresse
InstanceOf: NamingSystem
Usage: #definition
Title: "GEM NS TIM-Adresse"
Description: "NamingSystem for Gematik TIM-Adresse"
* name = "GEM_NS_TIM-Adresse"
* status = #active
* kind = #identifier
* date = "2023-02-01"
* publisher = "gematik GmbH"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de/"
* responsible = "gematik GmbH"
* description = "E-Rezept Token"
* uniqueId.type = #uri
* uniqueId.value = $tim
* uniqueId.preferred = true