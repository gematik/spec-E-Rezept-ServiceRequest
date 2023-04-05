Profile: IdentifierRequestIdentifier
Parent: Identifier
Id: identifier-request-identifier
Title: "Identifier für einzelne ServiceRequest"
Description: "Dieser Identifier wird genutzt, um einen einzelnen ServiceRequest zu identifizieren"
* insert Meta (identifier-request-identifier)
* value 1..1 MS
  * ^short = "String, der den ServiceRequest eindeutig referenziert."
  * ^comment = "Es wird empfohlen eine UUID zu verwenden."
* system = "https://gematik.de/fhir/medreq/sid/NamingSystemRequestIdentifier" (exactly)