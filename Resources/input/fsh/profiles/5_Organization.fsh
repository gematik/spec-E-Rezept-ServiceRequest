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
and KIM-Adresse 1..1 MS
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

Instance: Example-Pharmacy-Organization
InstanceOf: GEM_PR_ERP_MEDREQ_Organization
Usage: #example
Title: "Example-Pharmacy-Organization"
Description: "Beispiel Apotheke zur Belieferung des Medikaments"
* identifier[Telematik-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "1-031234567"

* identifier[TIM-Adresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#tim
* identifier[TIM-Adresse].system = $tim
* identifier[TIM-Adresse].value = "abrakadabra@tim.de"

* identifier[KIM-Adresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0
* identifier[KIM-Adresse].system = $kim
* identifier[KIM-Adresse].value = "abrakadabra@kim.de"

Instance: Example-HealthCareService-Organization
InstanceOf: GEM_PR_ERP_MEDREQ_Organization
Usage: #example
Title: "Example-HealthCareService-Organization"
Description: "Beispiel Pflegeeinrichtung"
* identifier[Telematik-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "andere-telematik-id"

* identifier[TIM-Adresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#tim
* identifier[TIM-Adresse].system = $tim
* identifier[TIM-Adresse].value = "wunder-zunder@tim.de"

* identifier[KIM-Adresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0
* identifier[KIM-Adresse].system = $kim
* identifier[KIM-Adresse].value = "wunder-zunder@kim.de"