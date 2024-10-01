Instance: Example-Initial-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity = 1 '{Package}'

Instance: Example-Response-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity = 2 '{Package}'

Instance: Example-Zyto-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #inline
* status = #active
* intent = #order
* medicationReference = Reference(Example-Zyto-Medication)
* subject = Reference(Example-Patient)
* authoredOn = "2022-05-20"
* substitution.allowedBoolean = false