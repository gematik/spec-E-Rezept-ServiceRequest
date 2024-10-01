// Prescription Service Requests
Instance: UC1-Rejection-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Rejected Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "1"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#revoked
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* reasonCode.text = "Hr. Königsstein braucht das Medikament nicht mehr"
* note[+].text = "Sehr geehrter Herr Topp Glücklich,\n Wir möchten gerne die angehangene Medikation bei ihnen schnellstmöglich anfragen."
* note[=].time = "2025-05-13T14:23:12+02:00"
* note[+].text = "Sehr geehrter Kollegen Immgergrün,\n Ihre Rezeptanforderung habe ich abgelehnt, siehe Grund."
* note[=].time = "2025-05-13T16:12:54+02:00"