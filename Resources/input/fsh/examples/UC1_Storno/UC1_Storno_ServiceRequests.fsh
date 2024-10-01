// Prescription Service Requests
Instance: UC1-Cancelled-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "1"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#entered-in-error
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* requester = Reference(Example-HealthCareService-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier
* reasonCode
  * text = "Falsche Medikation angefragt, neuer Antrag wird erstellt."
* note[+].text = "Sehr geehrter Herr Topp Glücklich,\n Wir möchten gerne die angehangene Medikation bei ihnen schnellstmöglich anfragen."
* note[=].time = "2025-05-13T14:23:12+02:00"
* note[+].text = "Sehr geehrter Herr Topp Glücklich,\n Bitte entschuldigen Sie die vorherige anfrage, nach Möglichkeit bitte stornieren, eine neue Anfrage wird erstellt."
* note[=].time = "2025-05-13T15:31:12+02:00"