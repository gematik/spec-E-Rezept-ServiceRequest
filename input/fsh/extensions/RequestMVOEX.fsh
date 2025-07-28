Extension: RequestMVOEX
Id: request-mvo-ex
Title: "Request MVO (EX)"
Description: "Extension to indicate if the prescription should be issued as a multiple prescription order (MVO)."
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, SupplyDelivery
* insert Meta (request-mvo-ex)
* . ^isModifier = true
* . ^isModifierReason = "This determines if the prescription is to be issued as a normal prescription or as a multiple prescription order (MVO)."
* value[x] only boolean
* value[x] 1..1 MS