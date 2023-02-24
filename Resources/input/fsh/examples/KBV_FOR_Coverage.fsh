Instance: Response-Coverage
InstanceOf: $KBV_PR_FOR_Coverage
Usage: #inline
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Coverage|1.1.0"
* extension[BesonderePersonengruppe].url = "http://fhir.de/StructureDefinition/gkv/besondere-personengruppe"
* extension[BesonderePersonengruppe].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_PERSONENGRUPPE#00
* extension[DMPKennzeichen].url = "http://fhir.de/StructureDefinition/gkv/dmp-kennzeichen"
* extension[DMPKennzeichen].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DMP#00
* extension[WOP].url = "http://fhir.de/StructureDefinition/gkv/wop"
* extension[WOP].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ITA_WOP#72
* extension[Versichertenart].url = "http://fhir.de/StructureDefinition/gkv/versichertenart"
* extension[Versichertenart].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS#3
* status = #active
* type = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV
* beneficiary = Reference(Patient/Example-Patient)
* period.end = "2040-04-01"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "108416214"
* payor.display = "AOK Bayern Die Gesundh."