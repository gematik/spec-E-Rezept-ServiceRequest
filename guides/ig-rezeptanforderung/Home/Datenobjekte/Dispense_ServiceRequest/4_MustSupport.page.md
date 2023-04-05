## {{page-title}}

Die folgende FHIR Ressource stellt eine Anfrage an eine verordnende LEI dar. Enthalten sein muss eine strukturelle angabe der angefragten Medikation.

{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/service-request-dispense-request, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```
from StructureDefinition
where name = 'ServiceRequestDispenseRequest'
for differential.element
    select id, short, comment
```
