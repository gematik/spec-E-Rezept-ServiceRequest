// Prescription Service Requests
Instance: UC1-Rejection-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Abgelehnte Rezeptanforderung"
Description: "Dieser ServiceRequest wird gesendet, um die Rezeptanforderung abzulehnen"
* identifier[requestId].value = "1"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#revoked
* intent = RequestIntent#order
* basedOn = Reference(Example-Initial-Medication-Request)
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* reasonCode.text = "Hr. Königsstein braucht das Medikament nicht mehr"

// Dispense Service Requests
Instance: UC1-Rejection-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Abgelehnte Abgabeanforderung"
Description: "Dieser ServiceRequest wird gesendet, um die Abgabeanforderung abzulehnen"
* identifier[requestId].value = "1"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#revoked
* intent = RequestIntent#filler-order
* basedOn = Reference(Example-Initial-Medication-Request)
* code.coding[request-type] = ServiceRequestTypeCS#dispense-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* reasonCode.text = "Medikament ist bis auf weiteres nicht lieferbar"