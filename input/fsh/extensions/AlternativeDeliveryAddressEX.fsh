Extension: AlternativeDeliveryAddressEX
Id: alternative-delivery-address-ex
Title: "Alternative Delivery Address (EX)"
Description: "This extension is used to specify an alternative delivery Address"
Context: ServiceRequest, MedicationRequest, DeviceRequest, Task, SupplyRequest
* insert Meta (alternative-delivery-address-ex)
* value[x] only AddressDeBasis
* value[x] 1..1 MS
