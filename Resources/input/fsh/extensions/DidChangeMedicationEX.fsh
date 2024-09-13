Extension: ChangedMedicationEX
Id: changed-medication-ex
Title: "Changed Medication (EX)"
Description: "This extension is used to specify if the medication has been changed by the prescriber"
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, Medication
* insert Meta (changed-medication-ex)
* value[x] only boolean
* value[x] 1..1 MS