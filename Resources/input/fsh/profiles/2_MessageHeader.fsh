Profile: ERPServiceRequestRequestHeader
Parent: MessageHeaderAppTransportFramework
Id: erp-service-request-request-header
Title: "ERP Service Request Request Header"
Description: "Header containing information about the sender and addressee"
* insert Meta (erp-service-request-request-header)

* sender
  * identifier only IdentifierTelematikId
* destination
  * receiver
    * identifier only IdentifierTelematikId

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
