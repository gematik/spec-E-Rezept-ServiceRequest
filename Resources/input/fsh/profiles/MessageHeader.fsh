Profile: GEM_PR_ERP_MEDREQ_MessageHeader
Parent: MessageHeader
Id: gem-pr-erp-medreq-message-header
Title: "GEM PR ERP MEDREQ RequestHeader"
Description: "Header for Messages Bundles used for Medication Request"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_MessageHeader)

* event[x] only Coding
* event[x] from MessageEventTypeVS

* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization or GEM_PR_ERP_MEDREQ_Organization)
* sender.reference 1..1


Instance: KBV_PR_FOR_OrganizationExample
InstanceOf: KBV_PR_FOR_Organization
Title: "KBV PR FOR OrganizationExample"
Usage: #inline
* id = "f67dcc87-f877-49da-a249-aac4d1b15418"
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
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "10"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Eisenbahnstraße"
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10249"
* address[Strassenanschrift].country = "D"

/*
Instance: RequestHeaderExamplePraxis
InstanceOf: GEM_PR_ERP_MEDREQ_MessageHeader
Usage: #example
Title: "RequestHeaderExample"
Description: "Example of a RequestHeader"
* id = "542ad200-7579-486d-89fb-0d2cef76e1f3"
* MetaInstance(GEM_PR_ERP_MEDREQ_MessageHeader)
* sender.reference = "Organisation/f67dcc87-f877-49da-a249-aac4d1b15418"
//* sender.reference = Reference(KBV_PR_FOR_Organization/f67dcc87-f877-49da-a249-aac4d1b15418)
* source.endpoint = "https://praxis_um_die_ecke.de/KIM"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#RequestingMessage "Nachricht zur Rezeptanforderung"
*/

Instance: RequestHeaderExampleRequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MessageHeader
Usage: #inline
Title: "RequestHeaderExampleRequestingOrganisation"
Description: "Example of a RequestHeader triggered by a RequestingOrganisation"
* id = "3a0fa348-fc66-4f29-b842-cbad1523c846"
* MetaInstance(GEM_PR_ERP_MEDREQ_MessageHeader)
* sender.reference = "Organization/a8efd0b3-58c3-48f7-89f5-67f86dd298e8"
* source.endpoint = "https://pflegeheim.de/KIM"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#RequestingMessage "Nachricht zur Rezeptanforderung"

Instance: RequestHeaderExampleDispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MessageHeader
Usage: #inline
Title: "RequestHeaderExampleDispensingOrganisation"
Description: "Example of a RequestHeader triggered by a DispensingOrganisation"
* id = "b2e0e631-42fd-4d8a-a7b2-a2f54fe70bf7"
* MetaInstance(GEM_PR_ERP_MEDREQ_MessageHeader)
* sender.reference = "Organization/f89adcee-7fe3-4b06-bc5f-e17b592a3a5f"
* source.endpoint = "https://apotheke.de/KIM"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#RequestingMessage "Nachricht zur Rezeptanforderung"


