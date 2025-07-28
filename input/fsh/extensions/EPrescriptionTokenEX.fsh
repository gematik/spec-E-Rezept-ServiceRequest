Extension: EPrescriptionTokenEX
Id: eprescription-token-ex
Title: "E-Prescription Token Extension"
Description: "This extension is used to specify an e-prescription token"
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, SupplyDelivery
* insert Meta (eprescription-token-ex)
* value[x] 1..1 MS
* value[x] only ERPServiceRequestEPrescriptionToken