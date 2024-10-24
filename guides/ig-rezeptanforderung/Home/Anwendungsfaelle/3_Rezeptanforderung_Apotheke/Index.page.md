# {{page-title}}

In diesem Anwendungsfall löst eine heimversorgende Apotheke nach §12a ApoG die Rezeptanforderung aus und stellt eine Rezeptanfrage an einen verordnenden Arzt. Der Arzt kann die Anfrage bearbeiten und ein E-Rezept erstellen. Mit Erstellung des E-Rezepts erhält der Verordnende die Informationen "PrescriptionID" und "AccessCode" vom E-Rezept-Fachdienst und kann somit einen E-Rezept-Token erzeugen.

Der verordnende Leistungserbringer übermittelt den E-Rezept-Token anschließend an die Apotheke.

Die Apotheke löst das E-Rezept am E-Rezept-Fachdienst ein und startet die Belieferung an die Pflegeeinrichtung. Die Pflegeeinrichtung wird über das Arzneimittel, was beliefert wird informiert.

In diesem Anwendungsfall erhält die Pflegeeinrichtung eine Kopie der Nachricht in jedem Prozessschritt.