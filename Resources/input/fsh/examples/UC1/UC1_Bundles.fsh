
Instance: UC1-1-Prescription-Request-To-Prescriber
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "Medication Request To Prescriber"
Description: "Request sent to Prescriber to get a Prescription"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2015-02-07T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/Prescription-Request-MessageHeader"
* entry[=].resource = HealthCareService-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC1-Initial-Prescription-Request"
* entry[=].resource = UC1-Initial-Prescription-Request
* entry[+].fullUrl = "http://medreq-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://medreq-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://medreq-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

Instance: UC1-2-Fullfilled-Prescription-Request
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "Fullfilled Prescription Request"
Description: "Response sent from Practitioner back to HealthCareService"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2023-01-30T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/Practitioner-to-HealthCareService-MessageHeader"
* entry[=].resource = Practitioner-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC1-Response-Prescription-Request"
* entry[=].resource = UC1-Response-Prescription-Request
* entry[+].fullUrl = "http://medreq-test.de/MedicationRequest/Example-Response-KBV-Prescription"
* entry[=].resource = Example-Response-KBV-Prescription
* entry[+].fullUrl = "http://medreq-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication
* entry[+].fullUrl = "http://medreq-test.de/Practitioner/Example-Practitioner"
* entry[=].resource = Example-Practitioner
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://medreq-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

Instance: UC1-3Dispense-Request-To-Pharmacy
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/HealthCareService-to-Pharmacy-MessageHeader"
* entry[=].resource = HealthCareService-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC1-Response-Prescription-Request"
* entry[=].resource = UC1-Initial-Dispense-Request
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

Instance: UC1-4Fullfilled-DispenseRequest-To-Pharmacy
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/HealthCareService-to-Pharmacy-MessageHeader"
* entry[=].resource = HealthCareService-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC1-Response-Prescription-Request"
* entry[=].resource = UC1-Initial-Dispense-Request
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient