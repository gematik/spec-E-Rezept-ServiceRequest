### {{page-title}}

In diesem Sonderfall initiiert eine Apotheke nach dem Start der Zubereitung einer parenteralen Zubereitung die Rezeptanforderung (**[1]**).

Hierbei muss die Verordnung exakt der angefragten Medikation entsprechen. Diese Art der Anfrage wird über `MessageHeader.eventCode = eRezept_ParenteraleErnaehrung_Rezeptanfrage` kenntlich.

Der Arzt übernimmt die angefragte Medikation in die Verordnung und stellt diese im E-Rezept Fachdienst ein (**[2]**). Darauf hin erhält der Arzt die Informationen für den E-Rezept Token (**[3]**) und übermittelt den Token an die Apotheke (**[4]**).

Diese kann nun das Rezept am E-Rezept Fachdienst einlösen (**[5]**).

![Sequenzdiagramm UC4](../puml/images/UC4.png)