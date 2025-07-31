// Prescription Service Requests
Instance: UC4-Initial-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Rezeptanforderung für Zytostatika-Zubereitung"
Description: "ServiceRequest der Apotheke zur Anforderung eines E-Rezepts für anwendungsfertige Zytostatika-Zubereitungen"
* identifier[+]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/RequestIdentifier"
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
* requisition.value = "GroupID-UC4"
* status = RequestStatus#active
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* requester = Reference(Example-Pharmacy-Organization)

Instance: UC4-Response-Prescription-Request
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Bestätigung Zytostatika-Rezepterstellung"
Description: "ServiceRequest-Antwort des Verordnenden mit E-Rezept-Token für Zytostatika-Zubereitungen an die Apotheke"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.004.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[+]
  * system = "https://gematik.de/fhir/erp-servicerequest/sid/RequestIdentifier"
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
* requisition.value = "GroupID-UC4"
* status = RequestStatus#completed
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* performer = Reference(Example-Practitioner)
