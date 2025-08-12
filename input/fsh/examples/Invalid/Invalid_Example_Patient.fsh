Instance: INVALID-Patient
InstanceOf: ERPServiceRequestPatient
Usage: #example
Title: "Invalider Patient"
Description: "Dieses Beispiel ist invalide und dient nur der Sicherstellung der Validierung."
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
  * line.extension[Adresszusatz].valueString = "Löwenzahn"
  * city = "Berlin"
  * postalCode = "10623"
