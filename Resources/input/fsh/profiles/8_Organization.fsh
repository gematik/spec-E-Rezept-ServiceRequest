Profile: OrganizationWithKIMAdress
Parent: $KBV_PR_Base_Organization
Id: organization-with-kim-adress
Title: "Organisation mit KIM-Addresse"
Description: "Organisation die genutzt werden kann, um eine KIM-Addresse mit anzugeben"
* insert Meta (organization-with-kim-adress)

* identifier MS
* identifier contains KIMAdresse 1..1 MS and TIMAdresse 0..1
* identifier[KIMAdresse] only $GEM_PR_KIM_AdressIdentifier
* identifier[KIMAdresse].type 1..1
* identifier[KIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0 (exactly)

* identifier[TIMAdresse] only $GEM_PR_TIM_AdressIdentifier
* identifier[TIMAdresse].type 1..1
* identifier[TIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#tim

Instance: Example-HealthCareService-Organization
InstanceOf: OrganizationWithKIMAdress
Usage: #inline
* identifier[Telematik-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "1-031234567"
* identifier[KIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0
* identifier[KIMAdresse] = Pflegeheim-Immergrün-Identifier
* identifier[Betriebsstaettennummer].type = http://terminology.hl7.org/CodeSystem/v2-0203#BSNR
* identifier[Betriebsstaettennummer].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[Betriebsstaettennummer].value = "031234567"
* name = "Pflegeheim Immergrün"
* telecom[0].system = #phone
* telecom[=].value = "0301234567"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Musterstr. 2"
* address[Strassenanschrift].line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[Hausnummer].valueString = "2"
* address[Strassenanschrift].line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[Strasse].valueString = "Musterstr."
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10623"

Instance: Example-Pharmacy-Organization
InstanceOf: OrganizationWithKIMAdress
Usage: #inline
* identifier[Telematik-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "1-57634852"
* identifier[KIMAdresse].type = https://gematik.de/fhir/directory/CodeSystem/EndpointDirectoryConnectionType#kim-2.0
* identifier[KIMAdresse] = Test-Apotheke-Identifier
* identifier[Betriebsstaettennummer].type = http://terminology.hl7.org/CodeSystem/v2-0203#BSNR
* identifier[Betriebsstaettennummer].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[Betriebsstaettennummer].value = "581463872"
* name = "Test Apotheke"
* telecom[0].system = #phone
* telecom[=].value = "0301234567"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Musterstr. 2"
* address[Strassenanschrift].line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[Hausnummer].valueString = "2"
* address[Strassenanschrift].line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[Strasse].valueString = "Musterstr."
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10623"