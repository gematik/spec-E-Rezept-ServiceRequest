Extension: AlternativeDeliveryAddressEX
Id: alternative-delivery-address-ex
Title: "Alternative Lieferadresse"
Description: "Diese Extension enthält eine alternative Lieferadresse nach deutschem Basisprofil für den Fall, dass die Belieferung einer Verordnung an eine alternative Adresse versendet werden soll."
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest, SupplyDelivery
* insert Meta (alternative-delivery-address-ex)
* value[x] only AddressDeBasis
* value[x] 1..1 MS
