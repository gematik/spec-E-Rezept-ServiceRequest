/*
This file contains Tests for servicerequest-dispense-request-2

Description: "If the status is active, then the e-prescription-token must be present."
Expression: "status = 'active' implies extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex').exists()"
*/

Instance: INVALID-dispense-request-2
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #example
Title: "Invalid Dispense Request 1"
* identifier[requestId].value = "INVALID-dispense-request-2"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#active
* intent = RequestIntent#filler-order
* subject = Reference(Example-Patient)
* code = ServiceRequestTypeCS#dispense-request
* requester = Reference(Example-HealthCareService-Organization)
* authoredOn = "2025-05-14"
