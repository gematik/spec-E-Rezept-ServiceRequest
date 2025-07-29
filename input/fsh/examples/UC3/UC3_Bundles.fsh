Instance: UC3-1-Prescription-Request-To-Prescriber
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Rezeptanforderung der Apotheke an Verordnenden"
Description: "Anfrage einer heimversorgenden Apotheke an einen Verordnenden zur Erstellung eines E-Rezepts"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC3-Pharmacy-to-Practitioner-MessageHeader"
* entry[=].resource = UC3-Pharmacy-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC3-Initial-Prescription-Request"
* entry[=].resource = UC3-Initial-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

Instance: UC3-1-Prescription-Request-To-Prescriber-COPY
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Nachrichtenkopie der Apothekenrezeptanforderung"
Description: "Kopie der Rezeptanforderung der Apotheke, die an die Pflegeeinrichtung gesendet wird"
* identifier.value = "urn:uuid:183371e3-e58d-471c-a540-912c94fb0c51"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC3-Pharmacy-to-HealthCareService-MessageHeader"
* entry[=].resource = UC3-Pharmacy-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Bundle/UC3-1-Prescription-Request-To-Prescriber"
* entry[=].resource = UC3-1-Prescription-Request-To-Prescriber
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization

Instance: UC3-2-Fullfilled-Prescription-Request
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Bestätigung der Rezepterstellung für Apotheke"
Description: "Antwort des Verordnenden an die Apotheke mit Bestätigung der E-Rezept-Erstellung"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-14T08:15:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC3-Practitioner-to-Pharmacy-MessageHeader"
* entry[=].resource = UC3-Practitioner-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Practitioner-Organization"
* entry[=].resource = Example-Practitioner-Organization

//ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC3-Response-Prescription-Request"
* entry[=].resource = UC3-Response-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Practitioner/Example-Practitioner"
* entry[=].resource = Example-Practitioner

// MedicationRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Response-Medication-Request"
* entry[=].resource = Example-Response-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication

Instance: UC3-2-Fullfilled-Prescription-Request-COPY
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Nachrichtenkopie der Rezeptbestätigung"
Description: "Kopie der Bestätigung der E-Rezept-Erstellung, die an die Pflegeeinrichtung gesendet wird"
* identifier.value = "urn:uuid:2c60b3d3-a901-4df2-92ef-a9c3e525fa43"
* timestamp = "2025-05-14T08:15:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC3-Practitioner-to-HealthCareService-MessageHeader"
* entry[=].resource = UC3-Practitioner-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Bundle/UC3-2-Fullfilled-Prescription-Request"
* entry[=].resource = UC3-2-Fullfilled-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Practitioner-Organization"
* entry[=].resource = Example-Practitioner-Organization
