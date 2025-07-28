Extension: RedeemByPatientEX
Id: redeem-by-patient-ex
Title: "Redeem By Patient (EX)"
Description: "Extension to indicate if the prescription should be redeemed by the patient."
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, SupplyDelivery
* insert Meta (redeem-by-patient-ex)
* . ^isModifier = true
* . ^isModifierReason = "This determines the Flow Type of the prescription to be set to 160/200 so that the patient can redeem the prescription himself. If not set the Flow Type is set to 169/209."
* value[x] only boolean
* value[x] 1..1 MS