Instance: UC1-Medication-Dispense
InstanceOf: GEM_ERP_PR_MedicationDispense
Usage: #example
Title: "Example Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[prescriptionID].value = "160.100.000.000.002.36"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X234567890"
* performer.actor.identifier.system = $identifier-telematik-id
* performer.actor.identifier.value = "3-test-telematik-id"
* whenHandedOver = "2025-05-14"
* medicationReference = Reference(SimpleMedication)
