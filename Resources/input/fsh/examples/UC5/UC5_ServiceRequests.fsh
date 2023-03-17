// Dispense Service Requests

Instance: UC5-Initial-Dispense-Request
InstanceOf: ServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* extension[EPrescriptionToken].valueIdentifier.system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/160.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* extension[Secret].valueIdentifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_Secret"
* extension[Secret].valueIdentifier.value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[0]
  * system = "https://gematik.de/fhir/medreq/sid/NamingSystemRequestIdentifier"
  * value = "1"
* basedOn = Reference(Example-Response-KBV-Prescription)
* requisition[0].system = "https://gematik.de/fhir/medreq/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-UC5"
* status = RequestStatus#active
* intent = RequestIntent#filler-order
* code = ServiceRequestTypeCS#dispense-request
* subject = Reference(Example-Patient)
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-02-01"
* requester = Reference(Example-Pharmacy-Organization)
* performer.identifier = Test-Apotheke2-Identifier

Instance: UC5-Response-Dispense-Request
InstanceOf: ServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* extension[EPrescriptionToken].valueIdentifier.system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/160.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[0]
  * system = "https://gematik.de/fhir/medreq/sid/NamingSystemRequestIdentifier"
  * value = "1"
* basedOn = Reference(Example-Response-KBV-Prescription)
* requisition[0].system = "https://gematik.de/fhir/medreq/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-UC5"
* status = RequestStatus#completed
* intent = RequestIntent#filler-order
* code = ServiceRequestTypeCS#dispense-request
* subject = Reference(Example-Patient)
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-02-01"
* requester = Reference(Example-Pharmacy-Organization)
* performer.identifier = Test-Apotheke2-Identifier
* supportingInfo[AbgabeDaten] = Reference (UC1-Medication-Dispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)

