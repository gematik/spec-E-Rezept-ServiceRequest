// Originally defined on lines 2 - 53
Profile: GEM_PR_ERP_MEDREQ_Organization
Parent: Organization
Id: GEM-PR-ERP-MEDREQ-Organization
Title: "GEM PR ERP MEDREQ Organization"
Description: "Organization used in the context of a medicationRequest"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-Organization"
* ^version = "1.0"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-Organization|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0
* identifier ..1
* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #closed
* identifier contains Telematik-ID 0..
* identifier[Telematik-ID] 0..1
* identifier[Telematik-ID] only http://fhir.de/StructureDefinition/identifier-telematik-id
* type from RequestingOrganizationTypeVS (required)
* name 1..1
* address 1..1
* address only http://fhir.de/StructureDefinition/address-de-basis
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
* address.line.extension[Strasse].extension 0..0
* address.line.extension[Hausnummer].extension 0..0
* address.line.extension[Adresszusatz].extension 0..0

// Originally defined on lines 56 - 75
Instance: PrescribingOrganizationExample
InstanceOf: GEM_PR_ERP_MEDREQ_Organization
Title: "Prescribing Organization Example"
Description: "Example of a Organisation responsible for prescribing medication"
Usage: #inline
* id = "PrescribingOrganizationExample"
* identifier[0][Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[0][Telematik-ID].value = "10-42.423.00045678"
* name = "Gemeinschaftspraxis Waldorf und Statler"
* telecom[0].system = #url
* telecom[0].value = "https://xwaldorfstatlerx.de/KIM"
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Theatergasse"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "1"
* address[0].line[0].extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[0].line[0].extension[Adresszusatz].valueString = "Gemeinschaftspraxis Allgemeinmedizin"
* address[0].city = "Berlin"
* address[0].postalCode = "10247"

// Originally defined on lines 77 - 96
Instance: RequestingOrganizationExample
InstanceOf: GEM_PR_ERP_MEDREQ_Organization
Title: "Requesting Organization Example"
Description: "Example of a Organisation responsible for the request of the medication"
Usage: #inline
* id = "RequestingOrganizationExample"
* identifier[0][Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[0][Telematik-ID].value = "10-67.245.00001234"
* name = "Pflegeheim am Platz der Sonne"
* telecom[0].system = #url
* telecom[0].value = "https://pflegeheim.de/KIM"
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Meinekestraße"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "61"
* address[0].line[0].extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[0].line[0].extension[Adresszusatz].valueString = "Geriatrie"
* address[0].city = "Berlin"
* address[0].postalCode = "10247"

// Originally defined on lines 98 - 117
Instance: DispensingOrganizationExample
InstanceOf: GEM_PR_ERP_MEDREQ_Organization
Title: "DispensingOrganizationExample"
Description: "Example of a Organisation responsible for the request of the medication"
Usage: #inline
* id = "DispensingOrganizationExample"
* identifier[0][Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[0][Telematik-ID].value = "3-abc-1234567890"
* name = "Apotheke am Platz der Sonne"
* telecom[0].system = #url
* telecom[0].value = "https://apotheke.de/KIM"
* address[0].line[0].extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[0].line[0].extension[Strasse].valueString = "Meinekestraße"
* address[0].line[0].extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[0].line[0].extension[Hausnummer].valueString = "63"
* address[0].line[0].extension[Adresszusatz].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* address[0].line[0].extension[Adresszusatz].valueString = "Apotheke am Pflegeheim"
* address[0].city = "Berlin"
* address[0].postalCode = "10247"

