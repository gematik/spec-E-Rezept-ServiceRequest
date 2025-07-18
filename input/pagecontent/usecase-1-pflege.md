# Rezeptanforderung der Pflege

In diesem Anwendungsfall initiiert ein Anfragender (z.B. eine Pflegeeinrichtung) den Prozess, indem er eine Rezeptanfrage an einen verordnenden Arzt stellt. Der Arzt bearbeitet die Anfrage und erstellt ein E-Rezept. Nach der Erstellung des E-Rezepts erhält der Verordnende die Informationen "PrescriptionID" und "AccessCode" vom E-Rezept-Fachdienst und kann damit einen E-Rezept-Token generieren.

Der verordnende Leistungserbringer übermittelt den E-Rezept-Token anschließend an die Pflegeeinrichtung.

Die Pflegeeinrichtung sendet daraufhin eine Anfrage zur Belieferung der Verordnung an die ausgewählte Apotheke. Diese kann mithilfe der Informationen aus dem E-Rezept-Token das E-Rezept vom E-Rezept-Fachdienst abrufen und die Pflegeeinrichtung mit der entsprechenden Medikation beliefern.

## Anfragender an Verordnenden

Im ersten Schritt stellt die Pflegeeinrichtung eine Rezeptanforderung an einen verordnenden Leistungserbringer. Der verordnende LE stellt ein E-Rezept am E-Rezept-Fachdienst ein und überträgt den E-Rezept Token als Antwort an die Pflegeeinrichtung.
{{render:guides/ig-rezeptanforderung/images/puml_images/UC1_1.png}}

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
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-organization.page.md}}|ERPServiceRequestPrescriptionRequest.requester||
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
|ERPServiceRequestOrganization|.type.coding = #PFL |

HINWEIS: Über `ServiceRequest.reasonCode` kann angegeben werden, warum die Medikation angefragt wird.

#### Angabe der Verordnungsinhalte

Die MedicationRequest Ressource ist nach Profil {{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}} anzugeben.
Zur Behandlung von gesonderten Fällen kann in der ServiceRequest und MedicationRequest Ressource folgendes gesetzt werden: 

|Profil|Feld|Bedeutung|
|---|---|---|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-prescription-request.page.md}}|.extension:redeemByPatient|Angabe, ob die angefragte Verordnung durch den Versicherten eingelöst werden soll. Falls der Wert `true` ist, soll der verordnende das E-Rezept mit Flowtype 160/200 erstellen. Andernfalls wird ein E-Rezept mit Workflow 169/209 erstellt.|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}}|.extension:PriorPrescriptionID|Angabe einer vorherigen Task ID auf die sich die Anfrage bezieht|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}}|.extension:requestMVO.extension:Kennzeichen|Angabe, ob der Anfragende die Ausstellung des E-Rezeptes im Rahmen einer Mehrfachverordnung wünscht|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-request.page.md}}|.dispenseRequest.quantity|Angabe der gewünschten Packungsmenge des Arzneimittels|

### Stornierung - Verordnungsanfrage

Falls der Anfragende die Anfrage stornieren möchte, wird derselbe ServiceRequest (identifiziert durch die gleiche .identifer:requestId) erneut an den Verordnenden gesendet. Bei der Stornierung ergeben sich folgende Änderungen für die Eigenschaften der Profile:

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

Der Verordnende erhält in der Antwort vom Fachdienst die PrescriptionID und den AccessCode (**[3]**). Beide Informationen werden benötigt, um ein E-Rezept in einer Apotheke einzulösen.

Zum Erstellen müssen die in {{pagelink:Home/Datenobjekte/Mappings/mapping_definitions/Mapping-für-Rezeptanforderung_Bestaetigung.page.md}} aufgeführten fachlichen Informationen übertragen werden. Insbesondere muss der Inhalt der Verordnung für die Dokumentation an die Pflegeeinrichtung übertragen werden, da diese keinen Zugriff auf den E-Rezept-Fachdienst hat. Das Mapping stellt ebenfalls dar, in welchen Profilen die Informationen angegeben werden müssen.

