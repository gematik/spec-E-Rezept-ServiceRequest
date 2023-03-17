
Instance: UC4-1-Prescription-and-Dispense-Request-To-Prescriber
InstanceOf: BundleMessageContainer
Usage: #example
Title: "Medication Request To Prescriber"
Description: "Request sent to Prescriber to get a Prescription"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2015-02-07T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/UC4-1-Pharmacy-to-Practitioner-MessageHeader"
* entry[=].resource = UC4-1-Pharmacy-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC4-Initial-Prescription-Request"
* entry[=].resource = UC4-Initial-Prescription-Request
* entry[+].fullUrl = "http://medreq-test.de/MedicationRequest/Example-Zyto-Medication-Request"
* entry[=].resource = Example-Zyto-Medication-Request
* entry[+].fullUrl = "http://medreq-test.de/Medication/Example-Zyto-Medication"
* entry[=].resource = Example-Zyto-Medication
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://medreq-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization

Instance: UC4-2-Prescription-Request-To-Pharmacy
InstanceOf: BundleMessageContainer
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/UC4-2-Practitioner-to-Pharmacy-MessageHeader"
* entry[=].resource = UC4-2-Practitioner-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC4-Response-Prescription-Request"
* entry[=].resource = UC4-Response-Prescription-Request
* entry[+].fullUrl = "http://medreq-test.de/MedicationRequest/Example-Response-KBV-Prescription"
* entry[=].resource = Example-Response-KBV-Prescription
* entry[+].fullUrl = "http://medreq-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication
* entry[+].fullUrl = "http://medreq-test.de/Coverage/Response-Coverage"
* entry[=].resource = Response-Coverage
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://medreq-test.de/Practitioner/Example-Practitioner"
* entry[=].resource = Example-Practitioner
* entry[+].fullUrl = "http://medreq-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization
