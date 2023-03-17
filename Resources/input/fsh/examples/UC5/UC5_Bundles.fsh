Instance: UC5-1-Dispense-Request-To-Pharmacy
InstanceOf: BundleMessageContainer
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/UC5-Pharmacy1-to-Pharmacy2-MessageHeader"
* entry[=].resource = UC5-Pharmacy1-to-Pharmacy2-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC5-Initial-Dispense-Request"
* entry[=].resource = UC5-Initial-Dispense-Request
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

Instance: UC5-2-Fullfilled-DispenseRequest-To-Pharmacy
InstanceOf: BundleMessageContainer
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/UC5-Pharmacy2-to-Pharmacy1-MessageHeader"
* entry[=].resource = UC5-Pharmacy2-to-Pharmacy1-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/UC5-Response-Dispense-Request"
* entry[=].resource = UC5-Response-Dispense-Request
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://medreq-test.de/MedicationDispense/UC1-Medication-Dispense"
* entry[=].resource = UC1-Medication-Dispense