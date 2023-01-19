// Originally defined on lines 1 - 9
Extension: CancellationReasonTypeEX
Parent: Extension
Id: CancellationReasonTypeEX
Description: "Definition of reasons why a prescriptionRequest was cancelled."
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX"
* ^version = "1.0"
* value[x] only Coding
* value[x] from CancellationReasonTypeVS (required)
* value[x] ^binding.description = "Grund für die Stornierung"
* value[x].system 1..
* value[x].code 1..
* extension 0..0

