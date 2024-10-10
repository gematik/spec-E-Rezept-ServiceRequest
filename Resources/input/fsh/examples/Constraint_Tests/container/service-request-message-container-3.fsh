/*
This file contains Tests for service-request-message-container-3

Description: "If the the ServiceRequest contains the health-care service as a reference, then the organization must have the respective type."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all($this.resolve().supportingInfo.where($this.type = 'Organization').exists() implies $this.resolve().supportingInfo.where($this.type = 'Organization').reference.resolve().type.coding.code = 'PFL')"
*/

//TEST: SupportingInfo Organization is stated, but wrong type
Instance: INVALID-message-container-3
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "INVALID-service-request-message-container-3"
Description: "Test for constraint service-request-message-container-3"
* identifier.value = "urn:uuid:cc6db961-116d-4dab-9165-2d09662d1b24"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/INVALID-message-container-3-MessageHeader"
* entry[=].resource = INVALID-message-container-3-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization-wrong-type"
* entry[=].resource = Example-HealthCareService-Organization-wrong-type

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/invalid-Initial-Prescription-Request-2"
* entry[=].resource = invalid-Initial-Prescription-Request-2
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

// Message Header
Instance: INVALID-message-container-3-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "INVALID-message-container-3-MessageHeader"
Description: "INVALID-message-container-3-MessageHeader"
* insert Pharmacy-to-Practitioner(invalid-Initial-Prescription-Request-2)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage
* responsible = Reference(Example-Pharmacy-Organization)

// Prescription Service Requests
Instance: invalid-Initial-Prescription-Request-2
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
* supportingInfo[pflegeeinrichtungKopie] = Reference(Example-HealthCareService-Organization-wrong-type)
