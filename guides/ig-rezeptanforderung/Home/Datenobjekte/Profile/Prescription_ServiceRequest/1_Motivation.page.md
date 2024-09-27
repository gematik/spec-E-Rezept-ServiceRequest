## {{page-title}}

Als zentrales Element in einer Anfrage gelten in dieser Spezifikation ServiceRequests. Diese Bündeln die Informationen für eine konkrete Anfrage an einen anderen Leistungserbringer. Folgende Begriffe werden in diesem IG für diesen ServiceRequests genutzt:

* ServiceRequest meint den Request als Basisprofil von HL7
* ERPServiceRequestPrescriptionRequest meint konkret dieses Profil in diesem Projekt
* Verordnungsanfrage ist der fachliche Begriff für dieses Profil

Der ERPServiceRequestPrescriptionRequest ist eine Anfrage zum Ausstellen einer Verordnung an einen Arzt. Alle für den Arzt relevanten Informationen zum Ausstellen einer entsprechenden Verordnung sind hier aufgeführt, bzw. referenziert.

Die Identifikation als ERPServiceRequestPrescriptionRequest (Verordnungsanfrage) wird über .code.coding.code = #prescription-request angegeben.
