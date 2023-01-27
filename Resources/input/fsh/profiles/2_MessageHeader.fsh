// TODO Ableiten von KIM
Profile: GEM_PR_ERP_MEDREQ_MessageHeader
Parent: MessageHeader
Id: GEM-PR-ERP-MEDREQ-MessageHeader
Title: "GEM PR ERP MEDREQ MessageHeader"
Description: "Header for Messages Bundles used for Medication Request"
* insert Meta (GEM-PR-ERP-MEDREQ-MessageHeader)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-MessageHeader)

// falls nicht KIM noch event, sender und receiver spezifizieren

* focus MS
* focus only Reference(GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest or GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest)
