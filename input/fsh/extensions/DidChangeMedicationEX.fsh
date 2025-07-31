Extension: ChangedMedicationEX
Id: changed-medication-ex
Title: "Arzneimittel geändert"
Description: "Diese Extension enthält einen Wahrheitswert darüber, ob der Verordnende ein anderes Arzneimittel verordnet hat als angefragt wurde. Bei Änderungen durch den Arzt ist das Feld 'valueBoolean' mit 'true' zu setzen."
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, Medication, SupplyDelivery
* insert Meta (changed-medication-ex)
* . ^isModifier = true
* . ^isModifierReason = "If the medication has been changed, the receiving system must display that the medication has been changed."
* value[x] only boolean
* value[x] 1..1 MS