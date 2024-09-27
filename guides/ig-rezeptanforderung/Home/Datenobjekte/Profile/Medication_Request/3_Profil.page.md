## {{page-title}}

Die folgende FHIR Ressource stellt eine Anfrage an eine verordnende LEI dar. Enthalten sein muss eine strukturelle angabe der angefragten Medikation.

{{tree:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-medication-request, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```
from StructureDefinition
where name = 'ERPServiceRequestMedicationRequest'
for differential.element where max != '0'
    select id, short, comment
```
