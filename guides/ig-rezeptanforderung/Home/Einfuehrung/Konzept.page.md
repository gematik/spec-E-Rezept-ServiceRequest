## {{page-title}}

### Message Konzept

Grundlegend handelt es sich aufbauend auf dem App-Transport-Framework der gematik um ein FHIR Message Konzept (https://www.hl7.org/fhir/messaging.html).

Aus dem App-Transport-Framework werden die Ressourcen "Bundle" und "MessageHeader" genutzt, um einerseits alle Ressourcen zu übermitteln, als auch Informationen über Sender und Empfänger zu halten. Die Funktionsweise und Implementierung des App-Transport-Framework sind im entsprechenden [Implementation Guide](https://simplifier.net/app-transport-framework/~guides) zu finden.

### Verwendung von EventCodes (MessageHeader.eventCode)

In dieser Spezifikation dient der EventCode sowohl der Identifikation des Anwendungsfalles, sowie des Transportweges innerhalb des Anwendungsfalls. So gibt z.B. der Code `eRezept_Rezeptanforderung;Rezeptanfrage` an, dass es sich um den Anwendungsfall "Rezeptanforderung", sowie über eine initiale "Rezeptanfrage" eines Anfragenden an einen Verordnenden handelt.
Die für diese Spezifikation zulässigen EventCodes sind in {{link:https://gematik.de/fhir/erpmedreqcom/ValueSet/kim-dienstkennung-vs}} aufgelistet und beschrieben.

Die in diesem Implementierungsleitfaden beschriebenen Anwendungsfälle enthalten jeweils auch eine Angabe, welcher EventCode zu nutzen ist.

### Verwendung von ServiceRequests (MessageHeader.focus)

Grundlegend basieren alle Anwendungsfälle in diesem Projekt auf [Service-Request Ressourcen](http://hl7.org/fhir/R4/servicerequest.html), die nach FHIR-Spezifikation dazu dienen einen Dienst anzufragen. Dieser Service Request dient als Trägerressource für Informationen, die ausgetauscht werden. Diese Informationen werden entweder im Service Request angegeben oder referenziert.

Folgende Service Requests und damit verbrundene Service Anfragen sind derzeit spezifiziert:

* Prescription_ServiceRequest {{pagelink:Home/Datenobjekte/Prescription_ServiceRequest}} (Dient der Anfrage zum Ausstellen einer Verordnung)
* Dispense_ServiceRequest {{pagelink:Home/Datenobjekte/Dispense_ServiceRequest}} (Dient der Anfrage zum Beliefern einer Verordnung)

Da ein Service Request alle Informationen zum Verarbeiten einer Anfrage bündelt, wird dieser unter MessageHeader.focus referenziert.
Ein Service Request soll in einem Anwendungsfall nur ein mal generiert und anschließend nur weitergereicht und mit Informationen angereichert werden.

#### Status der Anfrage

Ein ServiceRequest spiegelt neben den fachlichen Informationen auch den Status des Vorgangs wieder. Über das Feld .status kann dargestellt werden, in welchem Zustand sich der Vorgang befindet:

|Status|Bedeutung|
|---|---|
|active|Anfrage ist aktiv und muss noch bearbeitet werden|
|revoked|Anfrage wurde von der zu bearbeitenden Partei abgewiesen|
|completed|Anfrage wurde von der zu bearbeitenden Partei erfüllt|
|entered-in-error|Anfrage wurde von der anfragenden Partei storniert|

### Allgemeine Festlegungen

#### Anzahl von E-Rezepten pro Nachricht

In jedem Prozess, in dem ein E-Rezept bearbeitet werden soll, soll eine Nachricht genau ein E-Rezept adressieren. Die späteren Beschreibungen zu den Use Cases werden dies im Detail beschreiben. Diese Festlegung soll die Komplexität reduzieren und die Implementierung vereinfachen.

#### Zuordnung von Anfrage und Angefragtem Präparat

ServiceRequest.basedOn referenziert die zu behandelnde Medikation, bzw. Rezeptanfrage, gibt also an, auf welche medizinische Information sie der Service Request bezieht.

Ein Service Request soll dabei immer auf genau eine medizinsiche Information beziehen. Wenn also z.B. ein Rezept angefragt wird, dann referenziert ServiceRequest.basedOn genau einen MedicationRequest. So ist für jeden MedicationRequest also ein ServiceRequest zu erstellen. Entsprechend ist die Kardinalität für ServiceRequest.basedOn ..1.

Somit enthält eine KIM-Nachricht einen ServiceRequest mit einem MedicationRequest.
