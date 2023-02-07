Profile: GEM_ERP_MEDREP_Organization
Parent: $KBV_PR_Base_Organization
Id: gem-erp-medrep-organization
Title: "GEM ERP MEDREP Organization"
Description: "Organization in MEDREQ Context"
* insert Meta (gem-erp-medrep-organization)
* insert MetaProfile (gem-erp-medrep-organization)

* identifier contains KIMAdresse 1..1 MS and TIMAdresse 0..1
* identifier[KIMAdresse] only GEM_PR_MEDREQ_KIMAdresse
* identifier[TIMAdresse] only GEM_PR_MEDREQ_TIMAdresse