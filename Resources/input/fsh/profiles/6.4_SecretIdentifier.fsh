Profile: IdentifierSecret
Parent: Identifier
Id: identifier-secret
Title: "Secret"
Description: "Identifier für das Secret, das eine Apotheke erhält, wenn sie ein E-Rezept vom E-Rezept-Fachdienst abruft"
* insert Meta (identifier-secret)
* system 1..1 MS
* system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret" (exactly)
* value 1..1 MS

Instance: NamingSystemSecret
InstanceOf: NamingSystem
Usage: #definition
Title: "E-Rezept Secret NamingSystem"
Description: "NamingSystem zur Angabe eines Secrets einer Apotheke, was sie erhält, wenn sie ein E-Rezept vom E-Rezept-Fachdienst abruft"
* name = "NamingSystemSecret"
* status = #draft
* kind = #identifier
* date = "2023-02-01"
* publisher = "gematik GmbH"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de/"
* responsible = "gematik GmbH"
* description = "NamingSystem zur Angabe eines Secrets einer Apotheke, was sie erhält, wenn sie ein E-Rezept vom E-Rezept-Fachdienst abruft"
* uniqueId.type = #uri
* uniqueId.value = "https://gematik.de/fhir/erp/sid/NamingSystemSecret" //fhir/erp da es irgendwann in dieses Repo migrieren soll
* uniqueId.preferred = true