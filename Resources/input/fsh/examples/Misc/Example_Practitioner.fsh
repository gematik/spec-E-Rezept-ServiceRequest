Instance: Example-Practitioner
InstanceOf: ERPServiceRequestPractitioner
Usage: #example
Title: "Example-Practitioner"
Description: "Beispielarzt zum Ausstellen der Rezepte"
* identifier[ANR].type = http://terminology.hl7.org/CodeSystem/v2-0203#LANR
* identifier[ANR].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
* identifier[ANR].value = "838382202"
* identifier[Telematik-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "1-838382202"
* name[name].use = #official
* name[name].family = "Topp-Glücklich"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Topp-Glücklich"
* name[name].given = "Hans"
* name[name].prefix = "Dr. med."
* name[name].prefix.extension[prefix-qualifier].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier"
* name[name].prefix.extension[prefix-qualifier].valueCode = #AC