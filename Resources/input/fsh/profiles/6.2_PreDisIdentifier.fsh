Profile: ERPServiceRequestPreDisIdentifier
Parent: Identifier
Id: erp-service-request-pre-dis-identifier
Title: "ERP Service Request Pre Dis Identifier"
Description: "Identifier is used to link a prescription and dispense requests of the same prescription request"
* insert Meta (erp-service-request-pre-dis-identifier)
* value 1..1 MS
  * ^short = "String that references a prescription and delivery request for the same drug."
  * ^comment = "It is recommended to use a UUID."
* system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier"
