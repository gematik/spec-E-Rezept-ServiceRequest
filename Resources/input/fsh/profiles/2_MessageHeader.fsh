Profile: MessageHeaderRequestHeader
Parent: $GEM_PR_ATF_MessageHeader
Id: message-header-request-header
Title: "Nachrichten Header"
Description: "Header, welcher Informationen über Absender und Adressat enthält"
* insert Meta (message-header-request-header)
* focus MS
* focus only Reference(ServiceRequestPrescriptionRequest or ServiceRequestDispenseRequest)
  * ^short = "Angabe des ServiceRequests, der die wesentlichen Informationen zu einem gegebenen Anwendungsfall enthält."
  * ^comment = "Da eine Anfrage genau eine Medikation adressieren soll, ist auch entsprechend ein ServiceRequest anzugeben."
* eventCoding from ServiceIdentifierVS (required)
  * ^short = "Der EventCode, der angibt in welchem Anwendungsfall und welchem Übertragungsweg die Kommunikation gerade geschieht"
  * ^comment = "Für weitere Informationen siehe [ATF-ImplementationGuide](https://simplifier.net/app-transport-framework/~guides)"
