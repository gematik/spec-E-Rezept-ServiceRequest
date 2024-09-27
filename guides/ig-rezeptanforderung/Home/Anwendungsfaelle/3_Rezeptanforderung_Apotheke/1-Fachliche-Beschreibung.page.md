## {{page-title}}

In diesem Anwendungsfall löst ein Anfragender (z.B. eine Pflegeeinrichtung) den Prozess aus und stellt eine Rezeptanfrage an einen verordnenden Arzt. Der Arzt kann die Anfrage bearbeiten und ein E-Rezept erstellen. Mit Erstellung des E-Rezepts erhält der Verordnende die Informationen "PrescriptionID" und "AccessCode" vom E-Rezept-Fachdienst und kann somit einen E-Rezept-Token erzeugen.

Nun entscheidet sich der weitere Verlauf je nach Zustelltyp (ServiceRequest.orderDetail.code). Wenn der Code "#issue-prescription" angegeben wurde, wird nach dem Erstellen des E-Rezepts eine Bestätigung ohne den Token an den Anfragenden versendet. Damit endet der Workflow. Der Code "#return-to-requester" signalisiert, dass der E-Rezept-Token an den Anfragenden zu übermitteln ist, damit dieser dann die Belieferungsanfrage an die Apotheke starten kann.

Eine detaillierte fachliche Beschreibung findet sich im dazugehörigen Featuredokument [gemF_eRp_KIM](https://fachportal.gematik.de/schnelleinstieg/downloadcenter/feature-dokumente).

Ein Mapping der fachlichen Informationseinheiten des Featuredokuments zu den Profilen findet sich unten.

{{render:guides/ig-rezeptanforderung/images/puml_images/UC1_1.png}}