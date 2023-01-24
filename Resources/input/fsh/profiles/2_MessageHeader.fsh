Profile: GEM_PR_ERP_MEDREQ_MessageHeader
Parent: MessageHeader
Id: GEM-PR-ERP-MEDREQ-MessageHeader
Title: "GEM PR ERP MEDREQ MessageHeader"
Description: "Header for Messages Bundles used for Medication Request"
* insert Meta (GEM-PR-ERP-MEDREQ-MessageHeader)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-MessageHeader)

* event[x] only Coding
* event[x] from MessageEventTypeVS

* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization or GEM_PR_ERP_MEDREQ_RequestingOrganization or GEM_PR_ERP_MEDREQ_DispensingOrganization or GEM_PR_ERP_MEDREQ_PrescribingOrganization)
* sender.reference 1..1

* extension contains
    VorgangsIdEX named VorgangsID 1..1 and
    PatientIdEX named PatientID 1..1
* extension[VorgangsID] 1..1 MS
* extension[PatientID] 1..1 MS

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
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "10"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Eisenbahnstraße"
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10249"
* address[Strassenanschrift].country = "D"

Instance: MessageHeaderExampleRequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MessageHeader
Usage: #inline
Title: "MessageHeaderExampleRequestingOrganisation"
Description: "Example of a RequestHeader triggered by a RequestingOrganisation"
* id = "MessageHeaderExampleRequestingOrganisation"
* MetaInstance(GEM_PR_ERP_MEDREQ_MessageHeader)
* extension[+][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* extension[+][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* sender.reference = "Organization/RequestingOrganizationExample"
* source.endpoint = "https://pflegeheim.de/KIM"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#RequestingMessage "Nachricht zur Rezeptanforderung"
//* focus[+].reference = "MedicationRequest/MedicationRequestExampleSelfPickup"
//* focus[+].reference = "Patient/KBV-PR-FOR-PatientExample"

Instance: MessageHeaderExampleDispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MessageHeader
Usage: #inline
Title: "MessageHeaderExampleDispensingOrganisation"
Description: "Example of a RequestHeader triggered by a DispensingOrganisation"
* id = "MessageHeaderExampleDispensingOrganisation"
* MetaInstance(GEM_PR_ERP_MEDREQ_MessageHeader)
* extension[+][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* sender.reference = "Organization/DispensingOrganizationExample"
* extension[+][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* source.endpoint = "https://apotheke.de/KIM"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#RequestingMessage "Nachricht zur Rezeptanforderung"
* sender.reference = "DispensingOrganization/DispensingOrganizationExample"
//* focus[+].reference = "Prescription/KBV_PR_ERP_PrescriptionExample"
//* focus[+].reference = "Patient/KBV_PR_FOR_PatientExample"
//* focus[+].reference = "RequestingOrganizationExample/RequestingOrganizationExample"
//* focus[+].reference = "DispenseInformation/GEM_ERP_PR_MedicationDispenseExample"


