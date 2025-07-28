Profile: ERPServiceRequestEPrescriptionToken
Parent: Identifier
Id: erp-service-request-eprescription-token
Title: "ERP Service Request EPrescription Token"
Description: "Identifier containing an e-prescription token"
* insert Meta (erp-service-request-eprescription-token)
* system 1..1 MS
* system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken" (exactly)
* value 1..1 MS
  * ^short = "Specification of the e-prescription token"
  * ^comment = "The token is of the form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. See [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."

Instance: NamingSystemEPrescriptionToken
InstanceOf: NamingSystem
Usage: #definition
Title: "E-Rezept-Token NamingSystem"
Description: "NamingSystem for specifying an e-prescription token"
* name = "NamingSystemEPrescriptionToken"
* status = #active
* kind = #identifier
* date = "2023-02-01"
* publisher = "gematik GmbH"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.gematik.de/"
* responsible = "gematik GmbH"
* description = "NamingSystem for specifying an e-prescription token"
* uniqueId.type = #uri
* uniqueId.value = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken" //fhir/erp da es irgendwann in dieses Repo migrieren soll
* uniqueId.preferred = true
