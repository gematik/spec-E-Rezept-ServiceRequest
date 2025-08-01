Instance: XSLT-Redeem-By-Patient-Bundle
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Rezeptanforderung zur Patienteneinlösung"
Description: "Eine Rezeptanforderung zur Einlösung durch den Patienten"
* identifier.value = "urn:uuid:c881f35a-2463-4b0b-9164-0f7fc2e35136"
* timestamp = "2025-05-13T14:25:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/XSLT-Redeem-By-Patient-Header"
* entry[=].resource = XSLT-Redeem-By-Patient-Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-HealthCareService-Organization"
* entry[=].resource = Example-HealthCareService-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/XSLT-Redeem-By-Patient-ServiceRequest"
* entry[=].resource = XSLT-Redeem-By-Patient-ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[=].resource = Example-Initial-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Initial-Medication"
* entry[=].resource = Example-Initial-Medication

Instance: XSLT-Redeem-By-Patient-Header
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pflegedienst-an-Leistungserbringer-MessageHeader"
Description: "Message Header von Pflegedienst an Leistungserbringer"
* insert HealthCareService-to-Practitioner(XSLT-Redeem-By-Patient-ServiceRequest)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage 
* responsible = Reference(Example-HealthCareService-Organization)

Instance: XSLT-Redeem-By-Patient-ServiceRequest
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initiale Rezeptanforderung"
Description: "Dieser ServiceRequest wird initial an den verschreibenden Leistungserbringer gesendet"
* identifier[requestId].value = "1"
* modifierExtension[redeemByPatient].valueBoolean = true
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "XSLT-Redeem-By-Patient"
* status = RequestStatus#active
* intent = RequestIntent#order
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* occurrenceDateTime = "2025-05-14T12:00:00+02:00"
* authoredOn = "2025-05-13"
* requester = Reference(Example-HealthCareService-Organization)