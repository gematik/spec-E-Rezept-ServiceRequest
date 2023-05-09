Profile: ERPServiceRequestRequestIdentifier
Parent: Identifier
Id: erp-service-request-request-identifier
Title: "ERP Service Request Request Identifier"
Description: "Dieser Identifier wird genutzt, um einen einzelnen ServiceRequest zu identifizieren"
* insert Meta (erp-service-request-request-identifier)
* value 1..1 MS
  * ^short = "String, der den ServiceRequest eindeutig referenziert."
  * ^comment = "Es wird empfohlen eine UUID zu verwenden."
* system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemRequestIdentifier" (exactly)
