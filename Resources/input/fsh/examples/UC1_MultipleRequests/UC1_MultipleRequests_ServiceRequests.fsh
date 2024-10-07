// Prescription Service Requests
Instance: UC1-MULTI-Initial-Prescription-Request-1
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Initial Prescription Request Mutli 1"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "multi-1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC1-MULTI"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* requester = Reference(Example-HealthCareService-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier

Instance: UC1-MULTI-Initial-Prescription-Request-2
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Initial Prescription Request Multi 2"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "multi-2"
* basedOn = Reference(Example-Initial-Medication-Request-2)
* requisition.value = "GroupID-UC1-MULTI"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient-2)
* authoredOn = "2025-05-13"
* requester = Reference(Example-HealthCareService-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier

Instance: UC1-MULTI-Response-Prescription-Request-1
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Completed Response Prescription Request"
Description: "ServiceRequest that is returned to the requester"
* identifier[requestId].value = "multi-1"
* requisition.value = "GroupID-UC1-MULTI"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.543.72/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = RequestStatus#completed
* basedOn = Reference(Example-Response-Medication-Request)
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* note[+].text = "Sehr geehrter Herr Topp Glücklich,\n Wir möchten gerne die angehangene Medikation bei ihnen anfragen."
* note[=].time = "2025-05-13T12:23:12+02:00"
* note[+].text = "Sehr geehrte Damen und Herren,\n Wir haben alles entsprechend im Rezept hinterlegt. Es wurden 2 Packungen statt einer verschrieben.\n Mit kollegialen Grüßen,\n Topp Glücklich."
* note[=].time = "2025-05-14T08:12:23+02:00"

Instance: UC1-MULTI-Response-Prescription-Request-2
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Completed Response Prescription Request"
Description: "ServiceRequest that is returned to the requester"
* identifier[requestId].value = "multi-2"
* requisition.value = "GroupID-UC1-MULTI"
* status = RequestStatus#revoked
* subject = Reference(Example-Patient-2)
* authoredOn = "2025-05-13"
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* reasonCode.text = "Hr. Edgarson braucht das Buscopan nicht mehr, wird abgesetzt und aus dem Medkationsplan entfernt."
* note[+].text = "Sehr geehrter Herr Topp Glücklich,\n Wir möchten gerne die angehangene Medikation bei ihnen anfragen."
* note[=].time = "2025-05-13T12:23:12+02:00"
* note[+].text = "Sehr geehrte Damen und Herren,\n Die Rezeptanfrage wurde abgelehnt, s. Grund."
* note[=].time = "2025-05-14T08:12:23+02:00"
