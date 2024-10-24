// Prescription Service Requests
Instance: UC1-Initial-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC1"
* status = RequestStatus#active
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* occurrenceDateTime = "2025-05-14T12:00:00+02:00"
* authoredOn = "2025-05-13"
* requester = Reference(Example-HealthCareService-Organization)
* priority = #urgent
* reasonCode = MedicationRequestReasonCS#exhausted-range
  * text = "Medikament läuft am 15.05.2025 aus. Es sind noch 7 stk übrig."
  * extension[remainingSupply].valueQuantity
    * value = 7
    * unit = "Stück"
* note[+].text = "Wird weiterhin benötigt, bitte um Verlängerung."
* note[=].time = "2025-05-13T14:23:12+02:00"

Instance: UC1-Response-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Completed Response Prescription Request"
Description: "ServiceRequest that is returned to the requester"
* identifier[requestId].value = "1"
* requisition.value = "GroupID-UC1"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = RequestStatus#completed
* basedOn = Reference(Example-Response-Medication-Request)
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* intent = RequestIntent#order
* performer.identifier = Hans-Topp-Glücklich-Identifier
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* note[+].text = "Wird weiterhin benötigt, bitte um Verlängerung."
* note[=].time = "2025-05-14T08:12:23+02:00"

// Dispense Service Requests
Instance: UC1-Initial-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[requestId].value = "2"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#active
* intent = RequestIntent#filler-order
* subject = Reference(Example-Patient)
* code.coding[request-type] = ServiceRequestTypeCS#dispense-request
* requester = Reference(Example-HealthCareService-Organization)
* authoredOn = "2025-05-14"
* priority = #urgent
* note[+].text = "Wird weiterhin benötigt, bitte um Verlängerung. Bitte um schnelle Bearbeitung"
* note[=].time = "2025-05-14T08:22:05+02:00"

Instance: UC1-Response-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* identifier[requestId].value = "2"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#completed
* intent = RequestIntent#filler-order
* code.coding[request-type] = ServiceRequestTypeCS#dispense-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-14"
* supportingInfo[AbgabeDaten] = Reference (UC1-Medication-Dispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
* note[+].text = "Lagert vor Ort. Kann bis 13:00 heute per Botendienst geliefert werden."
* note[=].time = "2025-05-14T08:27:05+02:00"

// Dispense Service Requests - Alternative Delivery
Instance: UC1-Alt-Delivery-Initial-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* extension[alternativeDeliveryAddress].valueAddress = Example_Address
* identifier[requestId].value = "2"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#active
* intent = RequestIntent#filler-order
* subject = Reference(Example-Patient)
* code.coding[request-type] = ServiceRequestTypeCS#dispense-request
* code.coding[delivery-type] = DeliveryTypeCS#delivery-to-alternative-address
* requester = Reference(Example-HealthCareService-Organization)
* authoredOn = "2025-05-14"
* priority = #urgent
* note[+].text = "Bitte um schnelle Bearbeitung"
* note[=].time = "2025-05-14T08:22:05+02:00"

Instance: UC1-Alt-Delivery-Response-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* identifier[requestId].value = "2"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#completed
* intent = RequestIntent#filler-order
* code.coding[request-type] = ServiceRequestTypeCS#dispense-request
* code.coding[delivery-type] = DeliveryTypeCS#delivery-to-alternative-address
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-14"
* supportingInfo[AbgabeDaten] = Reference (UC1-Medication-Dispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
* note[+].text = "Lagert vor Ort. Kommt mit Extra Botendienst."
* note[=].time = "2025-05-14T08:27:05+02:00"
