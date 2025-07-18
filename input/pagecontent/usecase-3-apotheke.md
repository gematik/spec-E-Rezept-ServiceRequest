# Rezeptanforderung Apotheke

In diesem Anwendungsfall löst eine heimversorgende Apotheke nach §12a ApoG die Rezeptanforderung aus und stellt eine Rezeptanfrage an einen verordnenden Arzt. Der Arzt kann die Anfrage bearbeiten und ein E-Rezept erstellen. Mit Erstellung des E-Rezepts erhält der Verordnende die Informationen "PrescriptionID" und "AccessCode" vom E-Rezept-Fachdienst und kann somit einen E-Rezept-Token erzeugen.

Der verordnende Leistungserbringer übermittelt den E-Rezept-Token anschließend an die Apotheke.

Die Apotheke löst das E-Rezept am E-Rezept-Fachdienst ein und startet die Belieferung an die Pflegeeinrichtung. Die Pflegeeinrichtung wird über das Arzneimittel, was beliefert wird informiert.

In diesem Anwendungsfall erhält die Pflegeeinrichtung eine Kopie der Nachricht in jedem Prozessschritt.

## Anfrage an Verordnenden

Die Apotheke stellt eine Rezeptanforderung an einen verordnenden Leistungserbringer. Der verordnende LE stellt ein E-Rezept am E-Rezept-Fachdienst ein und überträgt den E-Rezept Token als Antwort an die Apotheke.
Die Apotheke löst das E-Rezept ein und informiert die Pflegeeinrichtung über die anstehende Belieferung.
{{render:guides/ig-rezeptanforderung/images/puml_images/UC3.png}}

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

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Rezeptanforderung seitens der Pflegeeinrichtung entspricht:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Rezeptanfrage`|
|ERPServiceRequestPrescriptionRequest|.status = #active|
|ERPServiceRequestOrganization|.type.coding = **#APO** |
|ERPServiceRequestPrescriptionRequest|.supportingInfo:pflegeeinrichtungKopie = Referenz zu ERPServiceRequestOrganization, die eine KIM-Adresse in Contact enthält |

HINWEIS: Über `ServiceRequest.reasonCode` kann angegeben werden, warum die Medikation angefragt wird.

#### Angabe der Verordnungsinhalte

Die MedicationRequest Ressource ist nach Profil {{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}} anzugeben.
Zur Behandlung von gesonderten Fällen kann in der ServiceRequest und MedicationRequest Ressource folgendes gesetzt werden: 

|Profil|Feld|Bedeutung|
|---|---|---|
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

### [2] Nachrichten_Kopie

In diesem Anwendungsfall muss jede Nachricht per Kopie an die Pflegeeinrichtung gestellt werden. Dabei wird der gesamte {{link:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container}} an die Pflegeeinrichtung übertragen.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im {{link:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container}} einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-request-header.page.md}}|ERPServiceRequestMessageContainer.entry[0]||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-message-container.page.md}}|ERPServiceRequestRequestHeader.focus||

Folgendes Klassendiagramm soll die verwendeten Profile graphisch darstellen:
{{render:guides/ig-rezeptanforderung/images/puml_images/MessageCopy_Class.png}}

#### Wichtige Kennzeichnungen

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Rezeptanforderung seitens der Pflegeeinrichtung entspricht:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;message-copy`|
|ERPServiceRequestRequestHeader|.focus = Referenz auf das Bundle, was in der ursprünglichen Nachricht gesendet wurde|

### Ergebnis der Übertragung

Die Pflegeeinrichtung kann in ihrem System nachverfolgen welche Nachrichten bezüglich einer Rezeptanforderung gesendet werden. Das System erkennt ebenfalls, dass es sich um eine Kopie handelt und dass die Pflegeeinrichtung nicht aktiv werden muss.

## Verordnender an Anfragenden

### [4] Rezeptanforderung_Bestätigung

Der Verordnende kann nach dem Erhalt einer Rezeptanforderung diese prüfen und eine entsprechende Verordnung erstellen, signieren und im E-Rezept-Fachdienst einstellen (**[3]**).

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

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Rezeptanforderungs Bestätigung entspricht:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Rezeptbestaetigung`|
|ERPServiceRequestPrescriptionRequest|.status = #completed|
|ERPServiceRequestPrescriptionRequest|.extension:EPrescriptionToken = <E-Rezept Token>|

#### [5] Nachrichten_Kopie

Analog zur Apotheke muss auch der Verordnende eine Kopie des erstellen ERPServiceRequestMessageContainer an die Pflegeeinrichtung übertragen. Die KIM Adresse ist dem PVS aus der initialen Anfrage der Apotheke bekannt (s.o. [2] Nachrichten_Kopie).

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

Die Pflegeeinrichtung hat die Information, dass die Anfrage bearbeitet wurde und den E-Rezept Token. Jetzt kann eine Abgabeanfrage an eine Apotheke versendet werden.

Falls der Verordnende die Anfrage abgelehnt hat, ist der Vorgang entsprechend im Apothekensystem zu markieren.

## Apotheke an Pflegeeinrichtung

### [6] Dispensieranforderung_Bestätigung

Abschließend zum Anwendungsfall übermittelt die Apotheke eine Bestätigung an die zu beliefernde Pflegeeinrichtung, dass die Abgabe bestätigt ist.
In der Nachricht sollen auch die Abgabedaten inkludiert sein, damit die Pflegeeinrichtung informiert ist welches Präparat geliefert wird.

Zum erstellen müssen die in {{pagelink:Home/Datenobjekte/Mappings/mapping_definitions/Mapping-für-Dispensieranforderung.page.md}} aufgeführten fachlichen Informationen übertragen werden. Das Mapping stellt ebenfalls dar, in welchen Profilen die Informationen angegeben werden müssen.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im {{link:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container}} einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-request-header.page.md}}|ERPServiceRequestMessageContainer.entry[0]||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-dispense-request.page.md}}|ERPServiceRequestRequestHeader.focus||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-patient.page.md}}|ERPServiceRequestDispenseRequest.subject||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}}|ERPServiceRequestDispenseRequest.basedOn||
|[KBV_PR_ERP_Medication_PZN](https://simplifier.net/erezept/kbvprerpmedicationpzn), [KBV_PR_ERP_Medication_Compounding](https://simplifier.net/erezept/kbvprerpmedicationcompounding), [KBV_PR_ERP_Medication_Ingredient](https://simplifier.net/erezept/kbvprerpmedicationingredient) oder [KBV_PR_ERP_Medication_FreeText](https://simplifier.net/erezept/kbvprerpmedicationfreetext)|ERPServiceRequestMedicationRequest.medication[x]||

Folgendes Klassendiagramm soll die verwendeten Profile graphisch darstellen:
{{render:guides/ig-rezeptanforderung/images/puml_images/DispenseRequest_Confirmation_Class.png}}

#### Wichtige Kennzeichnungen

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Dispensieranforderung entspricht:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Abgabebestaetigung`|
|ERPServiceRequestDispenseRequest|.status = #completed|
|ERPServiceRequestDispenseRequest|.supportingInfo = Abgabeinformationen|

### Ergebnis

Die Pflegeeinrichtung ist darüber informiert, dass die Abgabe erfolgt ist und welche Medikamente geliefert werden.
Dieser letzte Schritt schließt den Anwendungsfall ab.

## Beispiele

Beispielhafte FHIR-Ressourcen sind auf der folgenden Seite {{pagelink:Home/Examples.page.md}} verfügbar. 