Instance: Example-Patient
InstanceOf: ERPServiceRequestPatient
Usage: #example
Title: "Example-Patient"
Description: "Beispiel Patient"
* identifier[versichertenId_GKV].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[versichertenId_GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId_GKV].value = "X234567890"
* name[name].use = #official
* name[name].family = "Königsstein"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Königsstein"
* name[name].given = "Ludger"
* birthDate = "1935-06-22"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Musterstr. 1"
* address[Strassenanschrift].line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[Hausnummer].valueString = "1"
* address[Strassenanschrift].line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[Strasse].valueString = "Musterstr."
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10623"