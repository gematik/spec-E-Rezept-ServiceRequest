// Prescription Service Requests
Instance: UC2-Initial-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "1"
* modifierExtension[redeemByPatient].valueBoolean = true
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC2"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* requester = Reference(Example-HealthCareService-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier
* note[+].text = "Sehr geehrter Herr Topp Glücklich,\n Anbei folgende Rezeptanfrage zur Einlösung von Herrn Königsstein."
* note[=].time = "2025-05-13T14:23:12+02:00"

Instance: UC2-Response-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Completed Response Prescription Request"
Description: "ServiceRequest that is returned to the requester"
* identifier[requestId].value = "1"
* requisition.value = "GroupID-UC2"
* modifierExtension[redeemByPatient].valueBoolean = true
* status = RequestStatus#completed
* basedOn = Reference(Example-Response-Medication-Request)
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* note[+].text = "Sehr geehrter Herr Topp Glücklich,\n Anbei folgende Rezeptanfrage zur Einlösung von Herrn Königsstein."
* note[=].time = "2025-05-13T12:23:12+02:00"
* note[+].text = "Sehr geehrte Damen und Herren,\n Die Verordnung steht für Herr Königsstein bereit\n Mit kollegialen Grüßen,\n Topp Glücklich."
* note[=].time = "2025-05-14T08:12:23+02:00"
