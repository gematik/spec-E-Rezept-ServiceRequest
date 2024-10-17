/*
This file contains Tests for servicerequest-prescription-request-4

Description: "If the status is completed, the performer must be present."
Expression: "status = 'completed' implies performer.exists()"
*/

Instance: INVALID-prescription-request-4
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 4"
* identifier[requestId].value = "INVALID-prescription-request-4"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* requisition.value = "GroupID-UC3"
* basedOn = Reference(Example-Response-Medication-Request)
* status = RequestStatus#completed
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* requester = Reference(Example-HealthCareService-Organization)
* authoredOn = "2025-05-13"
