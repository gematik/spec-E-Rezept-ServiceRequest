## {{page-title}}

Als zentrales Element in einer Anfrage gelten in dieser Spezifikation ServiceRequests. Diese Bündeln die Informationen für eine konkrete Anfrage an einen anderen Leistungserbringer. Folgende Begriffe werden in diesem IG für diesen ServiceRequests genutzt:

* ServiceRequest meint den Request als Basisprofil von HL7
* ERPServiceRequestDispenseRequest meint konkret dieses Profil in diesem Projekt
* Belieferungsanfrage ist der fachliche Begriff für dieses Profil

Der ERPServiceRequestDispenseRequest ist eine Anfrage zur Belieferung eines Präparates an eine ausliefernde Apotheke. Alle für die Apotheke relevanten Informationen sind in diesem ServiceRequest vorzuhalten, bzw. zu referenzieren.

Die Identifikation als ERPServiceRequestDispenseRequest (Belieferungsanfrage) wird über .code.coding.code = #dispense-request angegeben.
