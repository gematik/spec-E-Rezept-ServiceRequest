/*
This file contains Tests for service-request-message-container-2

Description: "If the the ServiceRequest contains the health-care service as a reference, then the e-mail contact must be present."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all($this.resolve().supportingInfo.where($this.type = 'Organization').reference.resolve().contact.telecom.where(system = 'email').exists())"
*/

//TEST: SupportingInfo Organization is stated, but no KIM Message is present
Instance: INVALID-message-container-2
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "INVALID-service-request-message-container-2"
Description: "Test for constraint service-request-message-container-2"
* identifier.value = "urn:uuid:4e7026da-2498-4b29-ad5c-02451161e404"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/INVALID-message-container-2-MessageHeader"
* entry[=].resource = INVALID-message-container-2-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization-no-kim"
* entry[=].resource = Example-HealthCareService-Organization-no-kim

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/invalid-Initial-Prescription-Request-1"
* entry[=].resource = invalid-Initial-Prescription-Request-1
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

// Message Header
Instance: INVALID-message-container-2-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "INVALID-message-container-2-MessageHeader"
Description: "INVALID-message-container-2-MessageHeader"
* insert Pharmacy-to-Practitioner(invalid-Initial-Prescription-Request-1)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage "Anfrage an einen Arzt ein Rezept auszustellen"
* responsible = Reference(Example-Pharmacy-Organization)

// Prescription Service Requests
Instance: invalid-Initial-Prescription-Request-1
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "1"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC3"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* requester = Reference(Example-Pharmacy-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier
* supportingInfo[pflegeeinrichtungKopie] = Reference(Example-HealthCareService-Organization-no-kim)
