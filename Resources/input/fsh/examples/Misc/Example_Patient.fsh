Instance: Example-Patient
InstanceOf: ERPServiceRequestPatient
Usage: #example
Title: "Example-Patient"
Description: "Beispiel Patient"
* identifier[KVNR].value = "X234567890"
* name[Name]
  * use = #official
  * family = "Königsstein"
  * family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
  * family.extension[nachname].valueString = "Königsstein"
  * given = "Ludger"
* birthDate = "1935-06-22"
* address[+]
  * type = #both
  * line = "Musterstr. 1"
  * line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
  * line.extension[Hausnummer].valueString = "1"
  * line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
  * line.extension[Strasse].valueString = "Musterstr."
  * city = "Berlin"
  * postalCode = "10623"

Instance: Example-Patient-2
InstanceOf: ERPServiceRequestPatient
Usage: #inline
Title: "Example-Patient-2"
Description: "Beispiel Patient 2"
* identifier[KVNR].value = "X098765432"
* name[Name]
  * use = #official
  * family = "Edgarson"
  * family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
  * family.extension[nachname].valueString = "Edgarson"
  * given = "Peter"
* birthDate = "1974-01-31"
* address[+]
  * type = #both
  * line = "Erikastraße 43"
  * line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
  * line.extension[Hausnummer].valueString = "43"
  * line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
  * line.extension[Strasse].valueString = "Erikastraße"
  * city = "Berlin"
  * postalCode = "10742"