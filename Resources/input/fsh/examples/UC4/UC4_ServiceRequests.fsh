// Prescription Service Requests
Instance: UC4-Initial-Prescription-Request
InstanceOf: ServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[0]
  * system = "https://gematik.de/fhir/medreq/sid/NamingSystemRequestIdentifier"
  * value = "1"
* basedOn = Reference(Example-Zyto-Medication-Request)
* requisition[0].system = "https://gematik.de/fhir/medreq/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-UC4"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = GEM_CS_MEDREQ_Service_Request_Code#prescription-request
* subject = Reference(Patient/Example-Patient)
* orderDetail = PrescriptionFullfillmentTypeCS#send-to-pharmacy
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-01-27"
* requester = Reference(Example-Pharmacy-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier

Instance: UC4-Response-Prescription-Request
InstanceOf: ServiceRequestPrescriptionRequest
Usage: #inline
Title: "Fullfilled Prescription Request"
Description: "ServiceRequest that is returned to the requester"
* extension[EPrescriptionToken].valueIdentifier.system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/160.100.000.000.004.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[0]
  * system = "https://gematik.de/fhir/medreq/sid/NamingSystemRequestIdentifier"
  * value = "1"
* basedOn = Reference(Example-Response-KBV-Prescription)
* requisition[0].system = "https://gematik.de/fhir/medreq/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-UC4"
* status = RequestStatus#completed
* intent = RequestIntent#order
* code = GEM_CS_MEDREQ_Service_Request_Code#prescription-request
* subject = Reference(Example-Patient)
* orderDetail = PrescriptionFullfillmentTypeCS#send-to-pharmacy
* occurrenceDateTime = "2023-01-30" //update wann es tatsächlich ausgestellt wurde
* authoredOn = "2023-01-27"
* requester = Reference(Example-Pharmacy-Organization)
* performer = Reference(Example-Practitioner)

