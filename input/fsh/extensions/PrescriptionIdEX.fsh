Extension: PrescriptionIdEx
Id: prescription-id-ex
Title: "Rezept-ID"
Description: "Diese Extension enthält eine Rezept-ID eines E-Rezeptes mit der Form 'aaa.bbb.bbb.bbb.bbb.cc', wobei 'aaa' der Flowtype des E-Rezeptes, 'cc' die Prüfnummer und 'bbb.bbb.bbb.bbb' die fortlaufende Rezeptnummer abbildet."
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, SupplyDelivery, Medication
* insert Meta (prescription-id-ex)
* value[x] 1..1 MS
* value[x] only Identifier
* valueIdentifier only EPrescriptionId