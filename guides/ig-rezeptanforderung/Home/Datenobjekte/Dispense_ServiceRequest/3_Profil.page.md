## {{page-title}}

Die folgende FHIR Ressource stellt eine Anfrage an eine abgebende LEI dar. Diese muss den E-Rezept Token enthalten, um die Dispensierung zu vollziehen.

Nachdem der Vorgang seitens der Apotheke abgeschlossen ist, werden die Abgabeinformationen an den Anfragenden zurück geschickt, damit dieser über den erfolgreichen Abschluss der Anfrage informiert ist.

{{tree:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-dispense-request, diff}}

### Use-Case spezifische Anforderungen

* Für `subject` MUSS das Profil [KBV_PR_FOR_Patient](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient) verwendet werden.
* Für `supportingInfo:AbgabeDaten` MUSS das Profil [GEM_ERP_PR_MedicationDispense](https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense) verwendet werden.
