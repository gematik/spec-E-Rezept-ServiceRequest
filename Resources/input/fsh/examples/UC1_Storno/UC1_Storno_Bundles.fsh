Instance: UC1-Storno-1-Cancellation-Of-Prescription-Requester
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Cancelled Medication Request To Prescriber"
Description: "Cancellationrequest sent to Prescriber to get a Prescription"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-13T15:32:12.239+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-HealthCareService-to-Practitioner-MessageHeader-Storno"
* entry[=].resource = UC1-HealthCareService-to-Practitioner-MessageHeader-Storno
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization
// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Cancelled-Prescription-Request"
* entry[=].resource = UC1-Cancelled-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient