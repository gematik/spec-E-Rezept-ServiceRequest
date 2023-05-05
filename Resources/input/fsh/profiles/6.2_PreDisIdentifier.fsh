Profile: ERPServiceRequestPreDisIdentifier
Parent: Identifier
Id: erp-service-request-pre-dis-identifier
Title: "ERP Service Request Pre Dis Identifier"
Description: "Identifier wird genutzt, um einen Prescription und Dispense Requests der selben Rezeptanfrage zu verknüpfen"
* insert Meta (erp-service-request-pre-dis-identifier)
* value 1..1 MS
  * ^short = "String, der eine Verordnungs- und Belieferunsanfrage zu einem gleichen Medikament referenziert."
  * ^comment = "Es wird empfohlen eine UUID zu verwenden."
* system = "https://gematik.de/fhir/erp-servicerequest/sid/NamingSystemPreDisIdentifier"
