// Prescription Service Requests
Instance: UC1-Cancelled-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[0]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"
  * value = "1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition[0].system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-UC1"
* status = RequestStatus#revoked
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Patient/Example-Patient)
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-01-27"
* requester = Reference(Example-HealthCareService-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier
* reasonCode = MedicationRequestReasonCS#medication-runs-out
* reasonReference[+] = Reference(Observation/Medication-Runs-Out-Example-dateTime)
* reasonReference[+] = Reference(Observation/Medication-Runs-Out-Example-Quantity)
* note[+].text = "Medikament läuft am 31.01.2023 aus. Es sind noch 7 stk übrig. "

// Dispense Service Requests

Instance: UC1-Cancelled-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* extension[EPrescriptionToken].valueIdentifier.system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/160.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[0]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"
  * value = "2"
* requisition[0].system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-UC1"
* status = RequestStatus#revoked
* intent = RequestIntent#filler-order
* subject = Reference(Example-Patient)
* code = ServiceRequestTypeCS#dispense-request
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-02-01"