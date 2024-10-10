/*
This file contains Tests for servicerequest-prescription-request-1

Description: "If the status is active, the requester must be present."
Expression: "status = 'active' implies requester.exists()"
*/

Instance: INVALID-prescription-request-1
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 1"
* identifier[requestId].value = "INVALID-prescription-request-1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC3"
* status = RequestStatus#active
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* performer.identifier = Hans-Topp-Glücklich-Identifier
