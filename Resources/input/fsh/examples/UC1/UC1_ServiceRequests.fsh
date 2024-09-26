// Prescription Service Requests
Instance: UC1-Initial-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC1"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Patient/Example-Patient)
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-01-27"
* requester = Reference(Example-HealthCareService-Organization)
* requester.type = #PFL
* performer.identifier = Hans-Topp-Glücklich-Identifier
* reasonCode = MedicationRequestReasonCS#exhausted-range
  * extension[remainingSupply].valueQuantity
    * value = 7
    * unit = "Stück"
* note[+].text = "Medikament läuft am 31.01.2023 aus. Es sind noch 7 stk übrig."
* note[=].time = "2025-01-16T12:23:12+02:00"

Instance: UC1-Response-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Completed Response Prescription Request"
Description: "ServiceRequest that is returned to the requester"
* identifier[requestId].value = "1"
* requisition.value = "GroupID-UC1"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/160.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = RequestStatus#completed
* basedOn = Reference(Example-Response-KBV-Prescription)
* subject = Reference(Patient/Example-Patient)
* authoredOn = "2023-01-28"
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request

// Dispense Service Requests
Instance: UC1-Initial-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/160.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[requestId].value = "2"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#active
* intent = RequestIntent#filler-order
* subject = Reference(Patient/Example-Patient)
* code = ServiceRequestTypeCS#dispense-request
* requester = Reference(Example-HealthCareService-Organization)
* requester.type = #PFL
* authoredOn = "2023-01-28"

Instance: UC1-Response-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* identifier[requestId].value = "2"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#completed
* intent = RequestIntent#filler-order
* code = ServiceRequestTypeCS#dispense-request
* subject = Reference(Patient/Example-Patient)
* authoredOn = "2023-01-29"
* supportingInfo[AbgabeDaten] = Reference (UC1-Medication-Dispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
* supportingInfo[AbgabeArzneimittel] = Reference (Example-Response-Medication)
* supportingInfo[AbgabeArzneimittel].type = "Medication" (exactly)

