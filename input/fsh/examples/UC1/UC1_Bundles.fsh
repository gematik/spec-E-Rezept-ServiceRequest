Instance: UC1-1-Prescription-Request-To-Prescriber
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Rezeptanforderung der Pflegeeinrichtung"
Description: "Anfrage einer Pflegeeinrichtung an einen Verordnenden zur Erstellung eines E-Rezepts für die Heimversorgung"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-HealthCareService-to-Practitioner-MessageHeader"
* entry[=].resource = UC1-HealthCareService-to-Practitioner-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Initial-Prescription-Request"
* entry[=].resource = UC1-Initial-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication


Instance: UC1-2-Fullfilled-Prescription-Request
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Bestätigung der Rezepterstellung für Heimversorgung"
Description: "Antwort des Verordnenden an die Pflegeeinrichtung mit Bestätigung der E-Rezept-Erstellung für die Heimversorgung"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-14T08:15:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-Practitioner-to-HealthCareService-MessageHeader"
* entry[=].resource = UC1-Practitioner-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Practitioner-Organization"
* entry[=].resource = Example-Practitioner-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Response-Prescription-Request"
* entry[=].resource = UC1-Response-Prescription-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Response-Medication-Request"
* entry[=].resource = Example-Response-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication

Instance: UC1-3-Dispense-Request-To-Pharmacy
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Abgabeanforderung an Apotheke"
Description: "Anfrage der Pflegeeinrichtung an eine Apotheke zur Belieferung mit dem E-Rezept für die Heimversorgung"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp = "2025-05-14T08:23:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-HealthCareService-to-Pharmacy-MessageHeader"
* entry[=].resource = UC1-HealthCareService-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Initial-Dispense-Request"
* entry[=].resource = UC1-Initial-Dispense-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

Instance: UC1-4-Fullfilled-DispenseRequest-To-Pharmacy
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Bestätigung der Belieferung durch Apotheke"
Description: "Antwort der Apotheke an die Pflegeeinrichtung mit Bestätigung der Belieferung für die Heimversorgung"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp = "2025-05-14T08:30:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-Pharmacy-to-HealthCareService-MessageHeader"
* entry[=].resource = UC1-Pharmacy-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Response-Dispense-Request"
* entry[=].resource = UC1-Response-Dispense-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

// Medication Dispense
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationDispense/UC1-Medication-Dispense"
* entry[=].resource = UC1-Medication-Dispense
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

Instance: UC1-3-Alt-Delivery-Dispense-Request-To-Pharmacy
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Abgabeanforderung mit alternativer Lieferadresse"
Description: "Anfrage der Pflegeeinrichtung an eine Apotheke zur Belieferung mit alternativer Lieferadresse für die Heimversorgung"
* identifier.value = "urn:uuid:fa23be14-c00a-4ddc-8128-82ace2f9a80b"
* timestamp = "2025-05-14T08:23:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-Alt-Delivery-HealthCareService-to-Pharmacy-MessageHeader"
* entry[=].resource = UC1-Alt-Delivery-HealthCareService-to-Pharmacy-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Alt-Delivery-Initial-Dispense-Request"
* entry[=].resource = UC1-Alt-Delivery-Initial-Dispense-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

Instance: UC1-4-Alt-Delivery-Fullfilled-DispenseRequest-To-Pharmacy
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Bestätigung der Belieferung mit alternativer Lieferadresse"
Description: "Antwort der Apotheke an die Pflegeeinrichtung mit Bestätigung der Belieferung an alternative Lieferadresse"
* identifier.value = "urn:uuid:ebad657e-589f-4386-ad81-19352ca21310"
* timestamp = "2025-05-14T08:30:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/UC1-Alt-Delivery-Pharmacy-to-HealthCareService-MessageHeader"
* entry[=].resource = UC1-Alt-Delivery-Pharmacy-to-HealthCareService-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/UC1-Alt-Delivery-Response-Dispense-Request"
* entry[=].resource = UC1-Alt-Delivery-Response-Dispense-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

// Medication Dispense
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationDispense/UC1-Medication-Dispense"
* entry[=].resource = UC1-Medication-Dispense
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication