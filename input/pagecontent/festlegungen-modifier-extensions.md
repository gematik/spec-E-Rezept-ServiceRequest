## Modifier Extensions

Modifier Extensions in FHIR definieren Extensions, deren Inhalt die weitere Verarbeitungslogik eines Datensatzes maßgeblich beeinflussen.

In diesem Projekt sind folgende Modifier Extensions definiert und müssen entsprechend der Beschreibung verarbeitet werden:

@```
from StructureDefinition
select
    Name: link(url, name),
    join for differential.element 
    where isModifier = true
    select { Extension: link(type.profile, id), 'Verarbeitungshinweis': isModifierReason }
```
