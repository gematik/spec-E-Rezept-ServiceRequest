Profile: ObservationRemainingMedication
Parent: Observation
Id: observation-remaining-medication
Title: "Verbleibende Medikamentenreichweite"
Description: "Diese Observation beschreibt wie lange oder wie viel einer Medikation noch vorhanden ist"
* insert Meta (observation-remaining-medication)

* status = #final (exactly)

* code 1..1 MS
* code from MedicationObservationVS
* code.coding.code = #range-of-medication

* subject 1..1 MS
* subject only Reference(Patient)

* value[x] 1..1 MS
* value[x] only Quantity or dateTime

Instance: Medication-Runs-Out-Example-dateTime
InstanceOf: ObservationRemainingMedication
Usage: #inline
Title: "Medication-Runs-Out-Example-dateTime"
Description: "Simple example to show that Medication will last until dateTime"
* subject = Reference(Example-Patient)
* code = GEM_CS_MEDREQ_MedicationObservation#range-of-medication
* valueDateTime = "2023-01-31"

Instance: Medication-Runs-Out-Example-Quantity
InstanceOf: ObservationRemainingMedication
Usage: #inline
Title: "Medication-Runs-Out-Example-Quantity"
Description: "Simple example to show how many pieces of medication are left"
* subject = Reference(Example-Patient)
* code = GEM_CS_MEDREQ_MedicationObservation#range-of-medication
* valueQuantity
  * value = 7
  * unit = "stk"
