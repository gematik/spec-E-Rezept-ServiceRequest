## Modifier Extensions

Modifier Extensions in FHIR definieren Extensions, deren Inhalt die weitere Verarbeitungslogik eines Datensatzes maßgeblich beeinflussen.

In diesem Projekt sind folgende Modifier Extensions definiert und müssen entsprechend der Beschreibung verarbeitet werden:

//TODO: Check Output

{% sql
SELECT Title, Description
FROM Resources
WHERE Type = 'StructureDefinition'
  AND (Json LIKE '%"isModifier": true%')
%}
