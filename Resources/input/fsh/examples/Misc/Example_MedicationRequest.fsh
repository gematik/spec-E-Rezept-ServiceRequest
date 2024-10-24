Instance: Example-Initial-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity
  * value = 1
  * unit = "Packung"

Instance: Example-Komplex-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity
  * value = 2
  * unit = "Packungen"

Instance: Example-Initial-Medication-Request-2
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #inline
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication-2)
* subject = Reference(Example-Patient-2)
* dispenseRequest.quantity = 2 '{Package}' "Packungen"

Instance: Example-Response-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
* status = #active
* intent = #order
* medicationReference = Reference(Example-Response-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity = 65 'mL' "Milliliter"
* dosageInstruction.text = "1-1-1-0"

Instance: Example-Zyto-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #inline
* status = #active
* intent = #order
* medicationReference = Reference(Example-Zyto-Medication)
* subject = Reference(Example-Patient)
* authoredOn = "2022-05-20"
* substitution.allowedBoolean = false