## Einführung

### Motivation und Hintergrund
Die gematik hat mit dem E-Rezept ein Produkt eingeführt, das zur Digitalisierung der Verordnung, Abgabe und Abrechnung von Rezepten beiträgt. Der gesamte Prozess der Verordnung wird über den zentralen E-Rezept-Fachdienst abgewickelt.

Dieses Feature zielt darauf ab, eine digitale und medienbruchfreie Kommunikation im Zusammenhang mit E-Rezepten zu ermöglichen, beispielsweise zur Anforderung von E-Rezepten.

Derzeit existiert kein strukturierter, dezentraler Kommunikationsweg für E-Rezepte. Diese Spezifikation soll sicherstellen, dass Leistungserbringer im deutschen Gesundheitswesen strukturierte Informationen über E-Rezepte austauschen können.

Ziel dieser Spezifikation ist es, den Versorgungsprozess für Leistungserbringer zu vereinfachen, zu automatisieren und dadurch zu beschleunigen.

### Grundlegendes Message Konzept - ATF
Im Folgenden werden grundlegende Merkmale und Konzepte beschrieben, die für die Umsetzung dieses Features wichtig sind.

Anwendungsfälle des Features "KIM-Nachrichten für das E-Rezept" werden nicht über einen zentralen Dienst der TI gelöst, sondern dezentral Peer-to-Peer zwischen Clients auf Basis von FHIR ausgeführt.
Daher handelt es sich grundlegend, aufbauend auf dem App-Transport-Framework (ATF) der gematik, um ein FHIR Message Konzept (https://www.hl7.org/fhir/messaging.html).
Aus dem App-Transport-Framework werden die Ressourcen "Bundle" und "MessageHeader" genutzt, um einerseits alle Ressourcen zu übermitteln, als auch Informationen über Sender und Empfänger zu halten. Die Funktionsweise und Implementierung des App-Transport-Framework sind im entsprechenden [Implementation Guide](https://simplifier.net/app-transport-framework/~guides) zu finden.

Dieser Implementation Guide basiert auf Version 1.4.0 des App Transport Frameworks. Die folgende Stufe des ATF MUSS unterstützt werden, um konform zu diesem IG zu sein:

**Stufe 1** 
- Datenmodell und Messaging Konzept MUSS unterstützt werden
- Empfangsbestätigung und Capability-Message KANN unterstützt werden

##### EventCodes
In dieser Spezifikation dient der unter *MessageHeader.eventCode* anzugebende EventCode sowohl zur Identifikation des Anwendungsfalls als auch des Nachrichtentyps innerhalb des Anwendungsfalls. So zeigt der Code `eRezept_Rezeptanforderung;Rezeptanfrage` beispielsweise an, dass es sich um den Anwendungsfall "Rezeptanforderung" sowie um eine initiale Rezeptanforderung eines Anfragenden an einen Verordnenden handelt.

Die in dieser Spezifikation zulässigen EventCodes sind im [ServiceIdentifierVS](./ValueSet-service-identifier-vs.html) definiert.

Jeder im Implementierungsleitfaden beschriebene Anwendungsfall enthält eine Angabe darüber, welcher EventCode zu verwenden ist.

##### Relevante Ressourcen
Unter *MessageHeader.focus* werden die Ressourcen aufgelistet, die alle relevanten Informationen zu einer Anfrage bündeln. In diesem Projekt übernimmt die FHIR-Ressource *ServiceRequest* diese Funktion als Trägerressource. *MessageHeader.focus* listet alle *ServiceRequests* auf, die als Ausgangspunkt für die Auswertung der Anfragen in einer Nachricht dienen.

#### Verwendung von ServiceRequests
Alle Anwendungsfälle in diesem Projekt basieren auf [ServiceRequest-Ressourcen](http://hl7.org/fhir/R4/servicerequest.html), die gemäß FHIR-Spezifikation verwendet werden, um einen Dienst bzw. eine Dienstleistung anzufragen. Der *ServiceRequest* dient dabei als Trägerressource für die auszutauschenden Informationen.

##### Anzahl der ServiceRequests
Jede Nachricht kann mehrere *ServiceRequest*-Ressourcen enthalten. Jede *ServiceRequest* besitzt eine eigene *requestID* und stellt somit eine separate Anfrage dar. Eine detaillierte Beschreibung und Darstellungen sind unter [Mehrere Anfragen](./festlegungen-multiple-servicerequest.html) einzusehen.

##### IDs in den ServiceRequests
Ein einzelner *ServiceRequest* bzw. eine einzelne Anfrage wird über `ServiceRequest.identifier:requestId` identifiziert. Über `ServiceRequest.requisition` können mehrere *ServiceRequests* mithilfe eines gemeinsamen Identifiers gebündelt werden, um z.B. Vorgänge mit mehreren Anfragen zusammenzufassen.
HINWEIS: Unter [Identifier](./festlegungen-identifier.html) sind weitere vorgaben zu Identifiern getroffen worden.

Folgende Service Requests und damit verbundene Service Anfragen sind derzeit spezifiziert:
* [ERPServiceRequestPrescriptionRequest](./StructureDefinition-erp-service-request-prescription-request.html)
* [ERPServiceRequestDispenseRequest](./StructureDefinition-erp-service-request-dispense-request.html)

##### Status der Anfrage
Ein ServiceRequest spiegelt neben den fachlichen Informationen auch den Status des Vorgangs wieder. Über das Feld .status kann dargestellt werden, in welchem Zustand sich der Vorgang befindet:

| Status           | Bedeutung                                                |
| ---------------- | -------------------------------------------------------- |
| active           | Anfrage ist aktiv und muss noch bearbeitet werden        |
| entered-in-error | Anfrage wurde vom Anfragenden storniert       |
| revoked          | Anfrage wurde vom Verordnenden abgelehnt  |
| completed        | Anfrage wurde von der zu bearbeitenden Partei erfüllt    |

### Visuelle Darstellung
Die in diesem Projekt erzeugten Ressourcen lassen sich mit einem XSLT-Stylesheet in ein HTML überführen, um sie für Anwender sichtbar zu machen. Notwendigkeit und Voraussetzungen sind im [Featuredokument gemF_eRp_KIM](https://gemspec.gematik.de/docs/gemF/gemF_eRp_KIM/latest/) beschrieben.
Das Stylesheet findet sich im GitHub Repository: [XSLT-Stylesheet](https://github.com/gematik/spec-E-Rezept-ServiceRequest/tree/master/Resources/xslt-stylesheets).

### Beispiele
Beispielinstanzen sind unter [Beispiele](./examples.html) zu finden.

Folgende UseCases sind mit entsprechenden Beispielen beschrieben:

* UC1: Rezeptanforderung durch Pflegeeinrichtung
* UC2: Rezeptanforderung der Pflegeeinrichtung mit Einlösung durch Patient
* UC3: Rezeptanforderung der heimversorgenden Apotheke
* UC4: Rezeptanforderung für anwendungsfertige Zytostatikazubereitungen

Die Beispiele tragen jeweils das Präfix zum entsprechenden UseCase und der entsprechenden Sequenz. Bsp: UC1-3-* ist ein Beispiel, was UC1 zugeordnet ist und den dritten Schritt in der Abfolge entspricht.
Für UC1 gibt es auch Beispiele für Stornierung und Ablehnung.

HINWEIS: Die Beispiele, die in dieser Spezifikation auf Simplifier vorhanden sind verwenden URL-Referenzen. Dies dient der Anschaulichkeit und dem Nachvollziehen von Ressourcen und Referenzen. Für den produktiven Einsatz sollten absolute Referenzen mit UUID's verwendet werden: "urn:uuid:e615aa46-30f3-4d3f-b3f1-3274ad314b5c".

### Veranschaulichung am Demonstrator

Die folgenden Videos demonstrieren die Anwendungsfälle aus Sicht der Akteure der in diesem IG aufgeführten Akteure.

#### Rezeptanforderungen im ambulanten Pflegedienst

Im folgenden wird der Anwendungsfall "Rezeptanforderung durch Pflegeeinrichtung" am Demonstrator veranschaulicht.

<iframe width="1280" height="720" src="https://www.youtube.com/embed/ibP9gmvdIgo?si=-KlkXbqSQ9brOdg-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

#### Rezeptanforderungen der heimversorgenden Apotheke

Im folgenden wird der Anwendungsfall "Rezeptanforderung der heimversorgenden Apotheke" am Demonstrator veranschaulicht.

<iframe width="1280" height="720" src="https://www.youtube.com/embed/GmM0tghWLKw?si=SmkWJIod__jjxN0F" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>