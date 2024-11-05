Instance: UC1-Medication-Dispense
InstanceOf: ERPServiceRequestMedicationDispense
Usage: #example
Title: "Example Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "169.100.000.000.002.36"
* subject = Reference(Example-Patient)
* status = #completed
* medicationReference = Reference(Example-Initial-Medication)
* quantity.value = 1
* quantity.unit = "Packung"
* dosageInstruction.text = "1-1-1-0"