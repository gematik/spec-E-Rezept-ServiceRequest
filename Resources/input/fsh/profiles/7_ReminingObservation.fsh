Profile: ERPServiceRequestRemainingMedication
Parent: Observation
Id: erp-service-request-remaining-medication
Title: "ERP Service Request Remaining Medication"
Description: "This observation describes how long or how much of a medication is left"
* insert Meta (erp-service-request-remaining-medication)

* status = #final (exactly)

* code 1..1 MS
* code from MedicationObservationVS
* code.coding.code = #range-of-medication (exactly)
  * ^short = "Identifies this observation as an indication of the remaining range of a medication"

* subject 1..1 MS
* subject only Reference(Patient)
  * ^short = "Reference of the patient receiving the medication"

* value[x] 1..1 MS
* value[x] only Quantity or dateTime
  * ^short = "Indication of the remaining range in quantity or date on which the medication expires"

Instance: Medication-Runs-Out-Example-dateTime
InstanceOf: ERPServiceRequestRemainingMedication
Usage: #example
Title: "Medication-Runs-Out-Example-dateTime"
Description: "Simple example to show that Medication will last until dateTime"
* subject = Reference(Example-Patient)
* code = MedicationObservationCS#range-of-medication
* valueDateTime = "2023-01-31"

Instance: Medication-Runs-Out-Example-Quantity
InstanceOf: ERPServiceRequestRemainingMedication
Usage: #example
Title: "Medication-Runs-Out-Example-Quantity"
Description: "Simple example to show how many pieces of medication are left"
* subject = Reference(Example-Patient)
* code = MedicationObservationCS#range-of-medication
* valueQuantity
  * value = 7
  * unit = "stk"
