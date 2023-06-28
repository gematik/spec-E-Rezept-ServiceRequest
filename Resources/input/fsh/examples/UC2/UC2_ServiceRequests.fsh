// Prescription Service Requests
Instance: UC2-Initial-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[0]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"
  * value = "req-1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition[0].system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-2"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Patient/Example-Patient)
* orderDetail = PrescriptionFullfillmentTypeCS#return-to-requester
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-01-27"
* requester = Reference(Example-Pharmacy-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier

Instance: UC2-Response-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Fullfilled Prescription Request"
Description: "ServiceRequest that is returned to the requester"
* extension[EPrescriptionToken].valueIdentifier.system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/160.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[0]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"
  * value = "req-1"
* basedOn = Reference(Example-Response-KBV-Prescription)
* requisition[0].system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-2"
* status = RequestStatus#completed
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* orderDetail = PrescriptionFullfillmentTypeCS#return-to-requester
* occurrenceDateTime = "2023-01-30" //update wann es tatsächlich ausgestellt wurde
* authoredOn = "2023-01-27"
* requester = Reference(Example-Pharmacy-Organization)
* performer = Reference(Example-Practitioner)

// Fullfilled Dispense
Instance: UC2-Response-Dispense-Request
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Dispense Request back to HealthCareService"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* identifier[0]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"
  * value = "req-2"
* basedOn = Reference(Example-Response-KBV-Prescription)
* requisition[0].system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-2"
* status = RequestStatus#completed
* intent = RequestIntent#filler-order
* code = ServiceRequestTypeCS#dispense-request
* subject = Reference(Example-Patient)
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-02-01"
* requester = Reference(Example-Pharmacy-Organization)
* performer.identifier = Test-Apotheke-Identifier
* supportingInfo[AusstellenderArzt] = Reference(Example-Practitioner)
* supportingInfo[AusstellenderArzt].type = "Practitioner"
* supportingInfo[AbgabeDaten] = Reference (UC1-Medication-Dispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
