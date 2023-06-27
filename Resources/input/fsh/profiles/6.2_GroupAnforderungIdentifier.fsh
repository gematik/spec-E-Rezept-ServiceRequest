Profile: ERPServiceRequestProcedureIdentifier
Parent: Identifier
Id: identifier-procedure-identifier
Title: "ERP Service Request Procedure Identifier"
Description: "This identifier is used to identify service requests of a process"
* insert Meta (identifier-procedure-identifier)
* value 1..1 MS
  * ^short = "String that uniquely references an operation."
  * ^comment = "It is recommended to use a UUID."
* system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemProcedureIdentifier"
