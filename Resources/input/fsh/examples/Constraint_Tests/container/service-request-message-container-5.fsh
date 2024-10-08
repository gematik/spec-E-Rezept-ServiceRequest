/*
This file contains Tests for service-request-message-container-5

Description: "If the the Dispense-ServiceRequest is active then the requester must be a Health Care Service."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all(($this.resolve().code.coding.code = 'dispense-request' and $this.resolve().status = 'active') implies $this.resolve().requester.resolve().type.coding.code = 'PFL')"
*/

Instance: INVALID-message-container-5
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "INVALID-service-request-message-container-5"
Description: "Test for constraint service-request-message-container-5"
* identifier.value = "urn:uuid:853b56ef-6a22-4b79-9c2f-0f4adba08ac1"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/INVALID-message-container-5-MessageHeader"
* entry[=].resource = INVALID-message-container-5-MessageHeader
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/invalid-Initial-Dispense-Request-5"
* entry[=].resource = invalid-Initial-Dispense-Request-5
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

// Message Header
Instance: INVALID-message-container-5-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "INVALID-message-container-5-MessageHeader"
Description: "INVALID-message-container-5-MessageHeader"
* insert HealthCareService-to-Pharmacy(invalid-Initial-Prescription-Request-5)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Abgabeanfrage
* responsible = Reference(Example-HealthCareService-Organization)


// Dispense Service Requests
Instance: invalid-Initial-Dispense-Request-5
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing Pharmacy"
* identifier[requestId].value = "invalid-Initial-Dispense-Request-5"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#active
* intent = RequestIntent#filler-order
* subject = Reference(Example-Patient)
* code = ServiceRequestTypeCS#dispense-request
* requester = Reference(Example-Pharmacy-Organization)
* authoredOn = "2025-05-14"
