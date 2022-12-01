Profile: GEM_PR_ERP_MEDREQ_MessageHeaderMedicationRequest
Parent: MessageHeader
Id: gem-pr-erp-medreq-message-header-medication-request
Title: "GEM PR ERP MEDREQ Message Header Medication Request"
Description: "Header for Messages concerning Medication Request"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_MessageHeaderMedicationRequest)


* event[x] only Coding
* event[x] from RequestingOrganizationVS

* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1..1
* source.endpoint 1..1
* source.endpoint ^short = "Source endpoint URI of sender. E.g. https://pvs.de/KIM"