Profile: ERPServiceRequestProcedureIdentifier
Parent: Identifier
Id: identifier-procedure-identifier
Title: "ERP Service Request Procedure Identifier"
Description: "Dieser Identifier wird genutzt, ServiceRequests eines Vorgangs zu identifizieren"
* insert Meta (identifier-procedure-identifier)
* value 1..1 MS
  * ^short = "String, der einen Vorgang eindeutig referenziert."
  * ^comment = "Es wird empfohlen eine UUID zu verwenden."
* system = "https://gematik.de/fhir/medreq/sid/NamingSystemProcedureIdentifier"
