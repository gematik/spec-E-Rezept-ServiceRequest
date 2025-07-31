Instance: Example-Initial-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
Title: "Initialer MedicationRequest einer Rezeptanforderung"
Description: "Dieses Beispiel demonstriert einen beispielhaften MedicationRequest einer intialen Rezeptanforderung."
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
Title: "MedicationRequest einer Rezeptanforderung mit 2 Packungen"
Description: "Dieses Beispiel demonstriert einen beispielhaften MedicationRequest einer intialen Rezeptanforderung in der 2 Packungen angefragt werden."
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity
  * value = 2
  * unit = "Packungen"

Instance: Example-Initial-Medication-Request-2
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
Title: "Einheitenkodierter MedicationRequest einer Rezeptanforderung"
Description: "Dieses Beispiel demonstriert einen beispielhaften MedicationRequest einer intialen Rezeptanforderung."
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication-2)
* subject = Reference(Example-Patient-2)
* dispenseRequest.quantity = 2 '{Package}' "Packungen"

Instance: Example-Response-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
Title: "Dosierung MedicationRequest einer Rezeptanforderung"
Description: "Dieses Beispiel demonstriert einen beispielhaften MedicationRequest einer Angabe der Menge, sowie vorgeschlagene Dosierung."
* status = #active
* intent = #order
* medicationReference = Reference(Example-Response-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity = 65 'mL' "Milliliter"
* dosageInstruction.text = "1-1-1-0"

Instance: Example-Zyto-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #inline
Title: "Zyto MedicationRequest einer Rezeptanforderung"
Description: "Dieses Beispiel demonstriert einen beispielhaften MedicationRequest für eine anwendungsfertige Zytostatikazubereitung."
* status = #active
* intent = #order
* medicationReference = Reference(Example-Zyto-Medication)
* subject = Reference(Example-Patient)
* authoredOn = "2022-05-20"
* substitution.allowedBoolean = false