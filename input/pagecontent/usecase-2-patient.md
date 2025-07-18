# Rezeptanforderung für Patient

In diesem Anwendungsfall initiiert eine Pflegeeinrichtung den Prozess, indem sie eine Rezeptanfrage an einen verordnenden Arzt stellt. In dieser Anfrage ist angegeben, dass die Verordnung vom Patienten eingelöst werden soll.

Der Arzt bearbeitet die Anfrage und erstellt ein E-Rezept mit Flowtype 160/200, damit der Versicherte das E-Rezept selbst einlösen kann.
Nach der Erstellung des E-Rezepts erhält der Verordnende die Informationen "PrescriptionID" und "AccessCode" vom E-Rezept-Fachdienst und kann damit einen E-Rezept-Token generieren.

Der verordnende Leistungserbringer übermittelt den E-Rezept-Token, sowie den Patientenausdruck als PDF (s. [Feature Dokument gemF_eRp_KIM](https://gemspec.gematik.de/docs/gemF/gemF_eRp_KIM/latest/)) anschließend an die Pflegeeinrichtung.

Die Pflegeeinrichtung kann den Patienten informieren, dass das E-Rezept in einer Apotheke eingelöst werden kann und gibt ggf. den Patientenausdruck mit.

## Anfragender an Verordnenden

In diesem Anwendungsfall erstellt die Pflegeeinrichtung im Namen des Patienten eine Rezeptanforderung mit der Kennzeichnung zur Patienteneinlösung an einen verordnenden Leistungserbringer. Der verordnende LE stellt ein E-Rezept am E-Rezept-Fachdienst ein. Der E-Rezept Token wird in diesem Anwendungsfall nicht an die Pflegeeinrichtung übertragen. Die Pflegeeinrichtung kann optional den Versicherten über die Ausstellung des E-Rezeptes informieren.
Die Pflegeeinrichtung kann optional den Versicherten über die Ausstellung des E-Rezeptes informieren.

{{render:guides/ig-rezeptanforderung/images/puml_images/UC2.png}}

In der Rezeptanforderung sind medizinische Informationen zum angefragten Arzneimittel, wie auch administrative Informationen enthalten.
Die folgenden Beschreibungen liefern detailiierte Informationen, wie eine Rezeptanforderung zu befüllen und auszuführen ist.

### [1] Rezeptanforderung

Zum erstellen müssen die in {{pagelink:Home/Datenobjekte/Mappings/mapping_definitions/Mapping-für-Rezeptanforderung.page.md}} aufgeführten fachlichen Informationen übertragen werden. Das Mapping stellt ebenfalls dar, in welchen Profilen die Informationen angegeben werden müssen.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im {{link:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container}} einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-request-header.page.md}}|ERPServiceRequestMessageContainer.entry[0]||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-prescription-request.page.md}}|ERPServiceRequestRequestHeader.focus||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-patient.page.md}}|ERPServiceRequestPrescriptionRequest.subject||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-organization.page.md}}, |ERPServiceRequestPrescriptionRequest.requester||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-practitioner.page.md}} |ERPServiceRequestPrescriptionRequest.performer|x|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}}|ERPServiceRequestPrescriptionRequest.basedOn||
|[KBV_PR_ERP_Medication_PZN](https://simplifier.net/erezept/kbvprerpmedicationpzn), [KBV_PR_ERP_Medication_Compounding](https://simplifier.net/erezept/kbvprerpmedicationcompounding), [KBV_PR_ERP_Medication_Ingredient](https://simplifier.net/erezept/kbvprerpmedicationingredient) oder [KBV_PR_ERP_Medication_FreeText](https://simplifier.net/erezept/kbvprerpmedicationfreetext)|ERPServiceRequestMedicationRequest.medication[x]||

Folgendes Klassendiagramm soll die verwendeten Profile graphisch darstellen:
{{render:guides/ig-rezeptanforderung/images/puml_images/PrescriptionRequest_Class.png}}

#### Wichtige Kennzeichnungen

Folgende Bedingungen müssen erfüllt und Felder gesetzt sein, damit die Nachricht einer Rezeptanforderung, die zur Patienteneinlösung vorgesehen ist, entspricht:
|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Rezeptanfrage`|
|ERPServiceRequestPrescriptionRequest|.status = #active|
|ERPServiceRequestOrganization|.type.coding = #PFL|
|ERPServiceRequestMedicationRequest|.extension:redeemByPatient = **true**|

Über `ServiceRequest.reasonCode` und `ServiceRequest.reasonReference` kann angegeben werden, warum die Medikation angefragt wird.

#### Angabe der Verordnungsinhalte

Die MedicationRequest Ressource ist nach Profil {{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}} anzugeben.
Zur Behandlung von gesonderten Fällen kann in der MedicationRequest Ressource folgendes gesetzt werden: 

|Profil|Feld|Bedeutung|
|---|---|---|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-prescription-request.page.md}}|.extension:redeemByPatient|Angabe, ob die angefragte Verordnung durch den Versicherten eingelöst werden soll. In diesem Anwendungsfall ist die Angabe `true` zu machen. Damit ist der Flowtype des E-Rezepts 160/200.|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}}|.extension:PriorPrescriptionID|Angabe einer vorherigen Task ID auf die sich die Anfrage bezieht|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}}|.extension:requestMVO.extension:Kennzeichen|Angabe, ob der Anfragende die Ausstellung des E-Rezeptes im Rahmen einer Mehrfachverordnung wünscht|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}}|.dispenseRequest.quantity|Angabe der gewünschten Packungsmenge des Arzneimittels|

### Stornierung - Verordnungsanfrage

Falls der Anfragende die Anfrage stornieren möchte, wird der gleiche ServiceRequest (.identifer:requestId muss gleich sein) erneut an den Verordnenden versendet. Folgende Bedingungen müssen erfüllt sein:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Rezeptanfrage_Storno`|
|ERPServiceRequestPrescriptionRequest|.status = #entered-in-error |
|ERPServiceRequestPrescriptionRequest|.reasonCode Angabe des Stornierungsgrund |

Für die PDF Repräsentation der Anfrage werden außerdem die medizinischen Inhalte der ursprünglichen Verordnungsanfrage übertragen. Das empfangende System kann diese ignorieren.

### Ergebnis der Übertragung

Im Falle der erfolgreichen Übertragung sollte der Verordnende alle wesentlichen Informationen zur Verfügung haben, die er für das Ausstellen einer Verordnung benötigt:

* Daten des Patienten, für den die Verordnung erstellt werden soll
* Daten des Anfragenden, an den die Informationen übertragen werden sollen
* Daten zum angefragten Medikament, dass verordnet werden soll
* Optional der Grund und/ oder die Reichweite der aktuellen Medikation

Im Falle einer Stornierung sollte das sendende System den Eintrag als "storniert" gekennzeichnet haben. Das empfangende System kann eine unbearbeitete Anfrage löschen und muss sonst dem Verordnenden kenntlich machen, dass eine Stornierungsanfrage gesendet wurde. Falls ein E-Rezept erstellt wurde ist dieses vom Verordnenden zu löschen.

## Antwort des Verordnenden

### [4] Rezeptanforderung_Bestätigung

Der Verordnende kann nach dem Erhalt einer Rezeptanforderung diese prüfen und eine entsprechende Verordnung erstellen, signieren und im E-Rezept-Fachdienst einstellen (**[2]**).

Der Verordnende erhält in der Antwort vom Fachdienst die PrescriptionID und den AccessCode. Beide Informationen werden benötigt, um ein E-Rezept in einer Apotheke einzulösen.

Zum Erstellen müssen die in {{pagelink:Home/Datenobjekte/Mappings/mapping_definitions/Mapping-für-Rezeptanforderung_Bestaetigung.page.md}} aufgeführten fachlichen Informationen übertragen werden. Das Mapping stellt ebenfalls dar, in welchen Profilen die Informationen angegeben werden müssen.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im {{link:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container}} einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-request-header.page.md}}|ERPServiceRequestMessageContainer.entry[0]||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-prescription-request.page.md}}|ERPServiceRequestRequestHeader.focus||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-patient.page.md}}|ERPServiceRequestPrescriptionRequest.subject||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-practitioner.page.md}}|ERPServiceRequestPrescriptionRequest.performer||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}}|ERPServiceRequestPrescriptionRequest.basedOn||
|[KBV_PR_ERP_Medication_PZN](https://simplifier.net/erezept/kbvprerpmedicationpzn), [KBV_PR_ERP_Medication_Compounding](https://simplifier.net/erezept/kbvprerpmedicationcompounding), [KBV_PR_ERP_Medication_Ingredient](https://simplifier.net/erezept/kbvprerpmedicationingredient) oder [KBV_PR_ERP_Medication_FreeText](https://simplifier.net/erezept/kbvprerpmedicationfreetext)|ERPServiceRequestMedicationRequest.medication[x]||

Folgendes Klassendiagramm soll die verwendeten Profile graphisch darstellen:
{{render:guides/ig-rezeptanforderung/images/puml_images/PrescriptionRequest_Confirmation_Class.png}}

#### Wichtige Kennzeichnungen

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Rezeptanforderungs Bestätigung entspricht.

==WICHTIG==: Der E-Rezept Token darf bei diesem Anwendungsfall nicht übertragen werden.

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Rezeptbestaetigung`|
|ERPServiceRequestPrescriptionRequest|.status = #completed|

### Ablehnung - Verordnung

Falls der Verordnende die Anfrage ablehnen möchte, wird der gleiche ServiceRequest (.identifer:requestId muss gleich sein) an den Anfragenden zurück gesendet. Folgende Bedingungen müssen erfüllt sein:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Rezeptanfrage_Storno`|
|ERPServiceRequestPrescriptionRequest|.status = #revoked |
|ERPServiceRequestPrescriptionRequest|.reasonCode Angabe des Ablehnungsgrunds |

Für die PDF Repräsentation der Anfrage werden außerdem die medizinischen Inhalte der ursprünglichen Verordnungsanfrage übertragen. Diese sind vom PVS aus der initialen Anfrage zu übernehmen. Das empfangende System kann diese ignorieren.

### Ergebnis

Sobald das PVS die Anfrage bearbeitet und eine Antwort an die Pflegeeinrichtung versendet hat, ist der Vorgang für den Verordnenden beendet.

Die Pflegeeinrichtung hat die Information, dass die Anfrage bearbeitet wurde. Der Patient wird ggf. darüber in Kenntnis gesetzt, dass die Verordnung erstellt wurde. Der Patient kann seine Verordnung in einer beliebigen Apotheke einlösen.

Falls der Verordnende die Anfrage abgelehnt hat, ist der Vorgang entsprechend im Pflegesystem zu markieren.

## Beispiele

Beispielhafte FHIR-Ressourcen sind auf der folgenden Seite {{pagelink:Home/Examples.page.md}} verfügbar. 