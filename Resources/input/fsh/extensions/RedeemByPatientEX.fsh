Extension: RedeemByPatientEX
Id: redeem-by-patient-ex
Title: "Redeem By Patient (EX)"
Description: "Extension to indicate if the prescription should be redeemed by the patient."
* ^context[0].type = #element
* ^context[=].expression = "ServiceRequest"
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* ^context[+].type = #element
* ^context[=].expression = "DeviceRequest"
* ^context[+].type = #element
* ^context[=].expression = "Task"
* ^context[+].type = #element
* ^context[=].expression = "SupplyRequest"
* ^context[+].type = #element
* ^context[=].expression = "ServiceDelivery"
* ^context[+].type = #element
* ^context[=].expression = "Medication"
* insert Meta (prescription-id-ex)
* value[x] only boolean
* value[x] 1..1 MS