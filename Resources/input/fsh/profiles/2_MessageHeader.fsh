Profile: ERPServiceRequestRequestHeader
Parent: $GEM_PR_ATF_MessageHeader
Id: erp-service-request-request-header
Title: "ERP Service Request Request Header"
Description: "Header containing information about the sender and addressee"
* insert Meta (erp-service-request-request-header)

* extension 0..1 MS
* extension contains
    CopyToCareFacilityEX named CopyToCareFacility 0..1 MS ?!
* extension[CopyToCareFacility]
  * ^short = "The contact details of the care facility that receives a copy of the request."

  //TODO: überlegen ob sender.reference auch 1..1 sein soll für die XSLTs

* responsible 1..1 MS
* responsible only Reference(ERPServiceRequestOrganization)
  * ^short = "The organization that is responsible for the request."
  * ^comment = "This organization will be stated in the message header as the sender of the message."

* focus MS
* focus only Reference(ERPServiceRequestPrescriptionRequest or ERPServiceRequestDispenseRequest or ERPServiceRequestMessageContainer)
  * ^short = "Specification of the ServiceRequest that contains the essential information for a given use case."
  * ^comment = "One Message can contain multiple ServiceRequests which each are identified with an ID."
* eventCoding from ServiceIdentifierVS (required)
  * ^short = "The event code that indicates in which application and which transmission path the communication is currently taking place"
  * ^comment = "For more information see [ATF ImplementationGuide](https://simplifier.net/app-transport-framework/~guides)"

Invariant: service-request-message-header-1
Description: "If the eventCode is message-copy then the focus must be a Bundle, otherwise a ServiceRequest."
Expression: "(event.coding.code = 'message-copy' implies focus.resolve().is(Bundle)) and (event.coding.code != 'message-copy' implies focus.resolve().is(ServiceRequest))" //TODO: Testen
Severity: #error

//TODO if eventCode is Storno then ServiceRequest.status = revoked ODER entered-in-error
