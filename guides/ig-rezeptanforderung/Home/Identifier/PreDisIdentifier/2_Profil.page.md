## {{page-title}}

{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/identifier-pre-dis-identifier, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```
from StructureDefinition
where name = 'IdentifierPreDisIdentifier'
for differential.element
    where exists(comment | short)
    select id, short, comment
```
