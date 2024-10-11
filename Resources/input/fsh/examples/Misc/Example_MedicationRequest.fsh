Instance: Example-Initial-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity = 1 '{Package}'

Instance: Example-Komplex-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity = 3 '{Package}'

Instance: Example-Initial-Medication-Request-2
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #inline
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication-2)
* subject = Reference(Example-Patient-2)
* dispenseRequest.quantity = 2 '{Package}'

Instance: Example-Response-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
* status = #active
* intent = #order
* medicationReference = Reference(Example-Response-Medication)
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