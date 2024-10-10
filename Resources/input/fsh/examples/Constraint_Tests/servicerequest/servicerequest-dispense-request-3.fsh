/*
This file contains Tests for servicerequest-dispense-request-3

Description: "If the status is completed, then the dispense data must be present."
Expression: "status = 'completed' implies supportingInfo.where(type='MedicationDispense').exists()"
*/

Instance: INVALID-dispense-request-3
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #example
Title: "Invalid Dispense Request 1"
* identifier[requestId].value = "INVALID-dispense-request-3"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#completed
* intent = RequestIntent#filler-order
* subject = Reference(Example-Patient)
* code = ServiceRequestTypeCS#dispense-request
* requester = Reference(Example-HealthCareService-Organization)
* authoredOn = "2025-05-14"
