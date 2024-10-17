# {{page-title}}

Diese Seite beschreibt die fachliche Beschreibung des Anwendungsfalls "Rezeptanforderung für anwendungsfertige Zytostatikazubereitungen". Für eine detaillierte Beschreibung dient das FeatureDokument "KIM-Nachrichten für das E-Rezept" ([Feature Dokument gemF_eRp_KIM](https://gemspec.gematik.de/docs/gemF/gemF_eRp_KIM/latest/)).

WICHTIG: Hierbei MUSS die Verordnung exakt der angefragten Medikation entsprechen. Diese Art der Anfrage wird über `MessageHeader.eventCode = #eRezept_ParenteraleZubereitung;*` kenntlich. Hierdurch MUSS im Primärsystem der verordnenden LEI der Hinweis gegeben werden, dass die zu verordnende nicht von der angefragten Medikation abweichen darf.

Der Arzt übernimmt die angefragte Medikation in die Verordnung und stellt diese im E-Rezept-Fachdienst ein. Darauf hin erhält der Arzt die Informationen für den E-Rezept Token und übermittelt den Token an die Apotheke.

Diese kann das Rezept am E-Rezept-Fachdienst einlösen.

{{render:guides/ig-rezeptanforderung/images/puml_images/UC4.png}}

### Hinweis zu Identifiern

Für diesen Fall gibt es Festlegungen zur Nutzung von Identifern im {{pagelink:Home/Datenobjekte/Profile/profile_definitions/erp-service-request-prescription-request.page.md}}, siehe {{pagelink:Home/UebergreifendeFestlegungen/identifier.page.md}}.