## {{page-title}}

Diese Seite beschreibt die fachliche Beschreibung für "Klärfall". Für eine detaillierte Beschreibung dient das FeatureDokument "KIM-Nachrichten für das E-Rezept" (gemF_eRp_KIM) //TODO: Link.

Die Apotheke initiiert eine eine Anfrage an einen verordnenden Arzt und bittet um Klärung zu einer oder mehreren Verordnung(en).

Die Nachrichten werden im `ServiceRequest.note` hinzugefügt und nicht ersetzt.

Sobald eine Partei den Vorgang abschließen möchte, setzt sie den Status des ServiceRequestClearingRequest auf #completed und übermittelt somit eine Bestätigung an das andere System.

{{render:guides/ig-rezeptanforderung/images/puml_images/UC5.png}}

### Vorgangs-ID bei mehreren Rezepten

Falls mehrere Verordnungen eine Klärung bedürfen oder ein Präparat Klärung bedarf, welches aber mit anderen Medikamenten zusammen verordnet wurde können mehrere ServiceRequestClearingRequest angelegt werden. Diese müssen alle je eine eigene `identifier[requestId]`, sowie eine allen gemeinsame `ServiceRequest.requisition`-ID.
