Instance: INVALID-Container
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Invalider MessageContainer"
Description: "Dieses Beispiel ist invalide und dient nur der Sicherstellung der Validierung."
* identifier.value = "urn:uuid:30cacb3d-23fc-43b3-a4b4-ee803b9465b4"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-HealthCareService-to-Practitioner-MessageHeader"
* entry[=].resource = UC1-HealthCareService-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/INVALID-HealthCareService-Organization"
* entry[=].resource = INVALID-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Initial-Prescription-Request"
* entry[=].resource = UC1-Initial-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication
