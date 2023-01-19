// Originally defined on lines 1 - 9
Extension: PrescriptionDeliveryTypeEX
Parent: Extension
Id: PrescriptionDeliveryTypeEX
Description: "Defines types of types describing how prescription will be delivered."
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeEX"
* ^version = "1.0"
* value[x] only Coding
* value[x] from PrescriptionDeliveryTypeVS (required)
* value[x] ^binding.description = "Zustelltyp"
* value[x].system 1..
* value[x].code 1..
* extension 0..0

