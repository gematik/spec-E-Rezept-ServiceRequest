## Modifier Extensions

Modifier Extensions in FHIR definieren Extensions, deren Inhalt die weitere Verarbeitungslogik eines Datensatzes maßgeblich beeinflussen.

In diesem Projekt sind folgende Modifier Extensions definiert und müssen entsprechend der Beschreibung verarbeitet werden:

{% sql
SELECT title AS "Titel", description AS "Beschreibung"
FROM all_extensions
WHERE isModifier = true
%}
