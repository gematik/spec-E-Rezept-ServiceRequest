## {{page-title}}

Als zentrales Element in einer Anfrage gelten in dieser Spezifikation ServiceRequests. Diese Bündeln die Informationen für eine konkrete Anfrage an einen anderen Leistungserbringer.

Der ServiceRequestClearingRequest ist eine Anfrage zur Klärung eines Rezepts mit dem verordnenden Arzt. Alle für die den Verordnenden relevanten Informationen sind in diesem ServiceRequest vorzuhalten, bzw. zu referenzieren.

Die Identifikation als ServiceRequestClearingRequest (Klärungsanfrage) wird über .code.coding.code = #clearing-request angegeben.
