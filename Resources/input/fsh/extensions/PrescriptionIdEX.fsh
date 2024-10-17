Extension: PrescriptionIdEx
Id: prescription-id-ex
Description: "Extension for Prescription ID"
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
* value[x] 1..1 MS
* value[x] only Identifier
* valueIdentifier only $GEM_ERP_PR_PrescriptionId