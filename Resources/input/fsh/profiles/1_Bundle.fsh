Profile: GEM_PR_MEDREQ_MessageBundle
Parent: GEM_PR_KIM_MessageBundle
Id: GEM-PR-MEDREQ-MessageBundle
Title: "GEM_PR_MEDREQ_MessageBundle"
Description: "Basic Bundle for communication of FHIR Ressources with KIM Messages"

* insert Meta (GEM-PR-MEDREQ-MessageBundle)

* entry[MessageHeader].resource only GEM_PR_MEDREQ_MessageHeader

Instance: PrescriptionRequestToPrescriber
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "Medication Request To Prescriber"
Description: "Request sent to Prescriber to get a Prescription"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2015-02-07T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/Prescription-Request-MessageHeader"
* entry[=].resource = HealthCareService-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/Initial-Prescription-Request"
* entry[=].resource = Initial-Prescription-Request
* entry[+].fullUrl = "http://medreq-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://medreq-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://medreq-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

Instance: FullfilledPrescriptionRequest
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "Fullfilled Prescription Request"
Description: "Response sent from Practitioner back to HealthCareService"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2023-01-30T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/Practitioner-to-HealthCareService-MessageHeader"
* entry[=].resource = Practitioner-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/Response-Prescription-Request"
* entry[=].resource = Response-Prescription-Request
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

Instance: DispenseRequestToPharmacy
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[0].fullUrl = "http://medreq-test.de/MessageHeader/HealthCareService-to-Pharmacy-MessageHeader"
* entry[=].resource = HealthCareService-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://medreq-test.de/ServiceRequest/Response-Prescription-Request"
* entry[=].resource = Initial-Dispense-Request
* entry[+].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient