## FHIR-Implementation Guide: KIM-Nachrichten für das E-Rezept

### Allgemeine Beschreibung
Das Feature "KIM-Nachrichten für das E-Rezept" ermöglicht es, Nachrichten im Kontext des E-Rezepts ohne Beteiligung des Fachdienstes zwischen den beteiligten Akteuren zu initiieren, zu versenden und zu empfangen.

Die Übermittlung erfolgt als strukturierte FHIR-Bundles unter Verwendung der TI-Anwendung "Kommunikation im Medizinwesen" (KIM) als gesichertes Übermittlungsverfahren.
Eine ausführliche fachliche Beschreibung findet sich im dazugehörigen [Featuredokument gemF_eRp_KIM](https://gemspec.gematik.de/docs/gemF/gemF_eRp_KIM/latest/).

### Relevante Dokumente

#### Feature-Dokument
Dem vorliegenden Implementation Guide (IG) liegt das [Featuredokument gemF_eRp_KIM](https://gemspec.gematik.de/docs/gemF/gemF_eRp_KIM/latest/) zugrunde. Das Dokument definiert die Anforderungen, User Stories und fachlichen Anwendungsfälle und bildet die Grundlage für diesen IG.

#### FHIR-IG
Dieser Implementation Guide bietet eine kurze Einführung in das Thema sowie detaillierte technische Anweisungen zur Umsetzung der Anwendungsfälle aus dem Featuredokument. Dabei werden die fachlichen Datenmodelle, relevanten Profile und deren Anwendung beschrieben.

#### ATF FHIR-IG
Dieser Implementation Guide basiert in seinem Konzept auf dem [App Transport Framework](https://gemspec.gematik.de/ig/fhir/atf/1.4.0/index.html).
Das ATF stellt sicher, dass die Kommunikation zwischen Sender und Empfänger effizient und verlässlich abläuft, indem es die Verarbeitbarkeit der Nachrichten gewährleistet und technische Rückmeldungen über den erfolgreichen Empfang und die Weiterverarbeitung bereitstellt.

### Wie dieser IG zu lesen ist

Dieser Implementation Guide beschreibt, wie die Use Cases unter Verwendung der FHIR Profile auszuführen sind.
Die folgenden Anwendungsfälle sind beschrieben und umzusetzen:
* [Rezeptanforderung der Pflege](./usecase-1-pflege.html)
* [Rezeptanforderung für Patient](./usecase-2-patient.html)
* [Rezeptanforderung der Apotheke](./usecase-3-apotheke.html)
* [Rezeptanforderung für anwendungsfertige Zytostatika Zubereitungen](./usecase-4-zyto.html)

Der Tab [FHIR-Artefakte](./artifacts.html) listet alle in diesem Projekt erstellten FHIR Artefakte:
* [Logische Modelle](./artifacts.html#structures-logical-models) beschreiben die Nachrichtentypen der Spezifikation aus fachlicher Sicht
* [Profile](./artifacts.html#structures-resource-profiles) beschreiben die erstellten FHIR-Profile
* [Datentypen](./artifacts.html#structures-data-type-profiles) beschreiben gesonderte Datentypen, wie z.B. Identifier
* [Terminologien](./artifacts.html#terminology-value-sets) beschreiben die in diesem Projekt erstellten Terminologien

Beispiele können ebenfalls auf der [FHIR-Artefakte Seite](./artifacts.html#example-example-instances) eingesehen werden.

Der Tab "Festlegungen" und dessen Unterseiten stellen Anforderungen an Systeme dar, die diesen IG umsetzen wollen.

### Abhängigkeiten

{% include dependency-table.xhtml %}

### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an [erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de) oder nutzen Sie das [GitHub-Repository](https://github.com/gematik/spec-E-Rezept-ServiceRequest/issues).

### Rechtliche Hinweise

Dieser Implementation Guide wurde von der [gematik GmbH](https://www.gematik.de/) erstellt und veröffentlicht.

Copyright © 2025 gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von Health Level Seven International, eingetragen beim United States Patent and Trademark Office.
