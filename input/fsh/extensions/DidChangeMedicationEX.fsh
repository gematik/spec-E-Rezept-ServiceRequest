Extension: ChangedMedicationEX
Id: changed-medication-ex
Title: "Changed Medication (EX)"
Description: "This extension is used to specify if the medication has been changed by the prescriber"
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, Medication, SupplyDelivery
* insert Meta (changed-medication-ex)
* . ^isModifier = true
* . ^isModifierReason = "If the medication has been changed, the receiving system must display that the medication has been changed."
* value[x] only boolean
* value[x] 1..1 MS