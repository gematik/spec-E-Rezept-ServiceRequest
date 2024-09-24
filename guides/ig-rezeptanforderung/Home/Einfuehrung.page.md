# {{page-title}}

## Allgemeine Beschreibung

Die gematik hat mit dem E-Rezept ein Produkt eingeführt, das zur Digitalisierung der Verordnung, Abgabe und Abrechnung von Rezepten beiträgt. Der gesamte Prozess der Verordnung wird über den zentralen E-Rezept-Fachdienst abgewickelt.

Dieses Feature zielt darauf ab, eine digitale und medienbruchfreie Kommunikation im Zusammenhang mit E-Rezepten zu ermöglichen, beispielsweise zur Anforderung von E-Rezepten.

Derzeit existiert kein strukturierter, dezentraler Kommunikationsweg für E-Rezepte. Diese Spezifikation soll sicherstellen, dass Leistungserbringer im deutschen Gesundheitswesen strukturierte Informationen über E-Rezepte austauschen können.

Ziel dieser Spezifikation ist es, den Versorgungsprozess für Leistungserbringer zu vereinfachen, zu automatisieren und dadurch zu beschleunigen.

Das Feature "KIM-Nachrichten für das E-Rezept" ermöglicht es, Nachrichten im Kontext des E-Rezepts ohne Beteiligung des Fachdienstes zwischen den beteiligten Akteuren zu initiieren, zu versenden und zu empfangen. 

Die Übermittlung erfolgt als strukturierte FHIR-Bundles unter Verwendung der TI-Anwendung "Kommunikation im Medizinwesen" (KIM) als gesichertes Übermittlungsverfahren.

## Relevante Dokumente

### Feature-Dokument
Dem vorliegenden Implementation Guide (IG) liegt das Featuredokument gemF_eRp_KIM zugrunde, welches im Fachportal oder auf [gemSpecPages](https://gemspec.gematik.de/) verfügbar ist. Das Dokument definiert die Anforderungen, User Stories und fachlichen Anwendungsfälle und bildet die Grundlage für diesen IG.

### FHIR-IG
Dieser Implementation Guide bietet eine Einführung in das Thema sowie detaillierte technische Anweisungen zur Umsetzung der Anwendungsfälle aus dem Featuredokument. Dabei werden die fachlichen Datenmodelle, relevanten Profile und deren Anwendung beschrieben.

## Zugrundeliegendes Konzept

Grundlegend handelt es sich aufbauend auf dem App-Transport-Framework der gematik um ein [FHIR Message Konzept](https://www.hl7.org/fhir/messaging.html).

Aus dem App-Transport-Framework werden die Ressourcen "Bundle" und "MessageHeader" genutzt, um einerseits alle Ressourcen zu übermitteln, als auch Informationen über Sender und Empfänger zu halten. Die Funktionsweise und Implementierung des App-Transport-Framework sind im entsprechenden [Implementation Guide](https://simplifier.net/app-transport-framework/~guides) zu finden.


### Verwendung von EventCodes (MessageHeader.eventCode)

In dieser Spezifikation dient der unter MessageHeader.eventCode anzugebende EventCode sowohl zur Identifikation des Anwendungsfalls als auch des Nachrichtentyps innerhalb des Anwendungsfalls. So zeigt der Code eRezept_Rezeptanforderung;Rezeptanfrage beispielsweise an, dass es sich um den Anwendungsfall "Rezeptanforderung" sowie um eine initiale "Rezeptanfrage" eines Anfragenden an einen Verordnenden handelt.

Die in dieser Spezifikation zulässigen EventCodes sind im ValueSet {{link:https://gematik.de/fhir/erp-servicerequest/ValueSet/service-identifier-vs}} definiert.
Jeder im Implementierungsleitfaden beschriebene Anwendungsfall enthält eine Angabe darüber, welcher EventCode zu verwenden ist.

### Verwendung von ServiceRequests (MessageHeader.focus)

Unter MessageHeader.focus werden die Ressourcen aufgelistet, die alle relevanten Informationen zu einer Anfrage bündeln. In diesem Projekt übernimmt die FHIR-Ressource ServiceRequest diese Funktion als Trägerressource. MessageHeader.focus referenziert alle ServiceRequests, die als Ausgangspunkt für die Auswertung der Anfragen in einer Nachricht dienen. Es können je Nachricht auch mehrere ServiceRequest Ressourcen übermittelt werden. Jede ServiceRequest Ressource stellt damit ein Angefordertes Medikament dar.

Folgende Service Requests und damit verbundene Service Anfragen sind derzeit spezifiziert:

* {{pagelink:Home/Datenobjekte/Prescription_ServiceRequest}}
* {{pagelink:Home/Datenobjekte/Dispense_ServiceRequest}}


#### Status der Anfrage

Ein ServiceRequest spiegelt neben den fachlichen Informationen auch den Status des Vorgangs wieder. Über das Feld .status kann dargestellt werden, in welchem Zustand sich der Vorgang befindet:

| Status           | Bedeutung                                                |
| ---------------- | -------------------------------------------------------- |
| active           | Anfrage ist aktiv und muss noch bearbeitet werden        |
| revoked          | Anfrage wurde von der zu bearbeitenden Partei abgelehnt  |
| completed        | Anfrage wurde von der zu bearbeitenden Partei erfüllt    |
| entered-in-error | Anfrage wurde von der anfragenden Partei storniert       |


### Allgemeine Festlegungen

#### Anzahl von E-Rezepten pro Nachricht

In jedem Prozess, in dem ein E-Rezept bearbeitet werden soll, kann eine Nachricht ein oder mehrere E-Rezepte adressieren. Die späteren Beschreibungen zu den Use Cases werden dies im Detail beschreiben.

Wie oben beschrieben, werden im Feld `MessageHeader.focus` alle ServiceRequests referenziert, die im Bundle enthalten sind. Jeder ServiceRequest entspricht genau einer Anfrage für eine Medikation.

## Beispiele

Beispielinstanzen sind im [Simplifier-Projekt](https://simplifier.net/erezept-servicerequest/~resources?category=Example&exampletype=Bundle&sortBy=RankScore_desc) zu finden.

Folgende UseCases sind mit entsprechenden Beispielen beschrieben:

* UC1: Rezeptanforderung durch Pflegeeinrichtung
* UC2: Rezeptanforderung der Pflegeeinrichtung mit Einlösung durch Patient 
* UC3: Rezeptanforderung der heimversorgenden Apotheke
* UC4: Rezeptanforderung für anwendungsfertige Zytostatikazubereitungen

Die Beispiele tragen jeweils das Präfix zum entsprechenden UseCase und der entsprechenden Sequenz. Bsp: UC1-3-* ist ein Beispiel, was UC1 zugeordnet ist und den dritten Schritt in der Abfolge entspricht.

Für UC1 gibt es auch Storno- und Ablehnungsbeispiele.
