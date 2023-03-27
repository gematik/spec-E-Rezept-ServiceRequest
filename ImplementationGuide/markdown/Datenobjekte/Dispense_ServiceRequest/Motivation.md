## Motivation

Als zentrales Element in einer Anfrage gelten in dieser Spezifikation ServiceRequests. Diese Bündeln die Informationen für eine konkrete Anfrage an einen anderen Leistungserbringer.

Der Dispense_ServiceRequest ist eine Anfrage zur Belieferung eines Präparates an eine ausliefernde Apotheke. Alle für die Apotheke relevanten Informationen sind in diesem ServiceRequest vorzuhalten, bzw. zu referenzieren.

Die Identifikation als Dispense_ServiceRequest (Belieferungsanfrage) wird über .code.coding.code = #dispense-request angegeben.