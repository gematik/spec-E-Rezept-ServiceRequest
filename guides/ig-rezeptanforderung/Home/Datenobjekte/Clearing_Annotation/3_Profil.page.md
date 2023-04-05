## {{page-title}}

Die folgende FHIR Ressource stellt einen Nachrichteneintrag innerhalb des Nachrichtenverlaufs von `ServiceRequestClearingRequest.note` dar.
Verpflichtend ist der Autor als Referenz, sowie Tag und Zeipunkt der Erstellung einzutragen.
Somit kann in den Primärsystemen ein entsprechender Verlauf dargestellt werden.

{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/annotation-clearing, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```
from StructureDefinition
where name = 'AnnotationClearing'
for differential.element
    select id, short, comment
```
