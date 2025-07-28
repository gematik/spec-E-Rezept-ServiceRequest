Extension: PrescriptionIdEx
Id: prescription-id-ex
Description: "Extension for Prescription ID"
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, SupplyDelivery, Medication
* insert Meta (prescription-id-ex)
* value[x] 1..1 MS
* value[x] only Identifier
* valueIdentifier only EPrescriptionId