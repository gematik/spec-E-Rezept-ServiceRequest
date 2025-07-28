Profile: ERPServiceRequestProcedureIdentifier
Parent: Identifier
Id: erp-service-request-procedure-identifier
Title: "ERP Service Request Procedure Identifier"
Description: """
Identifiziert einen Fall, der mehrere ServiceRequests verknüpfen kann. Wenn bspw. für einen Versicherten mehrere Arzneimittel angefragt werden, kann in diesen ServiceRequests die gleiche identifier in `.requisition` angegeben werden.
Der Wert wird vom Anfragenden generiert und muss bei einer Antwort angegeben werden.
"""
* insert Meta (erp-service-request-procedure-identifier)
* value 1..1 MS
  * ^short = "String that uniquely references an operation."
  * ^comment = "It is recommended to use a UUID."
* system 1..1 MS
* system = "https://gematik.de/fhir/erp-servicerequest/sid/ProcedureIdentifier"
