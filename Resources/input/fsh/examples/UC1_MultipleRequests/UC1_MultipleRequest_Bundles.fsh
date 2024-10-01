//TODO: Beispiel für mehrere Rezeptanfragen in einem Bundle
//TODO: Beispiel für andere Medikation verschrieben (Flag)
//TODO: Beispiel für Anfrage MVO
// TODO: Beispiel mehrere Token

Instance: UC1-MULTI-1-Prescription-Request-To-Prescriber
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Medication Request To Prescriber"
Description: "Request sent to Prescriber to get a Prescription. Same Medicat"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-MULTI-HealthCareService-to-Practitioner-MessageHeader"
* entry[=].resource = UC1-MULTI-HealthCareService-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-MULTI-Initial-Prescription-Request-1"
* entry[=].resource = UC1-MULTI-Initial-Prescription-Request-1
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-MULTI-Initial-Prescription-Request-1"
* entry[=].resource = UC1-MULTI-Initial-Prescription-Request-2
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient-2"
* entry[=].resource = Example-Patient-2
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request-2"
* entry[=].resource = Example-Initial-Medication-Request-2
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication-2"
* entry[=].resource = Example-Initial-Medication-2


Instance: UC1-MULTI-2-Response-Prescription-Request-1
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Response Prescription Request"
Description: "Response from Practitioner containing the completed prescriptions"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-14T08:15:12+02:00"
// Header
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-MULTI-Practitioner-to-HealthCareService-MessageHeader"
* entry[=].resource = UC1-MULTI-Practitioner-to-HealthCareService-MessageHeader-1
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Practitioner-Organization"
* entry[=].resource = Example-Practitioner-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-MULTI-Response-Prescription-Request"
* entry[=].resource = UC1-MULTI-Response-Prescription-Request-1
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Response-Medication-Request"
* entry[=].resource = Example-Response-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication

Instance: UC1-MULTI-2-Response-Prescription-Request-2
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Response Prescription Request"
Description: "Response from Practitioner containing the rejected prescription requests"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-14T08:15:12+02:00"
// Header
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-MULTI-Practitioner-to-HealthCareService-MessageHeader"
* entry[=].resource = UC1-MULTI-Practitioner-to-HealthCareService-MessageHeader-2
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Practitioner-Organization"
* entry[=].resource = Example-Practitioner-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-MULTI-Response-Prescription-Request"
* entry[=].resource = UC1-MULTI-Response-Prescription-Request-2
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient-2