Extension: EPrescriptionTokenEX
Id: eprescription-token-ex
Title: "E-Rezept Token"
Description: "Diese Extension trägt den E-Rezept Token, der für die Einlösung einer Verordnung gegenüber dem E-Rezept-Fachdienst benötigt wird."
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, SupplyDelivery
* insert Meta (eprescription-token-ex)
* value[x] 1..1 MS
* value[x] only ERPServiceRequestEPrescriptionToken