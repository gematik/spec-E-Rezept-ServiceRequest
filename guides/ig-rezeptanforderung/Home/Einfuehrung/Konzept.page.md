## {{page:title}}


### Message Konzept
Aus dem App-Transport-Framework werden die Ressourcen "Bundle" und "MessageHeader" genutzt, um einerseits alle Ressourcen zu übermitteln, als auch Informationen über Sender und Empfänger zu halten.
Die EventCodes, die für MessageHeader.eventCode zulässig sind, ergeben sich aus dem ValueSet {{link:https://simplifier.net/erezept-medicationrequest-communication/gem-pr-medreq-kim-dienstkennung}}. Der EventCode gibt sowohl den Anwendungsfall, sowie auch die jeweilige Anfrage innerhalb eines Anwendungsfalles an.

In der folgenden Tabelle sind die zu verwendenden Codes aufgelistet:

@```

from GEM_PR_MEDREQ_KIM_Dienstkennung
select compose.include.concept

```

## Informations Konzept

Grundlegend basieren alle Anwendungsfälle in diesem Projekt auf [Service-Request Ressourcen](http://hl7.org/fhir/R4/servicerequest.html). Dies soll eine Anfrage an einen anderen Leistungserbringer (LE) widerspiegeln. Derzeit sind zwei Service Requests in diesem Projekt abgebildet:

* Prescription_ServiceRequest {{pagelink:prescription_servicerequest}} (Dient der Anfrage zum Ausstellen einer Verordnung)
* Dispense_ServiceRequest {{pagelink:dispense_servicerequest}} (Dient der Anfrage zum Beliefern einer Verordnung)

Dieser ServiceRequest bildet ähnlich wie die Task Ressource im E-Rezept die Trägerressource über die alle relevanten Informationen für den Vorgang referenziert werden. Daher wird jeder ServiceRequest, der sich im Bundle befindet, unter MessageHeader.focus referenziert.
Dieser ServiceRequest soll stets weitergereicht und mit Informationen angereichert werden.

### Zuordnung von Anfrage und Angefragtem Präparat

ServiceRequest.basedOn referenziert die angefragte Medikation. Für den Fall, dass eine Medikation angefragt wird ist das Profil (GEM PR ERP MEDREQ Medication Request) zu verwenden, der Arzt kann dann in der Antwort die vollständige Verordnung hinterlegen (KBV_PR_ERP_Prescription).

Ein ServiceRequest soll dabei immer genau eine Verordnung beinhalten, bzw. referenzieren. Für jedes einzelne Präparat ist also ein ServiceRequest zu erstellen. Daher ist die Kardinalität für ServiceRequest.basedOn ..1.

### Status der Anfrage
Ein ServiceRequest spiegelt neben den fachlichen Informationen auch den Status des Vorgangs wieder. Über das Feld .status kann dargestellt werden, in welchem Zustand sich der Vorgang befindet.
|Status|Bedeutung|
|---|---|
|active|Anfrage ist aktiv und muss noch bearbeitet werden|
|revoked|Anfrage wurde von der zu bearbeitenden Partei abgewiesen|
|completed|Anfrage wurde von der zu bearbeitenden Partei erfüllt|
|entered-in-error|Anfrage wurde von der anfragenden Partei storniert|


## Allgemeine Festlegungen

### Anzahl von E-Rezepten pro Nachricht

In jedem Prozess, in dem ein E-Rezept bearbeitet werden soll, soll eine Nachricht genau ein E-Rezept adressieren. Die späteren Beschreibungen zu den Use Cases werden dies im Detail beschreiben. Diese Festlegung soll die Komplexität reduzieren und die Implementierung vereinfachen.

### Verwendung von ID's

Folgende ID's zur Zuordnung sind zu verwenden.

| Feld | Verwendung |
|---|---|
|ServiceRequest.identifier:requestID | Referenziert eindeutig einen einzelnen ServiceRequest. |
|ServiceRequest.identifier:predisId | ID, die einen Prescription_ und Dispense_ServiceRequest verbinden, die jeweils die gleiche Verordnung referenzieren |
|ServiceRequest.requisition | VorgangsID, die sich über mehrere ServiceRequests erstreckt. Hier ist bei einem Vorgang, in dem mehrere Verordnungen angefragt werden allen ServiceRequests die selbe ID zu vergeben. |

Anwendungsfälle können weitere Vorgaben zu ID's unter ServiceRequest.identifier enthalten. Diese sind in der entsprechenden Beschreibung zu finden.

## Anwendungsfälle

Mit den in diesem Projekt bereitgestellten Profilen sollen folgende Anwendungsfälle abgebildet werden können:

* {{pagelink:usecase_rezeptanforderung}}
  * UC1: Verordnungs- und Dispensierungsanfrage durch den Pflegedienst
  * UC2: Dispensierungsanfrage durch den Arzt
  * UC3: Verordnungsanfrage durch den Pflegedienst, Patient löst Rezept selbst ein
* {{pagelink:usecase_parenterale_zubereitung}}
  * UC4: Parenterale Zubereitung
* {{pagelink:usecase_forward_dispense}}
  * UC5: Weitergabe eines Rezeptes zwischen Apotheken