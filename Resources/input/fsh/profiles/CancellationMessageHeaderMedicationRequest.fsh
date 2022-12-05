Profile: GEM_PR_ERP_MEDREQ_CancellationMessageHeaderMedicationRequest
Parent: MessageHeader
Id: gem-pr-erp-medreq-cancellation-message-header-medication-request
Title: "GEM PR ERP MEDREQ Cancellation Message Header Medication Request"
Description: "Header for Cancellation Messages concerning Medication Request"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_CancellationMessageHeaderMedicationRequest)

* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1..1

* extension contains
    FreeTextEX named FreeText 1.. and
    IdentifierEX named IdentifierForCancelation 1..
* extension[FreeText].value[x] 1..
* extension[FreeText].value[x] only string
* extension[FreeText] ^short = "Begründung der Stornierung"
* extension[IdentifierForCancelation].value[x] 1..
* extension[IdentifierForCancelation].value[x] only uuid
* extension[IdentifierForCancelation] ^short = "UUID des zu stornierungen MedicationRequestBundles"