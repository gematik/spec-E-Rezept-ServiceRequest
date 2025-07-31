Instance: XSLT-Request-MVO-Bundle
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Rezeptanforderung mit MVO-Anfrage"
Description: "Eine Rezeptanforderung mit Mehrfachverordnungs-Anfrage"
* identifier.value = "urn:uuid:c881f35a-2463-4b0b-9164-0f7fc2e35136"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/XSLT-Request-MVO-Header"
* entry[=].resource = XSLT-Request-MVO-Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/XSLT-Request-MVO-ServiceRequest"
* entry[=].resource = XSLT-Request-MVO-ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/XSLT-Request-MVO-Medication-Request"
* entry[=].resource = XSLT-Request-MVO-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

Instance: XSLT-Request-MVO-Header
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pflegedienst-an-Leistungserbringer-MessageHeader"
Description: "Message Header von Pflegedienst an Leistungserbringer"
* insert HealthCareService-to-Practitioner(XSLT-Request-MVO-ServiceRequest)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage 
* responsible = Reference(Example-HealthCareService-Organization)

Instance: XSLT-Request-MVO-ServiceRequest
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initiale Rezeptanforderung"
Description: "Dieser ServiceRequest wird initial an den verschreibenden Leistungserbringer gesendet"
* identifier[requestId].value = "1"
* basedOn = Reference(XSLT-Request-MVO-Medication-Request)
* requisition.value = "XSLT-Request-MVO"
* status = RequestStatus#active
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* occurrenceDateTime = "2025-05-14T12:00:00+02:00"
* authoredOn = "2025-05-13"
* requester = Reference(Example-HealthCareService-Organization)

Instance: XSLT-Request-MVO-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #inline
* status = #active
* intent = #order
* modifierExtension[requestMVO].valueBoolean = true
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity
  * value = 1
  * unit = "Packung"