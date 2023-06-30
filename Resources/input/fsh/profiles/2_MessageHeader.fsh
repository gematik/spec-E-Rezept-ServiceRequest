Profile: ERPServiceRequestRequestHeader
Parent: $GEM_PR_ATF_MessageHeader
Id: erp-service-request-request-header
Title: "ERP Service Request Request Header"
Description: "Header containing information about the sender and addressee"
* insert Meta (erp-service-request-request-header)

* meta.profile 2..* MS
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "profile"
* meta.profile ^slicing.rules = #open

* meta.profile contains service-request-profile 1..1
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"

* focus MS
* focus only Reference(ERPServiceRequestPrescriptionRequest or ERPServiceRequestDispenseRequest)
  * ^short = "Specification of the ServiceRequest that contains the essential information for a given use case."
  * ^comment = "Since a request should address exactly one medication, a ServiceRequest must also be specified accordingly."
* eventCoding from ServiceIdentifierVS (required)
  * ^short = "The event code that indicates in which application and which transmission path the communication is currently taking place"
  * ^comment = "For more information see [ATF ImplementationGuide](https://simplifier.net/app-transport-framework/~guides)"
