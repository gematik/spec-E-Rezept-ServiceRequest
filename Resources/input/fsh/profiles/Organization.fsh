
Alias: $address-de-basis = http://fhir.de/StructureDefinition/address-de-basis
Profile: GEM_PR_ERP_MEDREQ_Organization
Parent: Organization
Id: gem-pr-erp-medreq-organization
Title: "GEM PR ERP MEDREQ Organization"
Description: "Organization used in the context of a medicationRequest"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_Organization)
* identifier ..1 MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #closed
* identifier contains
    Telematik-ID 0..1
* type from RequestingOrganizationTypeVS
* name 1..1
* address 1..1
* address only $address-de-basis
* address.extension ..0
* address.extension ^slicing.discriminator.type = #value
* address.extension ^slicing.discriminator.path = "url"
* address.extension ^slicing.rules = #closed
* address.use ..0
* address.type 1..
* address.type = #physical (exactly)
* address.text ..0
* address.line 1..1
* address.line.extension ^slicing.discriminator.type = #value
* address.line.extension ^slicing.discriminator.path = "url"
* address.line.extension ^slicing.rules = #closed
* address.line.extension[Strasse] ^sliceName = "Strasse"
* address.line.extension[Strasse].value[x] ^maxLength = 46
* address.line.extension[Hausnummer] ^sliceName = "Hausnummer"
* address.line.extension[Hausnummer].value[x] ^maxLength = 9
* address.line.extension[Adresszusatz] ^sliceName = "Adresszusatz"
* address.line.extension[Adresszusatz] ^min = 0
* address.line.extension[Adresszusatz] ^mustSupport = true
* address.line.extension[Adresszusatz].value[x] ^maxLength = 40
* address.city 1..
* address.city ^short = "Ortsname"
* address.city ^definition = "Ortsname der anfordernden Organisation"
* address.city ^maxLength = 40
* address.state ..0
* address.postalCode 1..
* address.postalCode ^maxLength = 10
* address.period ..0
* telecom 1..
* telecom only ContactPoint
* telecom.system 1..
* telecom.system = #url
* telecom.value 1..
* telecom.value ^short = "Source endpoint URI of sender. E.g. https://pflegeinrichtung.de/KIM or https://apotheke.de/KIM "


Instance: RequestingOrganizationExample
InstanceOf: GEM_PR_ERP_MEDREQ_Organization
Usage: #example
Title: "Requesting Organization Example"
Description: "Example of a Organisation responsible for the request of the medication"
* id = "a8efd0b3-58c3-48f7-89f5-67f86dd298e8"
* MetaInstance(GEM_PR_ERP_MEDREQ_Organization)
* identifier[+][Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[=][Telematik-ID].value = "3-abc-1234567890"
* name = "Pflegeheim am Platz der Sonne"
* telecom[+].system = #url
* telecom[=].value = "https://pflegeheim.de/KIM"
* address[+].line[+].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[=].line[=].extension[Strasse].valueString = "Meinekestraße"
* address[=].line[=].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[=].line[=].extension[Hausnummer].valueString = "61"
* address[=].line[=].extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[=].line[=].extension[Adresszusatz].valueString = "Geriatrie"
* address[=].city = "Berlin"
* address[=].postalCode = "10247"

Instance:  DispensingOrganizationExample
InstanceOf: GEM_PR_ERP_MEDREQ_Organization
Usage: #example
Title: "Requesting Dispensing Example"
Description: "Example of a Organisation responsible for the request of the medication"
* id = "f89adcee-7fe3-4b06-bc5f-e17b592a3a5f"
* MetaInstance(GEM_PR_ERP_MEDREQ_Organization)
* identifier[+][Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[=][Telematik-ID].value = "3-abc-1234567890"
* name = "Apotheke am Platz der Sonne"
* telecom[+].system = #url
* telecom[=].value = "https://apotheke.de/KIM"
* address[+].line[+].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[=].line[=].extension[Strasse].valueString = "Meinekestraße"
* address[=].line[=].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[=].line[=].extension[Hausnummer].valueString = "63"
* address[=].line[=].extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[=].line[=].extension[Adresszusatz].valueString = "Apotheke am Pflegeheim"
* address[=].city = "Berlin"
* address[=].postalCode = "10247"
