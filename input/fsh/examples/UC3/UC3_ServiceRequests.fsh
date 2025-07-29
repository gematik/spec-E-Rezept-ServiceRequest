// Prescription Service Requests
Instance: UC3-Initial-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Rezeptanforderung der heimversorgenden Apotheke"
Description: "ServiceRequest der Apotheke zur Anforderung eines E-Rezepts beim Verordnenden"
* identifier[requestId].value = "1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC3"
* status = RequestStatus#active
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* requester = Reference(Example-Pharmacy-Organization)
* supportingInfo[pflegeeinrichtungKopie] = Reference(Example-HealthCareService-Organization)

Instance: UC3-Response-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Bestätigung Rezepterstellung für Apotheke"
Description: "ServiceRequest-Antwort des Verordnenden mit E-Rezept-Token an die Apotheke"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[requestId].value = "1"
* basedOn = Reference(Example-Response-Medication-Request)
* requisition.value = "GroupID-UC3"
* status = RequestStatus#completed
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* performer = Reference(Example-Practitioner)
