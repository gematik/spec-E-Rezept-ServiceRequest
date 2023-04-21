Profile: IdentifierPreDisIdentifier
Parent: Identifier
Id: identifier-pre-dis-identifier
Title: "Prescription und Dispense Request Identifier"
Description: "Identifier wird genutzt, um einen Prescription und Dispense Requests der selben Rezeptanfrage zu verknüpfen"
* insert Meta (identifier-pre-dis-identifier)
* value 1..1 MS
  * ^short = "String, der eine Verordnungs- und Belieferunsanfrage zu einem gleichen Medikament referenziert."
  * ^comment = "Es wird empfohlen eine UUID zu verwenden."
* system = "https://gematik.de/fhir/medreq/sid/NamingSystemPreDisIdentifier"