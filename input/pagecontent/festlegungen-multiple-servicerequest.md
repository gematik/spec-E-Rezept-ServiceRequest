## Der MessageHeader

Generell basiert der Nachrichtenaustausch auf dem **Messaging Bundle**. Ein solches Bundle wird verwendet, um eine oder mehrere Rezeptanforderungen zu übermitteln. Dabei enthält das Bundle als ersten Eintrag den **MessageHeader**, welcher die Metadaten der Nachricht enthält.

Der **MessageHeader** ist eine spezielle FHIR-Ressource, die verwendet wird, um Informationen zum Nachrichtenaustausch zu beschreiben. Dieser enthält:

- Den **Sender** und **Empfänger** der Nachricht.
- Einen **Event-Code**, der den spezifischen Anwendungsfall der Nachricht identifiziert.
- Das Feld `focus`. Dieses Feld enthält Referenzen auf die entsprechenden **ServiceRequest**-Ressourcen, die die eigentlichen Rezeptanforderungen abbilden.

## Identifikation von Rezeptanforderungen

Die zentrale Ressource, die eine Rezeptanforderung wiedergibt, ist die **ServiceRequest**-Ressource. Diese Ressource repräsentiert die eigentliche Anforderung und referenziert alle relevanten Informationen, wie Patientendaten, Verordnende/r und weitere Details.

### Identifizieren und Gruppieren von Anfragen
Wenn mehrere Anfragen gestellt werden, handelt es sich meist um den selben Vorgang. Um diese Zusammengehörigkeit zu kennzeichnen, soll der [Request Procedure Identifier](./StructureDefinition-erp-service-request-procedure-identifier.html) in `ServiceRequest.requisition` genutzt werden.

Dieser Identifier ermöglicht es, mehrere ServiceRequests zu einer gemeinsamen Anforderung zu gruppieren. So kann ein identischer requisition-Wert in mehreren ServiceRequest-Objekten verwendet werden, um zu signalisieren, dass diese Anfragen zusammengehören.

## Referenzen auf gemeinsame Ressourcen
Bei der Übermittlung von mehreren ServiceRequests in einer Nachricht ist zu beachten, dass jede Anfrage (Rezeptanforderung) durch einen eigenen ServiceRequest repräsentiert wird. Jedoch können mehrere ServiceRequests auf dieselben Ressourcen verweisen. Zum Beispiel:

Wenn drei Rezeptanforderungen für denselben Patienten gestellt werden, gibt es im Bundle drei separate ServiceRequest-Ressourcen, die jeweils eine eigene Anforderung darstellen.
Diese drei ServiceRequests können jedoch alle auf dieselbe Patient-Ressource verweisen. In diesem Fall wird der Patient nur einmal im Bundle enthalten sein, obwohl mehrere ServiceRequests diese Ressource referenzieren.

## Beispielhafter Nachrichtenaufbau mit zwei Rezeptanforderungen

Eine Nachricht, die z.B. zwei Rezeptanforderungen enthält, hat folgenden Aufbau:

- **Genau einen MessageHeader**: Dieser beschreibt den Nachrichtentyp und die beteiligten Systeme.
- **Genau zwei Referenzen in `MessageHeader.focus`**: Diese verweisen auf zwei **ServiceRequest**-Objekte.
- **Weitere Ressourcen im Bundle**: Ressourcen wie `Patient`, `Practitioner`, etc., die von den ServiceRequests referenziert werden, sind ebenfalls Teil des Bundles. Diese Ressourcen dienen als ergänzende Informationen zu den ServiceRequests.

## Verarbeitung der Nachricht

Ein empfangendes System sollte den **MessageHeader** auslesen und dabei folgende Schritte beachten:

1. **Auslesen des Feldes `focus`**: Überprüfen, wie viele Rezeptanforderungen (also ServiceRequest-Objekte) referenziert sind.
2. **ServiceRequests verarbeiten**: Jeder **ServiceRequest** enthält alle Informationen zu einer einzelnen Rezeptanforderung. Dabei kann der ServiceRequest weitere Ressourcen referenzieren, die zum vollständigen Verständnis der Anforderung erforderlich sind (wie z.B. Patient, Practitioner, usw.).

Jede **ServiceRequest**-Ressource agiert also als eine Art "Trägerressource", die alle relevanten Informationen für eine Rezeptanforderung enthält.

## Zusammenfassung der Nachricht

Eine Nachricht enthält:

- **1:n** Rezeptanforderungen in der Form von ServiceRequests.
- Jede Rezeptanforderung bezieht sich auf genau **eine Rezeptanforderung** in Form von MedicationRequest, der über `ServiceRequest.basedOn` referenziert wird.

**Hinweis**: Mehrere **ServiceRequests** innerhalb einer Nachricht können denselben Identifier unter `ServiceRequest.requisition` haben. Diese Identifier können verwendet werden, um mehrere ServiceRequests einer einzelnen "Anfrage" zuzuordnen.

**Hinweis**: Wenn ein Arzt mehrere Anfragen bekommt und einzelne davon ablehnen möchte ist das auf grundlage des einzelnen ServiceRequests möglich. Bestätigte ServiceRequest erhalten den Status `#completed` und abgelehnte Anfragen den Status `#revoked`.

## Beispiele

Beispielhaft sollen stark vereinfacht zwei Szenarien als Klassendiagramm dargestellt werden, die die Kardinalitäten und Beziehungen in einem Bundle ausdrücken.

### Anfrage mehrerer Rezepte für einen Patienten
å
Zunächst kann z.B. für einen Patienten mehrere Rezepte angefordert werden. Damit können jeweils ein ServiceRequest (Rezeptanforderung) erstellt werden. Diese können auf die gleiche Patienten -Ressource referenzieren.

<div class="gem-ig-svg-container" style="--box-width: 700px;">
    {% include multiple-request-diagram-1.svg %}
</div>

### Anfrage des Selben Medikaments für mehrere Patienten
Weiterhin ist auch denkbar, dass exakt die gleiche Medikation für mehrere Patienten angefragt wird. In diesem Fall kann die MedicationRequest-Ressource mehrfach verwendet werden.

<div class="gem-ig-svg-container" style="--box-width: 700px;">
    {% include multiple-request-diagram-2.svg %}
</div>

Hierüber hinaus sind auch Kombinationen denkbar.