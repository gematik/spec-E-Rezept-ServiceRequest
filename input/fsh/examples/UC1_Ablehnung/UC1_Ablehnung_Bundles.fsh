Instance: UC1-Rejection-Of-Prescriber
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Rejectionrequest sent from Prescriber"
Description: "Response sent from Practitioner back to HealthCareService"
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

Instance: UC1-Rejection-Of-Pharmacy
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Rejectionrequest sent from Pharmacy"
Description: "Response sent from Pharmacy back to HealthCareService"
* identifier.value = "urn:uuid:5c1e9aa2-94d2-4f20-9ffb-25e3d4e84c5f"
* timestamp = "2025-05-13T16:15:54.239+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-Pharmacy-to-HealthCareService-MessageHeader-Rejection"
* entry[=].resource = UC1-Pharmacy-to-HealthCareService-MessageHeader-Rejection
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization
// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Rejection-Dispense-Request"
* entry[=].resource = UC1-Rejection-Dispense-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient