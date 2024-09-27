# {{page-title}}

In diesem Anwendungsfall initiiert ein Anfragender (z.B. eine Pflegeeinrichtung) den Prozess, indem er eine Rezeptanfrage an einen verordnenden Arzt stellt. Der Arzt bearbeitet die Anfrage und erstellt ein E-Rezept. Nach der Erstellung des E-Rezepts erhält der Verordnende die Informationen "PrescriptionID" und "AccessCode" vom E-Rezept-Fachdienst und kann damit einen E-Rezept-Token generieren.

Der verordnende Leistungserbringer übermittelt den E-Rezept-Token anschließend an die Pflegeeinrichtung.

Die Pflegeeinrichtung sendet daraufhin eine Anfrage zur Belieferung der Verordnung an die ausgewählte Apotheke. Diese kann mithilfe der Informationen aus dem E-Rezept-Token das E-Rezept vom E-Rezept-Fachdienst abrufen und die Pflegeeinrichtung mit der entsprechenden Medikation beliefern.

## Anfrage an den Verordnenden stellen

Im ersten Schritt stellt die Pflegeeinrichtung eine Rezeptanforderung an einen verordnenden Leistungserbringer. Der verordnende LE stellt ein E-Rezept am E-Rezept-Fachdienst ein und überträgt den E-Rezept Token als Antwort an die Pflegeeinrichtung.
{{render:guides/ig-rezeptanforderung/images/puml_images/UC1_1.png}}

In der Rezeptanforderung sind medizinische Informationen zum angefragten Arzneimittel, wie auch administrative Informationen enthalten.
Die folgenden Beschreibungen liefern detailiierte Informationen, wie eine Rezeptanforderung zu befüllen und auszuführen ist.

### [1] Rezeptanforderung

#### Fachliches Mapping
Die Rezeptanforderung enthält im wesentlichen folgende Informationen:
* MetaDaten zur Nachricht
* Involvierte Parteien
* Angaben zur Medikation
* Weitere Informationen

Das Mapping dieser fachlichen Informationen aus dem Logical Model zu den konkreten Profilen kann unter {{pagelink:Implementation-Guide-KIM-Nachrichten-für-das-E-Rezept/Mappings/Mapping-für-Rezeptanforderung.page.md}} eingesehen werden.

