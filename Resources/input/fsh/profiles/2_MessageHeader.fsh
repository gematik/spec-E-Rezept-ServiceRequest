Profile: ERPServiceRequestRequestHeader
Parent: $GEM_PR_ATF_MessageHeader
Id: erp-service-request-request-header
Title: "ERP Service Request Request Header"
Description: "Header containing information about the sender and addressee"
* insert Meta (erp-service-request-request-header)

* focus MS
* focus only Reference(ERPServiceRequestPrescriptionRequest or ERPServiceRequestDispenseRequest)
  * ^short = "Specification of the ServiceRequest that contains the essential information for a given use case."
  * ^comment = "One Message can contain multiple ServiceRequests which each are identified with an ID."
* eventCoding from ServiceIdentifierVS (required)
  * ^short = "The event code that indicates in which application and which transmission path the communication is currently taking place"
  * ^comment = "For more information see [ATF ImplementationGuide](https://simplifier.net/app-transport-framework/~guides)"
