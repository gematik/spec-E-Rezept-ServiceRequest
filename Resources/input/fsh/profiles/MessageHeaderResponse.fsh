Profile: GEM_PR_ERP_MEDREQ_MessageHeaderResponse
Parent: MessageHeader
Id: gem-pr-erp-medreq-message-header-response
Title: "GEM PR ERP MEDREQ Message Header Response"
Description: "Header for Messages Bundles used for Responses to Medication Requests"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_MessageHeaderResponse)

* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1..1

* extension contains
    PrescriptionIdEX named PrescriptionID 1..1 and
    AccessCodeEX named AccessCode 1..1
