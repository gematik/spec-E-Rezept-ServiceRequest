/*
This file contains Tests for servicerequest-prescription-request-6

Description: "If the status is completed, the performer must be present."
Expression: "status = 'completed' implies performer.exists()"
*/

Instance: INVALID-prescription-request-6
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 4"
* identifier[requestId].value = "INVALID-prescription-request-6"
* requisition.value = "GroupID-UC3"
* basedOn = Reference(Example-Response-Medication-Request)
* status = RequestStatus#completed
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* requester = Reference(Example-HealthCareService-Organization)
* authoredOn = "2025-05-13"