Sollte der Arzt nach Prüfung der Rezeptanforderung etwas anderes verordnen, als der Anfragende angefragt hat, muss im Profil {{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-prescription-request.page.md}} die modifier Extension "medicationChanged" mit true gesetzt werden (s. {{pagelink:Home/Datenobjekte/Extensions/extension_definitions/erp-service-request-did-change-medication-ex.page.md}}). So kann das System des Anfragenden den Nutzer explizit darauf hinweisen, dass die Antwort von der Anfrage abweicht. Das Feld kann automatisch vom System gesetzt werden, wenn der Nutzer eine Angabe in dem Rezept ändert.

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

Falls der Verordnende die Anfrage abgelehnt hat, ist der Vorgang entsprechend im Pflegesystem zu markieren.


## Anfrage an Apotheke

Im nächsten Schritt kann die anfragende Pflegeeinrichtung den E-Rezept Token an die ausliefernde Apotheke weiterreichen und um eine Abgabe der Verordnung anfragen.
Die Pflegeeinrichtung kann angeben, wie die Belieferung der Verordnung erfolgen soll.

Die Apotheke löst das E-Rezept am E-Rezept-Fachdienst ein und bestätigt die Belieferung gegenüber der Pflegeeinrichtung.

{{render:guides/ig-rezeptanforderung/images/puml_images/UC1_2.png}}

### [6] Dispensieranforderung

