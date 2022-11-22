Extension: PrescriptionDeliveryTypeEX
Id: PrescriptionDeliveryTypeEX
Description: "Defines types of types describing how prescription will be delivered."
* value[x] only Coding
* value[x] from PrescriptionDeliveryTypeVS (required)
* value[x] ^binding.description = "Zustelltyp"
* value[x].system 1..
* value[x].code 1..