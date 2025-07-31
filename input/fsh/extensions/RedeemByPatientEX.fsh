Extension: RedeemByPatientEX
Id: redeem-by-patient-ex
Title: "Einlösung durch Patient"
Description: "Diese Extension enthält einen Wahrheitswert darüber, ob die Verordnung vom Patienten selbst einzulösen ist. Dies hat Auswirkungen auf den Flowtype der Verordnung und darüber, ob ein E-Rezept Token an den Anfragenden zurückgegeben wird."
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, SupplyDelivery
* insert Meta (redeem-by-patient-ex)
* . ^isModifier = true
* . ^isModifierReason = "This determines the Flow Type of the prescription to be set to 160/200 so that the patient can redeem the prescription himself. If not set the Flow Type is set to 169/209."
* value[x] only boolean
* value[x] 1..1 MS