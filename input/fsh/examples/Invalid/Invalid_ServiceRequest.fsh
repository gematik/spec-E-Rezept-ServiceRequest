Instance: INVALID-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Bestätigung Rezepterstellung für Heimversorgung"
Description: "ServiceRequest-Antwort des Verordnenden mit E-Rezept-Token an die Pflegeeinrichtung"
* identifier[requestId].value = "1"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#completed
* basedOn = Reference(Example-Response-Medication-Request)
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* intent = RequestIntent#order
* performer.identifier = Hans-Topp-Glücklich-Identifier
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* note[+].text = "Wird weiterhin benötigt, bitte um Verlängerung."
* note[=].time = "2025-05-14T08:12:23+02:00"

Instance: INVALID-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #example
Title: "Abgabeanforderung der Pflegeeinrichtung"
Description: "ServiceRequest der Pflegeeinrichtung zur Abgabe des E-Rezepts an die Apotheke für die Heimversorgung"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[requestId].value = "2"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#active
* intent = RequestIntent#filler-order
* subject = Reference(Example-Patient)
* code.coding[request-type] = ServiceRequestTypeCS#dispense-request
* authoredOn = "2025-05-14"
* priority = #urgent
* note[+].text = "Wird weiterhin benötigt, bitte um Verlängerung. Bitte um schnelle Bearbeitung"
* note[=].time = "2025-05-14T08:22:05+02:00"