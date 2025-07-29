
Instance: UC4-1-Prescription-and-Dispense-Request-To-Prescriber
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Rezeptanforderung für Zytostatika-Zubereitung"
Description: "Anfrage einer Apotheke an einen Verordnenden zur Erstellung eines E-Rezepts für anwendungsfertige Zytostatika-Zubereitungen"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC4-1-Pharmacy-to-Practitioner-MessageHeader"
* entry[=].resource = UC4-1-Pharmacy-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC4-Initial-Prescription-Request"
* entry[=].resource = UC4-Initial-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

// MedicationRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Zyto-Medication-Request"
* entry[=].resource = Example-Zyto-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Zyto-Medication"
* entry[=].resource = Example-Zyto-Medication

Instance: UC4-2-Prescription-Request-To-Pharmacy
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Bestätigung der Zytostatika-Rezepterstellung"
Description: "Antwort des Verordnenden an die Apotheke mit Bestätigung der E-Rezept-Erstellung für Zytostatika-Zubereitungen"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp = "2025-05-14T08:15:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC4-2-Practitioner-to-Pharmacy-MessageHeader"
* entry[=].resource = UC4-2-Practitioner-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Practitioner-Organization"
* entry[=].resource = Example-Practitioner-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC4-Response-Prescription-Request"
* entry[=].resource = UC4-Response-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Practitioner/Example-Practitioner"
* entry[=].resource = Example-Practitioner

// MedicationRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Zyto-Medication-Request"
* entry[=].resource = Example-Zyto-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Zyto-Medication"
* entry[=].resource = Example-Zyto-Medication
