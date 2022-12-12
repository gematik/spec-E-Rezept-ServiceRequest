Extension: CancellationReasonTypeEX
Id: CancellationReasonTypeEX
Description: "Definition of reasons why a prescriptionRequest was cancelled."
* insert Meta
* value[x] only Coding
* value[x] from CancellationReasonTypeVS (required)
* value[x] ^binding.description = "Grund für die Stornierung"
* value[x].system 1..
* value[x].code 1..