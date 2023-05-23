Profile: ERPServiceRequestRemainingMedication
Parent: Observation
Id: erp-service-request-remaining-medication
Title: "ERP Service Request Remaining Medication"
Description: "Diese Observation beschreibt wie lange oder wie viel einer Medikation noch vorhanden ist"
* insert Meta (erp-service-request-remaining-medication)

* status = #final (exactly)

* code 1..1 MS
* code from MedicationObservationVS
* code.coding.code = #range-of-medication (exactly)
  * ^short = "Identifiziert diese Observation als eine Angabe der Restreichweite einer Medikation"

* subject 1..1 MS
* subject only Reference(Patient)
  * ^short = "Referenz des Patienten, der die Medikation erhält"

* value[x] 1..1 MS
* value[x] only Quantity or dateTime
  * ^short = "Angabe der Restreichweite in Menge oder Datum, an dem die Medikation ausläuft"

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
