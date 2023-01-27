Profile: GEM_PR_ERP_MEDREQ_Organization
Parent: Organization
Id: GEM-PR-ERP-MEDREQ-Organization
Title: "GEM_PR_ERP_MEDREQ_Organization"
Description: "Organisation in MedReq Context"
* insert Meta (GEM-PR-ERP-MEDREQ-Organization)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-Organization)

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open

* identifier contains  Telematik-ID 1..1 MS
and KIM-Adresse 0..1 MS
and TIM-Adresse 0..1 MS

* identifier[Telematik-ID] only $telematikid
* identifier[Telematik-ID].type 1..1
* identifier[Telematik-ID].type.coding 1..1
* identifier[Telematik-ID].type.coding.system 1..1
* identifier[Telematik-ID].type.coding.code 1..1
* identifier[Telematik-ID].type.coding.display = "Telematik-ID"

* identifier[KIM-Adresse] only GEM_PR_MEDREQ_KIMAdresse
* identifier[KIM-Adresse].type 1..1
* identifier[KIM-Adresse].type.coding 1..1
* identifier[KIM-Adresse].type.coding.system 1..1
* identifier[KIM-Adresse].type.coding.code 1..1
* identifier[KIM-Adresse].type.coding.display = "KIM-Adresse"

* identifier[TIM-Adresse] only GEM_PR_MEDREQ_TIMAdresse
* identifier[TIM-Adresse].type 1..1
* identifier[TIM-Adresse].type.coding 1..1
* identifier[TIM-Adresse].type.coding.system 1..1
* identifier[TIM-Adresse].type.coding.code 1..1
* identifier[TIM-Adresse].type.coding.display = "TIM-Adresse"