Entsprechend der Informationen und Kardinalitäten sind die Profile zu befüllen.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im {{link:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container}} einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|{{pagelink:Home/Datenobjekte/MessageHeader}}|ERPServiceRequestMessageContainer.entry[0]||
|{{pagelink:Home/Datenobjekte/Prescription_ServiceRequest}}|ERPServiceRequestRequestHeader.focus||
|{{pagelink:Home/Datenobjekte/Patient}}|ERPServiceRequestPrescriptionRequest.subject||
|{{pagelink:Home/Datenobjekte/Organization}}, |ERPServiceRequestPrescriptionRequest.requester||
|{{pagelink:Home/Datenobjekte/Practitioner}} |ERPServiceRequestPrescriptionRequest.performer|x|
|{{pagelink:Home/Datenobjekte/Medication_Request}}|ERPServiceRequestPrescriptionRequest.basedOn||
|[KBV_PR_ERP_Medication_PZN](https://simplifier.net/erezept/kbvprerpmedicationpzn), [KBV_PR_ERP_Medication_Compounding](https://simplifier.net/erezept/kbvprerpmedicationcompounding), [KBV_PR_ERP_Medication_Ingredient](https://simplifier.net/erezept/kbvprerpmedicationingredient), [KBV_PR_ERP_Medication_FreeText](https://simplifier.net/erezept/kbvprerpmedicationfreetext)|ERPServiceRequestMedicationRequest.medication[x]||

Folgendes Klassendiagramm soll die verwendeten Profile graphisch darstellen:
{{render:guides/ig-rezeptanforderung/images/puml_images/PrescriptionRequest_Class.png}}

#### Voraussetzungen

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Rezeptanforderung entspricht:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Rezeptanfrage`|
|ERPServiceRequestPrescriptionRequest|.status = #active|
|ERPServiceRequestPrescriptionRequest|.requester.type = #PFL \| #APO|

Folgende FHIR-Constraints wurden für das Profil `ERPServiceRequestPrescriptionRequest` im Rahmen einer Rezeptanforderung gesetzt:

@```
from
	StructureDefinition
where
	name = 'ERPServiceRequestPrescriptionRequest'
for differential.element where constraint.exists()
select
    'Feld': id,
    join for constraint.where(expression.startsWith('status = \'active\'')) select { Condition: human }
```

Über `ServiceRequest.reasonCode` und `ServiceRequest.reasonReference` kann angegeben werden, warum die Medikation angefragt wird.

#### Angabe der Verordnungsinhalte

Die MedicationRequest Ressource ist nach Profil {{pagelink:Home/Datenobjekte/MedicationRequest}} anzugeben.
Zur Behandlung von gesonderten Fällen kann in der MedicationRequest Ressource folgendes gesetzt werden: 

|Feld|Bedeutung|
|---|---|
|.extension:PriorPrescriptionID|Angabe einer vorherigen Task ID auf die sich die Anfrage bezieht|
|.extension:requestMVO.extension:Kennzeichen|Angabe, ob der Anfragende die Ausstellung des E-Rezeptes im Rahmen einer Mehrfachverordnung wünscht|
|.extension:redeemByPatient|Angabe, ob die angefragte Verordnung durch den Versicherten eingelöst werden soll. Hier muss der verordnende das E-Rezept mit Workflow 160/169 erstellen.|
|.dispenseRequest.quantity|Angabe der gewünschten Packungsmenge des Arzneimittels|

### Stornierung - Verordnungsanfrage

**MessageHeader.eventCode:** #eRezept_Rezeptanforderung;Rezeptanfrage_Storno

Falls der Anfragende die Anfrage stornieren möchte, wird der gleiche ServiceRequest (.identifer:requestId muss gleich sein) erneut an den Verordnenden versendet und

* .status = #entered-in-error

angegeben. Hierzu kann ebenfalls ein Grund unter `ServiceRequest.reasonCode` angegeben werden.

### Ergebnis der Übertragung

Im Falle der erfolgreichen Übertragung sollte der Verordnende alle wesentlichen Informationen zur Verfügung haben, die er für das Ausstellen einer Verordnung benötigt:

* Daten des Patienten, für den die Verordnung erstellt werden soll
* Daten des Anfragenden, an den die Informationen übertragen werden sollen
* Daten zum angefragten Medikament, dass verordnet werden soll
* Optional der Grund und/ oder die Reichweite der aktuellen Medikation


## Antwort des Verordnenden an die Anfragenden

### [4] Rezeptanforderung_Bestätigung

Der Verordnende kann nach dem Erhalt einer Rezeptanforderung diese prüfen und eine entsprechende Verordnung erstellen, signieren und im E-Rezept-Fachdienst einstellen (**[2]**).

Der Verordnende erhält in der Antwort vom Fachdienst die PrescriptionID und den AccessCode (**[3]**). Beide Informationen werden benötigt, um ein E-Rezept in einer Apotheke einzulösen.

#### Fachliches Mapping
Die Rezeptanforderung_Bestätigung enthält im wesentlichen folgende Informationen:
* MetaDaten zur Nachricht
* Weitere Informationen

Das Mapping dieser fachlichen Informationen aus dem Logical Model zu den konkreten Profilen kann unter {{pagelink:Implementation-Guide-KIM-Nachrichten-für-das-E-Rezept/Mappings/Mapping-für-Rezeptanforderung-Bestaetigung.page.md}} eingesehen werden.

Entsprechend der Informationen und Kardinalitäten sind die Profile zu befüllen.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im {{link:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container}} einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|{{pagelink:Home/Datenobjekte/MessageHeader}}|ERPServiceRequestMessageContainer.entry[0]||
|{{pagelink:Home/Datenobjekte/Prescription_ServiceRequest}}|ERPServiceRequestRequestHeader.focus||
|{{pagelink:Home/Datenobjekte/Patient}}|ERPServiceRequestPrescriptionRequest.subject||
|{{pagelink:Home/Datenobjekte/Practitioner}}|ERPServiceRequestPrescriptionRequest.performer||
|{{pagelink:Home/Datenobjekte/Medication_Request}}|ERPServiceRequestPrescriptionRequest.basedOn||
|[KBV_PR_ERP_Medication_PZN](https://simplifier.net/erezept/kbvprerpmedicationpzn), [KBV_PR_ERP_Medication_Compounding](https://simplifier.net/erezept/kbvprerpmedicationcompounding), [KBV_PR_ERP_Medication_Ingredient](https://simplifier.net/erezept/kbvprerpmedicationingredient), [KBV_PR_ERP_Medication_FreeText](https://simplifier.net/erezept/kbvprerpmedicationfreetext)|ERPServiceRequestMedicationRequest.medication[x]||

Folgendes Klassendiagramm soll die verwendeten Profile graphisch darstellen:
{{render:guides/ig-rezeptanforderung/images/puml_images/PrescriptionRequest_Confirmation_Class.png}}

#### Voraussetzungen

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Rezeptanforderungs Bestätigung entspricht:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Rezeptbestaetigung`|
|ERPServiceRequestPrescriptionRequest|.status = #completed|
|ERPServiceRequestPrescriptionRequest|.extension:EPrescriptionToken = <E-Rezept Token>|

Folgende FHIR-Constraints wurden für das Profil `ERPServiceRequestPrescriptionRequest` im Rahmen einer Rezeptanforderung gesetzt:

@```
from
	StructureDefinition
where
	name = 'ERPServiceRequestPrescriptionRequest'
for differential.element where constraint.exists()
select
    'Feld': id,
    join for constraint.where(expression.startsWith('status = \'completed\'')) select { Condition: human }
```

### Ablehnung - Verordnung

**MessageHeader.eventCode:** #eRezept_Rezeptanforderung;Rezeptanfrage_Storno

Der Verordnende kann das Ausstellen der Verordnung auch ablehnen. Hierbei ist `ServiceRequest.status` auf `#revoked` zu setzen und ein Grund unter `ServiceRequest.reasonCode` auszuwählen und anzugeben. Es kann auch `ServiceRequest.note` genutzt werden, um weitere Hinweise zu geben, warum die Anfrage storniert wurde.

### Ergebnis

Sobald das PVS die Anfrage bearbeitet und eine Antwort an die Pflegeeinrichtung versendet hat, ist der Vorgang für den Verordnenden beendet.

Die Pflegeeinrichtung hat nun die Information, dass die Anfrage bearbeitet wurde und den E-Rezept Token. Nun kann eine Abgabeanfrage an eine Apotheke versendet werden.
