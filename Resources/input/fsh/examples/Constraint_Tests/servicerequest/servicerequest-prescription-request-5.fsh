/*
This file contains Tests for servicerequest-prescription-request-5

Description: "If the requester is a pharmacy then the KIM-adress of the care facility must be stated in order to receive a copy of the message."
Expression: "requester.type = 'APO' implies (supportingInfo.exists() and supportingInfo.where(type='Organization').exists())"
*/

Instance: INVALID-prescription-request-5-1-of-2
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 5"
* identifier[requestId].value = "INVALID-prescription-request-5-1-of-2"
* requisition.value = "GroupID-UC3"
* basedOn = Reference(Example-Initial-Medication-Request)
* status = RequestStatus#active
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
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* requester = Reference(Example-Pharmacy-Organization)
* authoredOn = "2025-05-13"
* performer.identifier = Hans-Topp-Glücklich-Identifier
* supportingInfo[pflegeeinrichtungKopie] = Reference(Example-Pharmacy-Organization)
