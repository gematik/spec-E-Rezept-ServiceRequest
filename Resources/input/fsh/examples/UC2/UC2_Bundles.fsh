
Instance: UC2-1-Prescription-Request-To-HealthCareService
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Medication Request To HealthCareService"
Description: "Request sent to HealthCareService to forward to prescriber"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2015-02-07T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC2-1-Pharmacy-to-HealthCareService-MessageHeader"
* entry[=].resource = UC2-1-Pharmacy-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC2-Initial-Prescription-Request"
* entry[=].resource = UC2-Initial-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

Instance: UC2-2-Prescription-Request-To-Prescriber
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Medication Request To Prescriber"
Description: "Request sent to Prescriber to get a Prescription"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2015-02-07T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC2-2-HealthCareService-to-Practitioner-MessageHeader"
* entry[=].resource = UC2-2-HealthCareService-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC2-Initial-Prescription-Request"
* entry[=].resource = UC2-Initial-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

Instance: UC2-3-Fullfilled-Prescription-Request
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Fullfilled Prescription Request"
Description: "Response sent from Practitioner back to HealthCareService"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2023-01-30T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC2-3-Practitioner-to-HealthCareService-MessageHeader"
* entry[=].resource = UC2-3-Practitioner-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC2-Response-Prescription-Request"
* entry[=].resource = UC2-Response-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Response-KBV-Prescription"
* entry[=].resource = Example-Response-KBV-Prescription
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication

Instance: UC2-4-Fullfilled-Prescription-Request
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Fullfilled Prescription Request"
Description: "Response sent from Practitioner back to HealthCareService"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2023-01-30T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC2-4-HealthCareService-to-Pharmacy-MessageHeader"
* entry[=].resource = UC2-4-HealthCareService-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC2-Response-Prescription-Request"
* entry[=].resource = UC2-Response-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Response-KBV-Prescription"
* entry[=].resource = Example-Response-KBV-Prescription
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication

Instance: UC2-5-Fullfilled-DispenseRequest-To-HealthCareService
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Fulfilled Dispense info to HealthCareService"
Description: "Request sent from Pharmacy to to inform HealthCareService about dispense"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC2-5-Pharmacy-to-HealthCareService-MessageHeader"
* entry[=].resource = UC2-5-Pharmacy-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC2-Response-Dispense-Request"
* entry[=].resource = UC2-Response-Dispense-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationDispense/UC1-Medication-Dispense"
* entry[=].resource = UC1-Medication-Dispense
