---
topic: dispense_servicerequest
---

# Dispensierungsanfrage

## FHIR Representation

Die folgende FHIR Ressource stellt eine Anfrage zur Belieferung eines Präparats an eine abgebende LEI dar. Diese muss den E-Rezept Token enthalten, um die Dispensierung zu vollziehen.

Nachdem der Vorgang seitens der Apotheke abgeschlossen ist, werden die Abgabeinformationen an den Anfragenden zurück geschickt, damit dieser über den erfolgreichen Abschluss der Anfrage informiert ist.

{{tree:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Dispense_ServiceRequest, diff}}

## Kommentare zu Feldern

Nähere Erläuterungen zu den Feldern von Dispense_ServiceRequest.
|Feld|Kommentar|
|---|---|
|.extension:EPrescriptionToken|enthält den Token zum Einlösen einer Verordnung in der Form "/Task/{PrescriptionID}/$accept?ac={AccessCode}|
|.extension:Secret|enthält das Secret, wenn bspw. eine Apotheke die Dispensierungsanfrage innerhalb eines Apothekenverbundes weitergeben möchte|
|.identifer|siehe {{pagelink:introduction}}|
|.basedOn|Enthält die Verordnung die durch den E-Rezept-Token eingelöst werden kann|
|.replaces|Im Falle einer Stornierung und einer erneuten Übermittlung eines Dispense_ServiceRequests kann dieses Feld genutzt werden, um den stornierten ServiceRequest zu referenzieren|
|.requisition|siehe {{pagelink:introduction}}|
|.status|Gibt den aktuellen Status der Anfrage an. Siehe {{pagelink:introduction}}|
|.intent|fester Wert: `filler-order`|
|.code|fester Wert: `dispense-request`, dient der Unterscheidung verschiedener ServiceRequest Arten|
|.subject|Referenziert den begünstigten Patienten|
|.occurenceDateTime|Gibt an zu wann die Belieferung spätestens erfolgen soll|
|.authoredOn|Gibt an wann die Anfrage erstellt wurde|
|.requester|Der zu beliefernde Anfragende|
|.performer|Der die Belieferung durchführen soll|
|.supportingInfo:AusstellenderArzt|Arzt, der die Verordnung erstellt hat|
|.supportingInfo:AbgabeDaten|Abgabedaten der Apotheke nach Belieferung wie im E-Rezept Fachdienst eingereicht|
|.note|Array an Freitextelementen|
