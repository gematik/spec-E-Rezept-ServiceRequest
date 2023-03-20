---
topic: prescription_servicerequest
---
# Verordnungsanfrage (Prescription_ServiceRequest)

## FHIR Representation

Die folgende FHIR Ressource stellt eine Anfrage an eine abgebende LEI dar. Diese muss den E-Rezept Token enthalten, um die Dispensierung zu vollziehen.

Nachdem der Vorgang seitens der Apotheke abgeschlossen ist, werden die Abgabeinformationen an den Anfragenden zurück geschickt, damit dieser über den erfolgreichen Abschluss der Anfrage informiert ist.

{{tree:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Prescription_ServiceRequest, diff}}

## Kommentare zu Feldern

Nähere Erläuterungen zu den Feldern von Prescription_ServiceRequest.
|Feld|Kommentar|
|---|---|
|.extension:EPrescriptionToken|enthält den Token zum Einlösen einer Verordnung in der Form "/Task/{PrescriptionID}/$accept?ac={AccessCode}|
|.identifer|siehe {{pagelink:introduction}}|
|.basedOn|Enthält zunächst einen MedicationRequest mit der angefragten Medikation. Nach Bearbeitung dann die Verordnung, die der Verordnende erstellt hat|
|.replaces|Im Falle einer Stornierung und einer erneuten Übermittlung eines Prescription_ServiceRequests kann dieses Feld genutzt werden, um den stornierten ServiceRequest zu referenzieren|
|.requisition|siehe {{pagelink:introduction}}|
|.status|Gibt den aktuellen Status der Anfrage an. Siehe {{pagelink:introduction}}|
|.intent|fester Wert: `order`|
|.code|fester Wert: `prescription-request`, dient der Unterscheidung verschiedener ServiceRequest Arten|
|.orderDetail|Gibt an, wie nach der Erstellung der Verordnung weiter verfahren werden soll.|
|.subject|Referenziert den begünstigten Patienten|
|.occurenceDateTime|Gibt an zu wann die Verordnung spätestens erfolgen soll|
|.authoredOn|Gibt an wann die Anfrage erstellt wurde|
|.requester|Der die Verordnung Anfragende|
|.performer|Der die Verordnung Ausstellende|
|.reasonCode|Code der einen Grund für die Verordnungsanfrage angibt|
|.reasonReference|Falls eine Observation als Begründung angegeben wird, kann diese hier referenziert werden|
|.supportingInfo:AuslieferndeApotheke|Im Falle, dass der Arzt die Verordnung an eine Apotheke weiterleiten soll, kann diese hier angegeben werden|
|.note|Array an Freitextelementen|