Zum erstellen müssen die in {{pagelink:Home/Datenobjekte/Mappings/mapping_definitions/Mapping-für-Dispensieranforderung.page.md}} aufgeführten fachlichen Informationen übertragen werden. Das Mapping stellt ebenfalls dar, in welchen Profilen die Informationen angegeben werden müssen.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im {{link:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container}} einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-request-header.page.md}}|ERPServiceRequestMessageContainer.entry[0]||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-dispense-request.page.md}}|ERPServiceRequestRequestHeader.focus||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-patient.page.md}}|ERPServiceRequestDispenseRequest.subject||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-organization.page.md}}, |ERPServiceRequestDispenseRequest.requester||
|{{link:http://fhir.de/StructureDefinition/address-de-basis}}, |ERPServiceRequestDispenseRequest.extension[alternativeDeliveryAddress]|x|

Folgendes Klassendiagramm soll die verwendeten Profile graphisch darstellen:
{{render:guides/ig-rezeptanforderung/images/puml_images/DispenseRequest_Class.png}}


#### Wichtige Kennzeichnungen

Folgende Bedingungen müssen erfüllt, bzw. Felder gesetzt sein, damit die Nachricht einer Dispensieranforderung entspricht:

|Profil|Bedingung|
|---|---|
|ERPServiceRequestRequestHeader|.eventCode = `#eRezept_Rezeptanforderung;Abgabeanfrage`|
|ERPServiceRequestDispenseRequest|.status = #active|
|ERPServiceRequestDispenseRequest|.extension:EPrescriptionToken = <E-Rezept Token>|
|ERPServiceRequestDispenseRequest|.requester.type = #PFL|

#### Angabe der Belieferungsart

Die anfragende Pflegeeinrichtung kann angeben, wie die Belieferung erfolgen soll, es kann 
- Abholung durch Pflegedienst
- Lieferung an Adresse aus Rezept
- Lieferung an alternative Lieferadresse
- Abholung durch Patienten/Vertreter 

als Belieferungsoption angegeben werden. Wenn die Option "Lieferung an alternative Lieferadresse" angegeben wird, dann muss in der Extension {{pagelink:Home/Datenobjekte/Extensions/extension_definitions/erp-service-request-alternative-delivery-address-ex.page.md}} die entsprechende Adresse hinterlegt werden.

#### Angabe der Verordnungsinhalte

Für die Dispensieranforderung ist nicht vorgesehen, dass Verordnungsinhalte übertragen werden, da angenommen wird, dass die Pflegeeinrichtung via Rezeptanforderung und die Apotheke via Abrufen am E-Rezept-Fachdienst in Kenntnis des Verordnungsinhaltes sind.

Es wird angenommen, dass zwischen einer anfragenden Pflegeeinrichtung und Apotheke bereits vereinbarte Prozesse zur Übergabe der eigentlichen Medikation bestehen. Daher wurden diese nicht weiter spezifiziert. Für etwaige Kommunikation darüber kann das Feld `ServiceRequest.note` genutzt, oder direkt Kontakt aufgenommen werden.

### Ergebnis der Übertragung

Die Apotheke ist im Besitz des E-Rezept-Tokens und hat alle Informationen, die sie für eine Kontaktaufnahme benötigt, sowohl zur anfragenden Person/ Einrichtung, wie auch zum ausstellenden Arzt.

Mit Besitz des Tokens ist eine Apotheke in der Lage den E-Rezept-Fachdienst nach dem Rezept abzufragen und kann dieses entsprechend bearbeiten (**[7]**).
Die Apotheke kann im letzten Schritt die Verarbeitung der Anfrage und die Belieferung bestätigen (**[8]**).

## Antwort der Apotheke

### [8] Dispensieranforderung_Bestätigung

Abschließend zum Anwendungsfall übermittelt die Apotheke eine Bestätigung an die anfragende Pflegeeinrichtung, dass die Abgabe bestätigt ist.
In der Antwort sollen auch die Abgabedaten enthalten sein, damit die Pflegeeinrichtung darüber informiert ist, welches Präparat geliefert wird.

Zum Erstellen müssen die in {{pagelink:Home/Datenobjekte/Mappings/mapping_definitions/Mapping-für-Dispensieranforderung.page.md}} aufgeführten fachlichen Informationen übertragen werden. Das Mapping zeigt zudem, in welchen Profilen die Informationen angegeben werden müssen.

Sollte die Apotheke nach Prüfung des Rezepts und der Arzneimittelverfügbarkeit etwas anderes beliefern, als im E-Rezept verordnet wurde, muss im Profil {{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-prescription-request.page.md}} die modifier Extension "medicationChanged" mit true gesetzt werden (s. {{pagelink:Home/Datenobjekte/Extensions/extension_definitions/erp-service-request-did-change-medication-ex.page.md}}). So kann das System der Pflege den Nutzer explizit darauf hinweisen. Das Feld kann automatisch vom AVS gesetzt werden, wenn eine entsprechende Abweichung auftritt.

#### Verwendung von Profilen

Folgende Profile sind für diesen Übertragungsweg zu nutzen und im {{link:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container}} einzubetten:

|Profil|Referenziert in|Optional|
|---|---|---|
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-request-header.page.md}}|ERPServiceRequestMessageContainer.entry[0]||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-dispense-request.page.md}}|ERPServiceRequestRequestHeader.focus||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-patient.page.md}}|ERPServiceRequestDispenseRequest.subject||
|{{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-medication-dispense.page.md}}|ERPServiceRequestDispenseRequest.supportingInfo:AbgabeDaten||
|[KBV_PR_ERP_Medication_PZN](https://simplifier.net/erezept/kbvprerpmedicationpzn), [KBV_PR_ERP_Medication_Compounding](https://simplifier.net/erezept/kbvprerpmedicationcompounding), [KBV_PR_ERP_Medication_Ingredient](https://simplifier.net/erezept/kbvprerpmedicationingredient) oder [KBV_PR_ERP_Medication_FreeText](https://simplifier.net/erezept/kbvprerpmedicationfreetext)|ERPServiceRequestDispenseRequest.medication[x]||

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

Die anfragende Einrichtung/ Person ist darüber informiert, dass die Abgabe erfolgt ist und welche Medikamente geliefert werden.
Dieser letzte Schritt schließt den Anwendungsfall "Rezeptanforderung in der Pflege" ab.

## Beispiele

Beispielhafte FHIR-Ressourcen sind auf der folgenden Seite {{pagelink:Home/Examples.page.md}} verfügbar. 