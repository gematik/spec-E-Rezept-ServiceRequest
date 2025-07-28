Profile: ERPServiceRequestRequestIdentifier
Parent: Identifier
Id: erp-service-request-request-identifier
Title: "ERP Service Request Request Identifier"
Description: """
Eine eindeutige Anfrage ID, die eine konkrete Anfrage referenziert. Dieser Wert wird erzeugt, wenn ein Anfragender initial den ServiceRequest erstellt. 
Systeme, die einen ServiceRequest auswerten und bearbeiten müssen bei Antworten den Identifier wieder mit angeben.
"""
* insert Meta (erp-service-request-request-identifier)
* value 1..1 MS
  * ^short = "String that uniquely references the ServiceRequest."
  * ^comment = "It is recommended to use a UUID."
* system 1..1 MS
* system = "https://gematik.de/fhir/erp-servicerequest/sid/RequestIdentifier"
