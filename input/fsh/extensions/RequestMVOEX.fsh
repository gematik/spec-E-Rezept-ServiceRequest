Extension: RequestMVOEX
Id: request-mvo-ex
Title: "Mehrfachverordnung angefragt"
Description: "Diese Extension enthält einen Wahrheitswert darüber, ob der Anfragende die Ausstellung einer Mehrfachverordnung (MVO) wünscht. Das empfangende System sollte den Nutzer entsprechend darauf hinweisen und ggf. die Verordnung vorbereiten."
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, SupplyDelivery
* insert Meta (request-mvo-ex)
* . ^isModifier = true
* . ^isModifierReason = "This determines if the prescription is to be issued as a normal prescription or as a multiple prescription order (MVO)."
* value[x] only boolean
* value[x] 1..1 MS