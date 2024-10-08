/*
This file contains Tests for servicerequest-prescription-request-6

Description: "If the status is revoked or entered-in-error, then the reasonCode or note must be present."
Expression: "(status = 'revoked' or status = 'entered-in-error') implies (reasonCode.text.exists() or note.exists())"
*/

Instance: INVALID-prescription-request-5-1-of-2
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 5"
* identifier[requestId].value = "INVALID-prescription-request-5-1-of-2"
* requisition.value = "GroupID-UC3"
* basedOn = Reference(Example-Initial-Medication-Request)
* status = RequestStatus#revoked
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* requester = Reference(Example-Pharmacy-Organization)
* authoredOn = "2025-05-13"
* performer.identifier = Hans-Topp-Glücklich-Identifier

Instance: INVALID-prescription-request-5-2-of-2
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 5"
* identifier[requestId].value = "INVALID-prescription-request-5-2-of-2"
* requisition.value = "GroupID-UC3"
* basedOn = Reference(Example-Initial-Medication-Request)
* status = RequestStatus#entered-in-error
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* requester = Reference(Example-Pharmacy-Organization)
* authoredOn = "2025-05-13"
* performer.identifier = Hans-Topp-Glücklich-Identifier
