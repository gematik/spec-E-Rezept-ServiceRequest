/*
This file contains Tests for servicerequest-prescription-request-4

Description: "If the status is completed, then the request must be based on an ERP MedicationRequest."
Expression: "status = 'completed' implies basedOn.exists()"
*/

Instance: INVALID-prescription-request-4
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 4"
* identifier[requestId].value = "INVALID-prescription-request-4"
* requisition.value = "GroupID-UC3"
* status = RequestStatus#completed
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* requester = Reference(Example-HealthCareService-Organization)
* authoredOn = "2025-05-13"
* performer.identifier = Hans-Topp-Glücklich-Identifier
