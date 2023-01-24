Profile: GEM_PR_ERP_MEDREQ_RemainingMedication_Observation
Parent: Observation
Id: gem-pr-erp-medreq-remaining-medication-observation
Title: "GEM PR ERP MEDREQ Remaining Medication Observation "
Description: "Describes how long the remaining medication will last"
* status = #final (exactly)
//TODO find code
* subject 1..1
* subject only Reference(Patient)

* value[x] 1..1 MS
* value[x] only Quantity or Range or time or dateTime