Instance: XSLT-Prior-Prescription-ID-Bundle
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Prescription Request with changed Medication"
Description: "A prescription request which has a changed Medication in the Response"
* identifier.value = "urn:uuid:c881f35a-2463-4b0b-9164-0f7fc2e35136"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/XSLT-Prior-Prescription-ID-Header"
* entry[=].resource = XSLT-Prior-Prescription-ID-Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/XSLT-Prior-Prescription-ID-ServiceRequest"
* entry[=].resource = XSLT-Prior-Prescription-ID-ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/XSLT-Prior-Prescription-ID-Medication-Request"
* entry[=].resource = XSLT-Prior-Prescription-ID-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

Instance: XSLT-Prior-Prescription-ID-Header
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(XSLT-Prior-Prescription-ID-ServiceRequest)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage 
* responsible = Reference(Example-HealthCareService-Organization)

Instance: XSLT-Prior-Prescription-ID-ServiceRequest
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initial Prescription Request"
Description: "This ServiceRequest is sent initially to the prescribing practitioner"
* identifier[requestId].value = "1"
* basedOn = Reference(XSLT-Prior-Prescription-ID-Medication-Request)
* requisition.value = "XSLT-Prior-Prescription-ID"
* status = RequestStatus#active
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* occurrenceDateTime = "2025-05-14T12:00:00+02:00"
* authoredOn = "2025-05-13"
* requester = Reference(Example-HealthCareService-Organization)

Instance: XSLT-Prior-Prescription-ID-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #inline
* status = #active
* intent = #order
* extension[PriorPrescriptionID].valueIdentifier.value = "160.000.033.491.280.78"
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* dispenseRequest.quantity
  * value = 1
  * unit = "Packung"