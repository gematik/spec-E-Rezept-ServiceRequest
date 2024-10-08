/*
This file contains Tests for servicerequest-dispense-request-1

Description: "If the status is active, then requester must be present."
Expression: "status = 'active' implies requester.exists()"
*/

Instance: INVALID-dispense-request-1
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #example
Title: "Invalid Dispense Request 1"
* identifier[requestId].value = "INVALID-dispense-request-1"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#active
* intent = RequestIntent#filler-order
* subject = Reference(Example-Patient)
* code = ServiceRequestTypeCS#dispense-request
* authoredOn = "2025-05-14"
