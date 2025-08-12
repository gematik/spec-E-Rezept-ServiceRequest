Instance: INVALID-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
Title: "Invalide Medikationsanforderung"
Description: "Dieses Beispiel ist invalide und dient nur der Sicherstellung der Validierung."
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dosageInstruction.text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et eat"
* dispenseRequest.quantity
  * value = 1
  * unit = "Packung"

Instance: INVALID-Medication-Dispense
InstanceOf: ERPServiceRequestMedicationDispense
Usage: #example
Title: "Invalide Medikationsabgabe"
Description: "Dieses Beispiel ist invalide und dient nur der Sicherstellung der Validierung."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "169.100.000.000.002.36"
* subject = Reference(Example-Patient)
* status = #completed
* medicationReference = Reference(Example-Initial-Medication)
* quantity.value = 1
* quantity.unit = "Packung"
* dosageInstruction.text = "1-1-1-0"
* whenHandedOver = "2025-02-01"
* whenPrepared = "2025-02-02"