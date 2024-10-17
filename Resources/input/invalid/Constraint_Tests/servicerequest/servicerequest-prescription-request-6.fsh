/*
This file contains Tests for servicerequest-prescription-request-6

Description: "If the status is active, then the request must be based on an ERP MedicationRequest."
Expression: "status = 'active' implies basedOn.exists()"
*/

Instance: INVALID-prescription-request-6
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 3"
* identifier[requestId].value = "INVALID-prescription-request-6"
* requisition.value = "GroupID-UC3"
* status = RequestStatus#active
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* requester = Reference(Example-HealthCareService-Organization)
* authoredOn = "2025-05-13"
* performer.identifier = Hans-Topp-Glücklich-Identifier
