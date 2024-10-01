// Prescription Service Requests
Instance: UC3-Initial-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC3"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* requester = Reference(Example-Pharmacy-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier

Instance: UC3-Response-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "ServiceRequest that is returned to the requester"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[requestId].value = "1"
* basedOn = Reference(Example-Response-Medication-Request)
* requisition.value = "GroupID-UC3"
* status = RequestStatus#completed
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* performer = Reference(Example-Practitioner)
