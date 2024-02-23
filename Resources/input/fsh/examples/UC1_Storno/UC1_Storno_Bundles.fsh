Instance: UC1-Storno-1-Cancellation-Of-Prescription-Requester
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Cancelled Medication Request To Prescriber"
Description: "Cancellationrequest sent to Prescriber to get a Prescription"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2015-02-07T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-HealthCareService-to-Practitioner-MessageHeader-Storno"
* entry[=].resource = UC1-HealthCareService-to-Practitioner-MessageHeader-Storno
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Cancelled-Prescription-Request"
* entry[=].resource = UC1-Cancelled-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Observation/Medication-Runs-Out-Example-dateTime"
* entry[=].resource = Medication-Runs-Out-Example-dateTime
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Observation/Medication-Runs-Out-Example-Quantity"
* entry[=].resource = Medication-Runs-Out-Example-Quantity

Instance: UC1-Storno-2-Cancellation-Of-Prescriber
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Cancellationrequest sent from Prescriber"
Description: "Response sent from Practitioner back to HealthCareService"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2023-01-30T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-Practitioner-to-HealthCareService-MessageHeader-Storno"
* entry[=].resource = UC1-Practitioner-to-HealthCareService-MessageHeader-Storno
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Cancelled-Prescription-Request"
* entry[=].resource = UC1-Cancelled-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Observation/Medication-Runs-Out-Example-dateTime"
* entry[=].resource = Medication-Runs-Out-Example-dateTime
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Observation/Medication-Runs-Out-Example-Quantity"
* entry[=].resource = Medication-Runs-Out-Example-Quantity

Instance: UC1-Storno-3-Cancellation-Of-Dispense-Requester
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-HealthCareService-to-Pharmacy-MessageHeader-Storno"
* entry[=].resource = UC1-HealthCareService-to-Pharmacy-MessageHeader-Storno
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Cancelled-Dispense-Request"
* entry[=].resource = UC1-Cancelled-Dispense-Request

Instance: UC1-Storno-4-Cancellation-Of-Dispenser
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-Pharmacy-to-HealthCareService-MessageHeader-Storno"
* entry[=].resource = UC1-Pharmacy-to-HealthCareService-MessageHeader-Storno
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Cancelled-Dispense-Request"
* entry[=].resource = UC1-Cancelled-Dispense-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationDispense/UC1-Medication-Dispense"
* entry[=].resource = UC1-Medication-Dispense
