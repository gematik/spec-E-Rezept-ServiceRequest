Profile: GEM_PR_ERP_MEDREQ_RemainingMedication_Observation
Parent: Observation
Id: gem-pr-erp-medreq-remaining-medication-observation
Title: "GEM PR ERP MEDREQ Remaining Medication Observation "
Description: "Describes how long the remaining medication will last"
* status = #final (exactly)

* code from GEM_VS_MEDREQ_MedicationRange
* code.coding.code = #range-of-medication

* subject 1..1
* subject only Reference(Patient)

* value[x] 1..1 MS
* value[x] only Quantity or dateTime

Instance: Medication-Runs-Out-Example-dateTime
InstanceOf: GEM_PR_ERP_MEDREQ_RemainingMedication_Observation
Usage: #example
Title: "Medication-Runs-Out-Example-dateTime"
Description: "Simple example to show that Medication will last until dateTime"
* subject.reference = "Example-Patient"
* code.coding.code = #range-of-medication
* valueDateTime = "2023-01-31"

Instance: Medication-Runs-Out-Example-Quantity
InstanceOf: GEM_PR_ERP_MEDREQ_RemainingMedication_Observation
Usage: #example
Title: "Medication-Runs-Out-Example-Quantity"
Description: "Simple example to show how many pieces of medication are left"
* subject.reference = "Example-Patient"
* code.coding.code = #range-of-medication
* valueQuantity
  * value = 7
  * unit = "stk"
