Profile: ERPServiceRequestRequestIdentifier
Parent: Identifier
Id: erp-service-request-request-identifier
Title: "ERP Service Request Request Identifier"
Description: "This identifier is used to identify a single ServiceRequest"
* insert Meta (erp-service-request-request-identifier)
* value 1..1 MS
  * ^short = "String that uniquely references the ServiceRequest."
  * ^comment = "It is recommended to use a UUID."
* system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier" (exactly)
