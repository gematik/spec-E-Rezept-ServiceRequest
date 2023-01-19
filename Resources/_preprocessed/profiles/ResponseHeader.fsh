// Originally defined on lines 1 - 24
Profile: GEM_PR_ERP_MEDREQ_ResponseHeader
Parent: MessageHeader
Id: GEM-PR-ERP-MEDREQ-ResponseHeader
Title: "GEM PR ERP MEDREQ Response Header"
Description: "Header for Messages Bundles used for Responses to Medication Requests"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-ResponseHeader"
* ^version = "1.0"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-ResponseHeader|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0
* event[x] only Coding
* event[x] from MessageEventTypeVS (required)
* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1..1
* extension contains
    VorgangsIdEX named VorgangsID 0.. and
    PatientIdEX named PatientID 0.. and
    PrescriptionIdEX named PrescriptionID 0.. and
    AccessCodeEX named AccessCode 0..
* extension[VorgangsID] 1..1
* extension[PatientID] 1..1
* extension[PrescriptionID] 1..1
* extension[AccessCode] 1..1
* extension[VorgangsID] 1..1
* extension[VorgangsID] MS
* extension[PatientID] 1..1
* extension[PatientID] MS
* extension[PrescriptionID] 1..1
* extension[PrescriptionID] MS
* extension[AccessCode] 1..1
* extension[AccessCode] MS

// Originally defined on lines 26 - 39
Instance: ResponseHeaderExample
InstanceOf: GEM_PR_ERP_MEDREQ_ResponseHeader
Title: "ResponseHeaderExample"
Description: "Example of a response header"
Usage: #inline
* id = "00dd7c71-ef9c-4d68-ab8a-e4e160b9806c"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#RespondingMessage "Antwort auf eine Rezeptanforderung"
* sender.reference = "Organisation/KBV-PR-FOR-OrganizationExample"
* source.endpoint = "https://praxis_um_die_ecke.de/KIM"
* extension[0][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* extension[0][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* extension[0][PrescriptionID].valueIdentifier.value = "160.000.033.491.280.78"
* extension[0][AccessCode].valueIdentifier.value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"

