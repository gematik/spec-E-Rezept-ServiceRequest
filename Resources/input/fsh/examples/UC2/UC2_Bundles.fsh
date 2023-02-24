
Instance: UC2-1-Prescription-and-Dispense-Request-To-Prescriber
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "Medication Request To Prescriber"
Description: "Request sent to Prescriber to get a Prescription"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2015-02-07T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/UC2-1-HealthCareService-to-Practitioner-MessageHeader"
* entry[=].resource = UC2-1-HealthCareService-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC2-Initial-Prescription-Request"
* entry[=].resource = UC2-Initial-Prescription-Request
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC2-Initial-Dispense-Request"
* entry[=].resource = UC2-Initial-Dispense-Request
* entry[+].fullUrl = "http://medreq-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://medreq-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://medreq-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

Instance: UC2-2-Dispense-Request-To-Pharmacy
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/UC2-2-Practitioner-to-Pharmacy-MessageHeader"
* entry[=].resource = UC2-2-Practitioner-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC2-Forward-Dispense-Request"
* entry[=].resource = UC2-Forward-Dispense-Request
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://medreq-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization


Instance: UC2-3-Fullfilled-DispenseRequest-To-HealthCareService
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/UC2-3-Pharmacy-to-HealthCareService-MessageHeader"
* entry[=].resource = UC2-3-Pharmacy-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC2-Response-Dispense-Request"
* entry[=].resource = UC2-Response-Dispense-Request
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://medreq-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization