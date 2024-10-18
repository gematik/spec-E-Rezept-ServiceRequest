Extension: EPrescriptionTokenEX
Id: eprescription-token-ex
Title: "E-Prescription Token Extension"
Description: "This extension is used to specify an e-prescription token"
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
* insert Meta (eprescription-token-ex)
* value[x] 1..1 MS
* value[x] only ERPServiceRequestEPrescriptionToken