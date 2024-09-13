// Prescription Service Requests
Instance: UC4-Initial-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[0]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"
  * value = "1"
* identifier[+]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/patient-id"
  * value = "Patient-ID-e15232e9-01e0-4ce8-b628-71adb9023b21"
* identifier[+]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/case-id"
  * value = "Case-ID-85d39ff7-2f02-4bfc-85d5-0ba2752f6076"
* identifier[+]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/process-id"
  * value = "Process-ID-db6fd21d-cc85-4411-8567-479a7dc1ef74"
* identifier[+]
  * system = "https://my-very-own-zyto-identifier"
  * value = "My-ID-bdbdf8a1-ffa4-4f16-a6c4-38e690ac5548"
* basedOn = Reference(Example-Zyto-Medication-Request)
* requisition[0].system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-UC4"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Patient/Example-Patient)
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-01-27"
* requester = Reference(Example-Pharmacy-Organization)
* requester.type = #APO
* performer.identifier = Hans-Topp-Glücklich-Identifier

Instance: UC4-Response-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Fullfilled Prescription Request"
Description: "ServiceRequest that is returned to the requester"
* extension[EPrescriptionToken].valueIdentifier.system = "https://gematik.de/fhir/erp/sid/NamingSystemEPrescriptionToken"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/160.100.000.000.004.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[0]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier"
  * value = "1"
* identifier[+]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/patient-id"
  * value = "Patient-ID-e15232e9-01e0-4ce8-b628-71adb9023b21"
* identifier[+]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/case-id"
  * value = "Case-ID-85d39ff7-2f02-4bfc-85d5-0ba2752f6076"
* identifier[+]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/process-id"
  * value = "Process-ID-db6fd21d-cc85-4411-8567-479a7dc1ef74"
* identifier[+]
  * system = "https://my-very-own-zyto-identifier"
  * value = "My-ID-bdbdf8a1-ffa4-4f16-a6c4-38e690ac5548"
* basedOn = Reference(Example-Response-KBV-Prescription)
* requisition[0].system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"
* requisition[=].value = "GroupID-UC4"
* status = RequestStatus#completed
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* occurrenceDateTime = "2023-01-30" //update wann es tatsächlich ausgestellt wurde
* authoredOn = "2023-01-27"
* requester = Reference(Example-Pharmacy-Organization)
* requester.type = #APO
* performer = Reference(Example-Practitioner)
