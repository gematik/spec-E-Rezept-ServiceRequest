/*
This file contains Tests for service-request-message-container-4

Description: "If the the ServiceRequest is active and the requester is a pharmacy, then the Healthcare Service to receive a copy must be stated."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all(($this.resolve().status = 'active' and $this.resolve().requester.resolve().type.coding.code = 'APO') implies $this.resolve().supportingInfo.where($this.type = 'Organization').exists())"
*/

Instance: INVALID-message-container-4
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "INVALID-service-request-message-container-4"
Description: "Test for constraint service-request-message-container-4"
* identifier.value = "urn:uuid:f6ecd2e0-2fd0-4017-8797-9140fea018b5"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/INVALID-message-container-4-MessageHeader"
* entry[=].resource = INVALID-message-container-4-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Pharmacy-Organization"
* entry[=].resource = Example-Pharmacy-Organization
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/invalid-Initial-Prescription-Request-4"
* entry[=].resource = invalid-Initial-Prescription-Request-4
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

// Message Header
Instance: INVALID-message-container-4-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "INVALID-message-container-4-MessageHeader"
Description: "INVALID-message-container-4-MessageHeader"
* insert Pharmacy-to-Practitioner(invalid-Initial-Prescription-Request-4)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage
* responsible = Reference(Example-Pharmacy-Organization)


// Prescription Service Requests
Instance: invalid-Initial-Prescription-Request-4
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "invalid-Initial-Prescription-Request-4"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC3"
* status = RequestStatus#active
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* requester = Reference(Example-Pharmacy-Organization)
* performer.identifier = Hans-Topp-Glücklich-Identifier
