# {{page-title}}

## Motivation und Hintergrund
Die gematik hat mit dem E-Rezept ein Produkt eingeführt, das zur Digitalisierung der Verordnung, Abgabe und Abrechnung von Rezepten beiträgt. Der gesamte Prozess der Verordnung wird über den zentralen E-Rezept-Fachdienst abgewickelt.

Dieses Feature zielt darauf ab, eine digitale und medienbruchfreie Kommunikation im Zusammenhang mit E-Rezepten zu ermöglichen, beispielsweise zur Anforderung von E-Rezepten.

Derzeit existiert kein strukturierter, dezentraler Kommunikationsweg für E-Rezepte. Diese Spezifikation soll sicherstellen, dass Leistungserbringer im deutschen Gesundheitswesen strukturierte Informationen über E-Rezepte austauschen können.

Ziel dieser Spezifikation ist es, den Versorgungsprozess für Leistungserbringer zu vereinfachen, zu automatisieren und dadurch zu beschleunigen.

## Grundlegendes Message Konzept - ATF
Im Folgenden werden grundlegende Merkmale und Konzepte beschrieben, die für die Umsetzung dieses Features wichtig sind.

Anwendungsfälle des Features "KIM-Nachrichten für das E-Rezept" werden nicht über einen zentralen Dienst der TI gelöst, sondern dezentral Peer-to-Peer zwischen Clients auf Basis von FHIR ausgeführt.

Daher handelt es sich grundlegend, aufbauend auf dem App-Transport-Framework (ATF) der gematik, um ein FHIR Message Konzept (https://www.hl7.org/fhir/messaging.html).

Aus dem App-Transport-Framework werden die Ressourcen "Bundle" und "MessageHeader" genutzt, um einerseits alle Ressourcen zu übermitteln, als auch Informationen über Sender und Empfänger zu halten. Die Funktionsweise und Implementierung des App-Transport-Framework sind im entsprechenden [Implementation Guide](https://simplifier.net/app-transport-framework/~guides) zu finden.

Dieser Implementation Guide basisiert auf Version ==X.X.X //TODO Version und Link!!== des App Transport Frameworks. Die folgende Stufe des ATF MUSS unterstützt werden, um konform zu diesem IG zu sein: 
**Stufe 1** - Datenmodell und Messaging Konzept MUSS unterstützt werden. Empfangsbestätigung und Capability-Message KANN unterstützt werden

### Verwendung von MessageBundle
Das im App Transport Framework definierte *MessageBundle* wird verwendet, um alle für die Anfrage relevanten Ressourcen zu übermitteln.

### Verwendung des MessageHeader
Der im App Transport Framework definierte *MessageHeader* dient zur Übertragung der Meta-Informationen, wie beispielsweise der Angabe von Absender und Empfänger.

#### EventCodes
In dieser Spezifikation dient der unter *MessageHeader.eventCode* anzugebende EventCode sowohl zur Identifikation des Anwendungsfalls als auch des Nachrichtentyps innerhalb des Anwendungsfalls. So zeigt der Code `eRezept_Rezeptanforderung;Rezeptanfrage` beispielsweise an, dass es sich um den Anwendungsfall "Rezeptanforderung" sowie um eine initiale "Rezeptanfrage" eines Anfragenden an einen Verordnenden handelt.

Die in dieser Spezifikation zulässigen EventCodes sind im [ValueSet](https://gematik.de/fhir/erp-servicerequest/ValueSet/service-identifier-vs) definiert.

Jeder im Implementierungsleitfaden beschriebene Anwendungsfall enthält eine Angabe darüber, welcher EventCode zu verwenden ist.

#### Relevante Ressourcen
Unter *MessageHeader.focus* werden die Ressourcen aufgelistet, die alle relevanten Informationen zu einer Anfrage bündeln. In diesem Projekt übernimmt die FHIR-Ressource *ServiceRequest* diese Funktion als Trägerressource. *MessageHeader.focus* listet alle *ServiceRequests* auf, die als Ausgangspunkt für die Auswertung der Anfragen in einer Nachricht dienen.

### Verwendung von ServiceRequests
Alle Anwendungsfälle in diesem Projekt basieren auf [ServiceRequest-Ressourcen](http://hl7.org/fhir/R4/servicerequest.html), die gemäß FHIR-Spezifikation verwendet werden, um einen Dienst bzw. eine Dienstleistung anzufragen. Der *ServiceRequest* dient dabei als Trägerressource für die auszutauschenden Informationen.

#### Anzahl der ServiceRequests
Jede Nachricht kann mehrere *ServiceRequest*-Ressourcen enthalten. Jede *ServiceRequest* besitzt eine eigene *requestID* und stellt somit eine separate Anfrage dar.

#### IDs in den ServiceRequests
Ein einzelner *ServiceRequest* bzw. eine einzelne Anfrage wird über `ServiceRequest.identifier:requestId` identifiziert. Über `ServiceRequest.requisition` können mehrere *ServiceRequests* mithilfe eines gemeinsamen Identifiers gebündelt werden, um z.B. Vorgänge mit mehreren Anfragen zusammenzufassen.

Folgende Service Requests und damit verbrundene Service Anfragen sind derzeit spezifiziert:
* {{pagelink:Implementation-Guide-KIM-Nachrichten-für-das-E-Rezept/Datenobjekte/Prescription_ServiceRequest}}
* {{pagelink:Implementation-Guide-KIM-Nachrichten-für-das-E-Rezept/Datenobjekte/Dispense_ServiceRequest}}

#### Status der Anfrage
Ein ServiceRequest spiegelt neben den fachlichen Informationen auch den Status des Vorgangs wieder. Über das Feld .status kann dargestellt werden, in welchem Zustand sich der Vorgang befindet:

| Status           | Bedeutung                                                |
| ---------------- | -------------------------------------------------------- |
| active           | Anfrage ist aktiv und muss noch bearbeitet werden        |
| revoked          | Anfrage wurde von der zu bearbeitenden Partei abgewiesen |
| completed        | Anfrage wurde von der zu bearbeitenden Partei erfüllt    |
| entered-in-error | Anfrage wurde von der anfragenden Partei storniert       |


## Beispiele
Beispielinstanzen sind im [Simplifier-Projekt](https://simplifier.net/erezept-servicerequest/~resources?category=Example&exampletype=Bundle&sortBy=RankScore_desc) zu finden.

Folgende UseCases sind mit entsprechenden Beispielen beschrieben:

* UC1: Rezeptanforderung durch Pflegeeinrichtung
* UC2: Rezeptanforderung der Pflegeeinrichtung mit Einlösung durch Patient
* UC3: Rezeptanforderung der heimversorgenden Apotheke
* UC4: Rezeptanforderung für anwendungsfertige Zytostatikazubereitungen

Die Beispiele tragen jeweils das Präfix zum entsprechenden UseCase und der entsprechenden Sequenz. Bsp: UC1-3-* ist ein Beispiel, was UC1 zugeordnet ist und den dritten Schritt in der Abfolge entspricht.
Für UC1 gibt es auch Beispiele für Stornierung und Ablehnung.