Profile: ERPServiceRequestRequestHeader
Parent: $GEM_PR_ATF_MessageHeader
Id: erp-service-request-request-header
Title: "ERP Service Request Request Header"
Description: "Header, welcher Informationen über Absender und Adressat enthält"
* insert Meta (erp-service-request-request-header)
* focus MS
* focus only Reference(ERPServiceRequestPrescriptionRequest or ServiceRequestDispenseRequest)
  * ^short = "Angabe des ServiceRequests, der die wesentlichen Informationen zu einem gegebenen Anwendungsfall enthält."
  * ^comment = "Da eine Anfrage genau eine Medikation adressieren soll, ist auch entsprechend ein ServiceRequest anzugeben."
* eventCoding from ServiceIdentifierVS (required)
  * ^short = "Der EventCode, der angibt in welchem Anwendungsfall und welchem Übertragungsweg die Kommunikation gerade geschieht"
  * ^comment = "Für weitere Informationen siehe [ATF-ImplementationGuide](https://simplifier.net/app-transport-framework/~guides)"
