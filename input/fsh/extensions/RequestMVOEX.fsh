Extension: RequestMVOEX
Id: request-mvo-ex
Title: "Request MVO (EX)"
Description: "Extension to indicate if the prescription should be issued as a multiple prescription order (MVO)."
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
* insert Meta (request-mvo-ex)
* . ^isModifier = true
* . ^isModifierReason = "This determines if the prescription is to be issued as a normal prescription or as a multiple prescription order (MVO)."
* value[x] only boolean
* value[x] 1..1 MS