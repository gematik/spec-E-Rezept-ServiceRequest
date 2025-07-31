Instance: XSLT-Changed-Medication-Bundle
InstanceOf: ERPServiceRequestMessageContainer
Usage: #example
Title: "Rezeptanforderung mit geänderter Medikation"
Description: "Eine Rezeptanforderung mit geänderter Medikation in der Antwort"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp = "2025-05-14T08:15:12+02:00"
// Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MessageHeader/XSLT-Changed-Medication-Header"
* entry[=].resource = XSLT-Changed-Medication-Header
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Organization/Example-Practitioner-Organization"
* entry[=].resource = Example-Practitioner-Organization

// ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/ServiceRequest/XSLT-Changed-Medication-ServiceRequest"
* entry[=].resource = XSLT-Changed-Medication-ServiceRequest
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Patient/Example-Patient"
* entry[=].resource = Example-Patient

//Medication Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/MedicationRequest/Example-Response-Medication-Request"
* entry[=].resource = Example-Response-Medication-Request
* entry[+].fullUrl = "http://erp-servicerequest-test.de/Medication/Example-Response-Medication"
* entry[=].resource = Example-Response-Medication

Instance: XSLT-Changed-Medication-Header
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pflegedienst-an-Leistungserbringer-MessageHeader"
Description: "Message Header von Pflegedienst an Leistungserbringer"
* insert Practitioner-to-HealthCareService(XSLT-Changed-Medication-ServiceRequest)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptbestaetigung
* responsible = Reference(Example-Practitioner-Organization)

Instance: XSLT-Changed-Medication-ServiceRequest
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #inline
Title: "Initiale Rezeptanforderung"
Description: "Dieser ServiceRequest wird initial an den verschreibenden Leistungserbringer gesendet"
* identifier[requestId].value = "1"
* requisition.value = "XSLT-Changed-Medication"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* modifierExtension[medicationChanged].valueBoolean = true
* status = RequestStatus#completed
* basedOn = Reference(Example-Response-Medication-Request)
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* intent = RequestIntent#order
* performer.identifier = Hans-Topp-Glücklich-Identifier
* code.coding[request-type] = ServiceRequestTypeCS#prescription-request