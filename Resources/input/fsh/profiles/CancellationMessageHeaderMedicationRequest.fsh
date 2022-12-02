Profile: GEM_PR_ERP_MEDREQ_CancellationMessageHeaderMedicationRequest
Parent: GEM_PR_ERP_MEDREQ_MessageHeaderMedicationRequest
Id: gem-pr-erp-medreq-cancellation-message-header-medication-request
Title: "GEM PR ERP MEDREQ Cancellation Message Header Medication Request"
Description: "Header for Cancellation Messages concerning Medication Request"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_MessageHeaderMedicationRequest)

* extension contains
    FreeTextEX named FreeText 1..1
* extension[FreeText].value[x] 1..1