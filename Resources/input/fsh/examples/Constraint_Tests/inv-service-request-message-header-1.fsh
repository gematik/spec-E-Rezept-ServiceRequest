/*
This file contains Tests for service-request-message-header-1

Description: "If the Message is a copy then the focus must be a Bundle, otherwise a ServiceRequest."
Expression: "(event.coding.code = 'eRezept_Rezeptanforderung;NachrichtKopie' implies focus.resolve().is(Bundle)) and (event.coding.code != 'eRezept_Rezeptanforderung;NachrichtKopie' implies focus.resolve().is(ServiceRequest))"
*/

//TEST: CopyMessage, but focus is ServiceRequest
Instance: INVALID-Request-Header-Example
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Invalid Request from Pharmacy To Prescriber"
Description: "Invalid Request Header Example"
* identifier.value = "urn:uuid:39850775-6726-44fe-9739-c5114ebf0a93"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/INVALID-Pharmacy-to-Practitioner-MessageHeader-1"
* entry[=].resource = INVALID-Pharmacy-to-Practitioner-MessageHeader-1
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization
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

Instance: INVALID-Pharmacy-to-Practitioner-MessageHeader-1
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "INVALID-Pharmacy-to-Practitioner-MessageHeader-1"
Description: "Invalid Message Header from Pharmacy to HealthCareService"
* insert Pharmacy-to-Practitioner(UC3-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;NachrichtKopie
* responsible = Reference(Example-Pharmacy-Organization)

//TEST: No Copy Message but Bundle is in focus
Instance: INVALID-Request-Header-Example-2
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Invalid Request from Pharmacy To Prescriber"
Description: "Invalid Request Header Example"
* identifier.value = "urn:uuid:2e99ecac-24a2-4524-989e-b8016d0d16f2"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/INVALID-Pharmacy-to-Practitioner-MessageHeader-2"
* entry[=].resource = INVALID-Pharmacy-to-Practitioner-MessageHeader-2
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Bundle/UC3-1-Prescription-Request-To-Prescriber"
* entry[=].resource = UC3-1-Prescription-Request-To-Prescriber

Instance: INVALID-Pharmacy-to-Practitioner-MessageHeader-2
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "INVALID-Pharmacy-to-Practitioner-MessageHeader-2"
Description: "Invalid Message Header from Pharmacy to HealthCareService"
* insert Pharmacy-to-Practitioner(UC3-Initial-Prescription-Request)
* focus[0] = Reference(Bundle/UC3-1-Prescription-Request-To-Prescriber)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage
* responsible = Reference(Example-Pharmacy-Organization)