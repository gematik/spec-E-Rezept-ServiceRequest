// Prescription Service Requests
Instance: UC1-Rejection-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Rejected Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC1"
* status = RequestStatus#revoked
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Patient/Example-Patient)
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-01-27"
* note[+].text = "Hr. Müller braucht das Medikament nicht mehr"
