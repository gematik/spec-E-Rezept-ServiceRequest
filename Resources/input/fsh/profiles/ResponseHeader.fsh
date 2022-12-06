Profile: GEM_PR_ERP_MEDREQ_ResponseHeader
Parent: MessageHeader
Id: gem-pr-erp-medreq-response-header
Title: "GEM PR ERP MEDREQ Response Header"
Description: "Header for Messages Bundles used for Responses to Medication Requests"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_ResponseHeader)

* event[x] only Coding
* event[x] from MessageEventTypeVS

* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1..1

* extension contains
    PrescriptionIdEX named PrescriptionID 1..1 and
    AccessCodeEX named AccessCode 1..1



Instance: ResponseHeaderExample
InstanceOf: GEM_PR_ERP_MEDREQ_ResponseHeader
Usage: #example
Title: "ResponseHeaderExample"
Description: "Example of a response header"
* id = "00dd7c71-ef9c-4d68-ab8a-e4e160b9806c"
* MetaInstance(GEM_PR_ERP_MEDREQ_ResponseHeader)
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#RespondingMessage "Antwort auf eine Rezeptanforderung"
* sender.reference = "Organisation/f67dcc87-f877-49da-a249-aac4d1b15418"
* source.endpoint = "https://praxis_um_die_ecke.de/KIM"
* extension[+][PrescriptionID].valueString  = "160.000.033.491.280.78"
* extension[+][AccessCode].valueString = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"