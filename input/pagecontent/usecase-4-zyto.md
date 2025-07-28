## Rezeptanforderungen für anwendungsfertige Zytostatika Zubereitungen

Diese Seite beschreibt die fachliche Beschreibung des Anwendungsfalls "Rezeptanforderung für anwendungsfertige Zytostatikazubereitungen". Für eine detaillierte Beschreibung dient das FeatureDokument "KIM-Nachrichten für das E-Rezept" ([Feature Dokument gemF_eRp_KIM](https://gemspec.gematik.de/docs/gemF/gemF_eRp_KIM/latest/)).

WICHTIG: Hierbei MUSS die Verordnung exakt der angefragten Medikation entsprechen. Diese Art der Anfrage wird über `MessageHeader.eventCode = #eRezept_ParenteraleZubereitung;*` kenntlich. Hierdurch MUSS im Primärsystem der verordnenden LEI der Hinweis gegeben werden, dass die zu verordnende nicht von der angefragten Medikation abweichen darf.

Der Arzt übernimmt die angefragte Medikation in die Verordnung und stellt diese im E-Rezept-Fachdienst ein. Darauf hin erhält der Arzt die Informationen für den E-Rezept Token und übermittelt den Token an die Apotheke.

Diese kann das Rezept am E-Rezept-Fachdienst einlösen.

### Hinweis zu Identifiern

Für diesen Fall gibt es Festlegungen zur Nutzung von Identifern im [Prescription Request](./StructureDefinition-erp-service-request-prescription-request.html), siehe [Festlegungen Identifier](./festlegungen-identifier.html).

## Anfrage an Verordnenden

Die Apotheke erstellt mittels Zytostatika-Programm oder Taxierungssoftware die notwendigen Informationen für die Rezeptanforderung zusammen, um sie dann einem verordnenden Leistungserbringer zu übermitteln.

Der verordnende LE stellt ein E-Rezept am E-Rezept-Fachdienst ein und überträgt den E-Rezept Token als Antwort an die anfragende Apotheke. Diese kann das E-Rezept am E-Rezept-Fachdienst einlösen.

<div class="gem-ig-svg-container" style="--box-width: 700px;">
    {% include UC4.svg %}
</div>

In der Rezeptanforderung sind medizinische Informationen zum angefragten Arzneimittel, wie auch administrative Informationen enthalten.
Die folgenden Beschreibungen liefern detailiierte Informationen, wie eine Rezeptanforderung zu befüllen und auszuführen ist.

### [1] Rezeptanforderung

Zum Erstellen müssen die in [Fachmodell Rezeptanforderung](./StructureDefinition-gem-erp-sr-log-prescription-request.html) aufgeführten fachlichen Informationen übertragen werden. Das Mapping stellt ebenfalls dar, in welchen Profilen die Informationen angegeben werden müssen.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im [Message Container](./StructureDefinition-erp-service-request-message-container.html) einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|[Message Header](./StructureDefinition-erp-service-request-request-header.html)|ERPServiceRequestMessageContainer.entry[0]||
|[Prescription Request](./StructureDefinition-erp-service-request-prescription-request.html)|ERPServiceRequestRequestHeader.focus||
|[Patient](./StructureDefinition-erp-service-request-patient.html)|ERPServiceRequestPrescriptionRequest.subject||
|[Organization](./StructureDefinition-erp-service-request-organization.html), |ERPServiceRequestPrescriptionRequest.requester||
|[Practitioner](./StructureDefinition-erp-service-request-practitioner.html) |ERPServiceRequestPrescriptionRequest.performer|x|
|[MedicationRequest](./StructureDefinition-erp-service-request-medication-request.html)|ERPServiceRequestPrescriptionRequest.basedOn||
|[KBV_PR_ERP_Medication_PZN](https://simplifier.net/erezept/kbvprerpmedicationpzn), [KBV_PR_ERP_Medication_Compounding](https://simplifier.net/erezept/kbvprerpmedicationcompounding), [KBV_PR_ERP_Medication_Ingredient](https://simplifier.net/erezept/kbvprerpmedicationingredient) oder [KBV_PR_ERP_Medication_FreeText](https://simplifier.net/erezept/kbvprerpmedicationfreetext)|ERPServiceRequestMedicationRequest.medication[x]||

Folgendes Klassendiagramm soll die verwendeten Profile graphisch darstellen:

<div class="gem-ig-svg-container" style="--box-width: 700px;">
    {% include Zyto_PrescriptionRequest_Class.svg %}
</div>


#### Wichtige Kennzeichnungen

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Rezeptanforderung seitens der Pflegeeinrichtung entspricht:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_ParenteraleZubereitung;Rezeptanfrage`|
|ERPServiceRequestPrescriptionRequest|.status = #active|
|ERPServiceRequestOrganization|.type.coding = #APO |

#### Angabe der Verordnungsinhalte

Die MedicationRequest Ressource ist nach Profil [MedicationRequest](./StructureDefinition-erp-service-request-medication-request.html) anzugeben.
Die Informationen zum Arzneimittel sind in der referenzierten Medication Ressource nachgehalten, die einem Profil der KBV_Medication entspricht.

### Stornierung - Verordnungsanfrage

Falls der Anfragende die Anfrage stornieren möchte, wird der gleiche ServiceRequest (.identifer:requestId muss gleich sein) erneut an den Verordnenden versendet. Folgende Bedingungen müssen erfüllt sein:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_ParenteraleZubereitung;Rezeptanfrage_Storno`|
|ERPServiceRequestPrescriptionRequest|.status = #entered-in-error |
|ERPServiceRequestPrescriptionRequest|.reasonCode Angabe des Stornierungsgrund |

Für die PDF Repräsentation der Anfrage werden außerdem die medizinischen Inhalte der ursprünglichen Verordnungsanfrage übertragen. Das empfangende System kann diese ignorieren.


### Ergebnis der Übertragung

Der Verordnende sollte mittels dieser Übertragung alle wesentlichen Informationen zur Verfügung haben, die er für das Ausstellen einer Verordnung benötigt:

* Daten des Patienten, für den die Verordnung erstellt werden soll
* Daten des Anfragenden, an den die Informationen übertragen werden sollen
* Daten zum angefragten Medikament, dass verordnet werden soll

Im Falle einer Stornierung sollte das sendende System den Eintrag als "storniert" gekennzeichnet haben. Das empfangende System kann eine unbearbeitete Anfrage löschen und muss sonst dem Verordnenden kenntlich machen, dass eine Stornierungsanfrage gesendet wurde. Falls ein E-Rezept erstellt wurde ist dieses vom Verordnenden zu löschen.

## Antwort des Verordnenden

### [4] Rezeptanforderung_Bestätigung

Der Verordnende kann nach dem Erhalt einer Rezeptanforderung diese prüfen und eine entsprechende Verordnung erstellen, signieren und im E-Rezept-Fachdienst einstellen (**[2]** und **[3]**).

Der Verordnende erhält in der Antwort vom Fachdienst die PrescriptionID und den AccessCode. Beide Informationen werden benötigt, damit die Apotheke das E-Rezept einlösen und zur Abrechnung bringen kann.

Zum Erstellen müssen die in [Rezeptanforderung_Bestätigung](./StructureDefinition-gem-erp-sr-log-prescription-request-confirmation.html) aufgeführten fachlichen Informationen übertragen werden. Das Mapping stellt ebenfalls dar, in welchen Profilen die Informationen angegeben werden müssen.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im [Message Container](./StructureDefinition-erp-service-request-message-container.html) einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|[Message Header](./StructureDefinition-erp-service-request-request-header.html)|ERPServiceRequestMessageContainer.entry[0]||
|[Prescription Request](./StructureDefinition-erp-service-request-prescription-request.html)|ERPServiceRequestRequestHeader.focus||
|[Patient](./StructureDefinition-erp-service-request-patient.html)|ERPServiceRequestPrescriptionRequest.subject||
|[Practitioner](./StructureDefinition-erp-service-request-practitioner.html)|ERPServiceRequestPrescriptionRequest.performer||
|[MedicationRequest](./StructureDefinition-erp-service-request-medication-request.html)|ERPServiceRequestPrescriptionRequest.basedOn||
|[KBV_PR_ERP_Medication_PZN](https://simplifier.net/erezept/kbvprerpmedicationpzn), [KBV_PR_ERP_Medication_Compounding](https://simplifier.net/erezept/kbvprerpmedicationcompounding), [KBV_PR_ERP_Medication_Ingredient](https://simplifier.net/erezept/kbvprerpmedicationingredient) oder [KBV_PR_ERP_Medication_FreeText](https://simplifier.net/erezept/kbvprerpmedicationfreetext)|ERPServiceRequestMedicationRequest.medication[x]||

Folgendes Klassendiagramm soll die verwendeten Profile graphisch darstellen:

<div class="gem-ig-svg-container" style="--box-width: 700px;">
    {% include Zyto_PrescriptionRequest_Confirmation_Class.svg %}
</div>


#### Wichtige Kennzeichnungen

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Rezeptanforderungs Bestätigung entspricht:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_ParenteraleZubereitung;Rezeptbestaetigung`|
|ERPServiceRequestPrescriptionRequest|.status = #completed|
|ERPServiceRequestPrescriptionRequest|.extension:EPrescriptionToken = `E-REzept Token`|


### Ablehnung - Verordnung

Falls der Verordnende die Anfrage ablehnen möchte, wird der gleiche ServiceRequest (.identifer:requestId muss gleich sein) an den Anfragenden zurück gesendet. Folgende Bedingungen müssen erfüllt sein:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Rezeptanfrage_Storno`|
|ERPServiceRequestPrescriptionRequest|.status = #revoked |
|ERPServiceRequestPrescriptionRequest|.reasonCode Angabe des Ablehnungsgrunds |

Für die PDF Repräsentation der Anfrage werden außerdem die medizinischen Inhalte der ursprünglichen Verordnungsanfrage übertragen. Diese sind vom PVS aus der initialen Anfrage zu übernehmen. Das empfangende System kann diese ignorieren.

### Ergebnis

Sobald das PVS die Anfrage bearbeitet hat, erhält die Apotheke nach Abschluss dieses Vorgangs das E-Rezept-Token am E-Rezept-Fachdienst und kann damit das E-Rezept einlösen und die Zubereitung abrechnen.

Falls der Verordnende die Anfrage abgelehnt hat, ist der Vorgang entsprechend im Apothekensystem zu markieren.

## Beispiele

Beispielhafte FHIR-Ressourcen sind auf der folgenden Seite [Beispiele](./artifacts.html#example-example-instances) verfügbar.