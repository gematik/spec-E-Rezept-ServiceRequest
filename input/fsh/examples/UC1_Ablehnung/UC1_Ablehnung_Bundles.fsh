Instance: UC1-Rejection-Of-Prescriber
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "UC1-Rejection Ablehnung einer Rezeptanforderung"
Description: "Dieses Beispiel bildet ein Message Bundle mit einer Ablehnung des Arztes einer Rezeptanforderung ab."
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-13T16:15:54.239+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-Practitioner-to-HealthCareService-MessageHeader-Rejection"
* entry[=].resource = UC1-Practitioner-to-HealthCareService-MessageHeader-Rejection
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Practitioner-Organization"
* entry[=].resource = Example-Practitioner-Organization
// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Rejection-Prescription-Request"
* entry[=].resource = UC1-Rejection-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication