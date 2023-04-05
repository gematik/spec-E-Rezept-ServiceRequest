## {{page-title}}

Die folgende FHIR Ressource stellt eine Anfrage an eine verordnende LEI dar. Enthalten sein muss der vom Arzt eingestellte Verordnungsdatensatz.
Zentral für dieses Profil ist `ServiceRequest.note`. Hierüber wird der Nachrichtenaustausch dargestellt.

Da der gleiche ServiceRequest weitergeleitet wird ist auch unter `ServiceRequest.meta.lastUpdated` anzugeben, wann die Ressource das letzte Mal aktualisiert wurde.

{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/service-request-clearing-request, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```
from StructureDefinition
where name = 'ServiceRequestClearingRequest'
for differential.element
    select id, short, comment
```
