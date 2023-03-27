## Profil

Die folgende FHIR Ressource stellt eine Anfrage an eine abgebende LEI dar. Diese muss den E-Rezept Token enthalten, um die Dispensierung zu vollziehen.

Nachdem der Vorgang seitens der Apotheke abgeschlossen ist, werden die Abgabeinformationen an den Anfragenden zurück geschickt, damit dieser über den erfolgreichen Abschluss der Anfrage informiert ist.

{{tree:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Dispense_ServiceRequest, diff}}