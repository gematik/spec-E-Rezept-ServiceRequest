// Originally defined on lines 1 - 20
Profile: GEM_PR_ERP_MEDREQ_MessageHeader
Parent: MessageHeader
Id: GEM-PR-ERP-MEDREQ-MessageHeader
Title: "GEM PR ERP MEDREQ MessageHeader"
Description: "Header for Messages Bundles used for Medication Request"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-MessageHeader"
* ^version = "1.0"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-MessageHeader|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0
* event[x] only Coding
* event[x] from MessageEventTypeVS (required)
* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization or GEM_PR_ERP_MEDREQ_Organization)
* sender.reference 1..1
* extension contains
    VorgangsIdEX named VorgangsID 0.. and
    PatientIdEX named PatientID 0..
* extension[VorgangsID] 1..1
* extension[PatientID] 1..1
* extension[VorgangsID] 1..1
* extension[VorgangsID] MS
* extension[PatientID] 1..1
* extension[PatientID] MS

// Originally defined on lines 22 - 42
Instance: KBV_PR_FOR_OrganizationExample
InstanceOf: KBV_PR_FOR_Organization
Title: "KBV PR FOR OrganizationExample"
Usage: #inline
* id = "KBV-PR-FOR-OrganizationExample"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization|1.1.0"
* identifier[Betriebsstaettennummer].type = http://terminology.hl7.org/CodeSystem/v2-0203#BSNR
* identifier[Betriebsstaettennummer].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[Betriebsstaettennummer].value = "012345678"
* name = "Praxis Um die Ecke"
* telecom[telefon].system = #phone
* telecom[telefon].value = "0123456789"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Eisenbahnstraße 10"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[0][Hausnummer].valueString = "10"
* address[Strassenanschrift].line.extension[0][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[0][Strasse].valueString = "Eisenbahnstraße"
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10249"
* address[Strassenanschrift].country = "D"

// Originally defined on lines 44 - 55
Instance: MessageHeaderExampleRequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MessageHeader
Title: "MessageHeaderExampleRequestingOrganisation"
Description: "Example of a RequestHeader triggered by a RequestingOrganisation"
Usage: #inline
* id = "MessageHeaderExampleRequestingOrganisation"
* extension[0][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* extension[0][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* sender.reference = "Organization/RequestingOrganizationExample"
* source.endpoint = "https://pflegeheim.de/KIM"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#RequestingMessage "Nachricht zur Rezeptanforderung"

// Originally defined on lines 57 - 68
Instance: MessageHeaderExampleDispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MessageHeader
Title: "MessageHeaderExampleDispensingOrganisation"
Description: "Example of a RequestHeader triggered by a DispensingOrganisation"
Usage: #inline
* id = "MessageHeaderExampleDispensingOrganisation"
* extension[0][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* sender.reference = "Organization/DispensingOrganizationExample"
* extension[0][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* source.endpoint = "https://apotheke.de/KIM"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#RequestingMessage "Nachricht zur Rezeptanforderung"

