// Prescription Service Requests
Instance: UC2-Initial-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Rezeptanforderung für Patienteneinlösung"
Description: "ServiceRequest der Pflegeeinrichtung zur Anforderung eines E-Rezepts für Patienteneinlösung"
* identifier[requestId].value = "1"
* modifierExtension[redeemByPatient].valueBoolean = true
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC2"
* status = RequestStatus#active
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* requester = Reference(Example-HealthCareService-Organization)
* note[+].text = "Rezeptanfrage zur Einlösung von Herrn Königsstein."
* note[=].time = "2025-05-13T14:23:12+02:00"

Instance: UC2-Response-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Bestätigung Rezepterstellung für Patienteneinlösung"
Description: "ServiceRequest-Antwort des Verordnenden mit Bestätigung der E-Rezept-Erstellung zur Patienteneinlösung"
* identifier[requestId].value = "1"
* requisition.value = "GroupID-UC2"
* modifierExtension[redeemByPatient].valueBoolean = true
* status = RequestStatus#completed
* basedOn = Reference(Example-Response-Medication-Request)
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* performer.identifier = Hans-Topp-Glücklich-Identifier
* note[+].text = "Bereit zur Abholung."
* note[=].time = "2025-05-14T08:12:23+02:00"
