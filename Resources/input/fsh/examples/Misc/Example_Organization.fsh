Instance: Example-HealthCareService-Organization
InstanceOf: ERPServiceRequestOrganization
Usage: #example
* name = "Pflegeheim Immergrün"
* type.coding[organization-type] = $CSIHEPatientBezogenenGesundheitsversorgung#PFL "Pflegeheim"
* contact.telecom[tel].system = #phone
* contact.telecom[tel].value = "0301234567"
* contact.telecom[kim].system = #email
* contact.telecom[kim].value = "arbeitsplatz-1@test-pflegeheim.kim.telematik"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Musterstr. 2"
* address[Strassenanschrift].line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[Hausnummer].valueString = "2"
* address[Strassenanschrift].line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[Strasse].valueString = "Musterstr."
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10623"

Instance: Example-Pharmacy-Organization
InstanceOf: ERPServiceRequestOrganization
Usage: #inline
* name = "Test Apotheke"
* type.coding[organization-type] = $CSIHEPatientBezogenenGesundheitsversorgung#APO "Apotheke"
* contact.telecom[tel].system = #phone
* contact.telecom[tel].value = "0301234567"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Musterstr. 2"
* address[Strassenanschrift].line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[Hausnummer].valueString = "2"
* address[Strassenanschrift].line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[Strasse].valueString = "Musterstr."
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10623"

Instance: Example-Practitioner-Organization
InstanceOf: ERPServiceRequestOrganization
Usage: #inline
* name = "Test Arztpraxis"
* type.coding[organization-type] = $CSIHEPatientBezogenenGesundheitsversorgung#PRA "Arztpraxis"
* contact.telecom[tel].system = #phone
* contact.telecom[tel].value = "0307654321"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Musterarztstr. 3"
* address[Strassenanschrift].line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[Hausnummer].valueString = "3"
* address[Strassenanschrift].line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[Strasse].valueString = "Musterarztstr."
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10623"