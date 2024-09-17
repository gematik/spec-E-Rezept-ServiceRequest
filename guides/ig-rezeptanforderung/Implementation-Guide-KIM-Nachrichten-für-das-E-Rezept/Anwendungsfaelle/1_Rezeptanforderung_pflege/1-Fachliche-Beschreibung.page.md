## {{page-title}}

In diesem Anwendungsfall initiiert ein Anfragender (z.B. eine Pflegeeinrichtung) den Prozess, indem er eine Rezeptanfrage an einen verordnenden Arzt stellt. Der Arzt bearbeitet die Anfrage und erstellt ein E-Rezept. Nach der Erstellung des E-Rezepts erhält der Verordnende die Informationen "PrescriptionID" und "AccessCode" vom E-Rezept-Fachdienst und kann damit einen E-Rezept-Token generieren.

Der verordnende Leistungserbringer übermittelt den E-Rezept-Token anschließend an die Pflegeeinrichtung.

Die Pflegeeinrichtung sendet daraufhin eine Anfrage zur Belieferung der Verordnung an die ausgewählte Apotheke. Diese kann mithilfe der Informationen aus dem E-Rezept-Token das E-Rezept vom E-Rezept-Fachdienst abrufen und die Pflegeeinrichtung mit der entsprechenden Medikation beliefern.

Eine ausführliche fachliche Beschreibung findet sich im dazugehörigen Featuredokument ==[gemF_eRp_KIM](https://fachportal.gematik.de/schnelleinstieg/downloadcenter/feature-dokumente).== //TODO: Set Link