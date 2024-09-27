## {{page-title}}

Diese Seite beschreibt die fachliche Beschreibung des Anwendungsfalls "Rezeptanforderung für Parenterale Zubereitung". Für eine detaillierte Beschreibung dient das FeatureDokument "KIM-Nachrichten für das E-Rezept" (gemF_eRp_KIM) //TODO: Link.

In diesem Sonderfall einer Rezeptanforderung initiiert eine Apotheke nach dem Start der Zubereitung einer parenteralen Zubereitung die Rezeptanforderung (**[1]**).

WICHTIG: Hierbei MUSS die Verordnung exakt der angefragten Medikation entsprechen. Diese Art der Anfrage wird über `MessageHeader.eventCode = eRezept_ParenteraleZubereitung*` kenntlich. Hierdurch MUSS im PS der verordnenden LEI der Hinweis gegeben werden, dass die zu verordnende nicht von der angefragten Medikation abweichen darf.

Der Arzt übernimmt die angefragte Medikation in die Verordnung und stellt diese im E-Rezept-Fachdienst ein (**[2]**). Darauf hin erhält der Arzt die Informationen für den E-Rezept Token (**[3]**) und übermittelt den Token an die Apotheke (**[4]**).

Diese kann das Rezept am E-Rezept-Fachdienst einlösen (**[5]**).

{{render:guides/ig-rezeptanforderung/images/puml_images/UC4.png}}

### Hinweis zu Identifiern

Für diesen Fall gibt es Festlegungen zur Nutzung von Identifern, siehe {{pagelink:identifier_festlegungen}}
