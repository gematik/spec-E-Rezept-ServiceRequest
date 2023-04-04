## {{page-title}}

Die folgende FHIR Ressource stellt eine Anfrage an eine verordnende LEI dar. Enthalten sein muss eine strukturelle angabe der angefragten Medikation.

{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/message-header-request-header, diff}}

Folgende Felder sind zusätzlich zur ATF-Spezifikation zu befüllen, bzw. können befüllt werden:

@```
from StructureDefinition
where name = 'MessageHeaderRequestHeader'
for differential.element
    select id, short, comment
```
