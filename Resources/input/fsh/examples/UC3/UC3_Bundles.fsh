Instance: UC3-1-Prescription-Request-To-Prescriber
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Medication Request To Prescriber"
Description: "Request sent to Prescriber to get a Prescription"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2015-02-07T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC3-HealthCareService-to-Practitioner-MessageHeader"
* entry[=].resource = UC3-HealthCareService-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC3-Initial-Prescription-Request"
* entry[=].resource = UC3-Initial-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

Instance: UC3-2-Fullfilled-Prescription-Request
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Fullfilled Prescription Request"
Description: "Response sent from Practitioner back to HealthCareService"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2023-01-30T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC3-Practitioner-to-HealthCareService-MessageHeader"
* entry[=].resource = UC3-Practitioner-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC3-Response-Prescription-Request"
* entry[=].resource = UC3-Response-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication
