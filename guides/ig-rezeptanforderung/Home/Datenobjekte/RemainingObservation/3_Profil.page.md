## {{page-title}}

{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/observation-remaining-medication, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```
from StructureDefinition
where name = 'ObservationRemainingMedication'
for differential.element
    select id, short, comment
```
