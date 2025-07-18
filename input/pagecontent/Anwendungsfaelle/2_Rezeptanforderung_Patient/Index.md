# {{page-title}}

In diesem Anwendungsfall initiiert eine Pflegeeinrichtung den Prozess, indem sie eine Rezeptanfrage an einen verordnenden Arzt stellt. In dieser Anfrage ist angegeben, dass die Verordnung vom Patienten eingelöst werden soll.

Der Arzt bearbeitet die Anfrage und erstellt ein E-Rezept mit Flowtype 160/200, damit der Versicherte das E-Rezept selbst einlösen kann.
Nach der Erstellung des E-Rezepts erhält der Verordnende die Informationen "PrescriptionID" und "AccessCode" vom E-Rezept-Fachdienst und kann damit einen E-Rezept-Token generieren.

Der verordnende Leistungserbringer übermittelt den E-Rezept-Token, sowie den Patientenausdruck als PDF (s. [Feature Dokument gemF_eRp_KIM](https://gemspec.gematik.de/docs/gemF/gemF_eRp_KIM/latest/)) anschließend an die Pflegeeinrichtung.

Die Pflegeeinrichtung kann den Patienten informieren, dass das E-Rezept in einer Apotheke eingelöst werden kann und gibt ggf. den Patientenausdruck mit.