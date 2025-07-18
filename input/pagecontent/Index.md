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
Dieser Implementation Guide basiert in seinem Konzept auf dem [App Transport Framework](https://simplifier.net/app-transport-framework/~guides).
Das ATF stellt sicher, dass die Kommunikation zwischen Sender und Empfänger effizient und verlässlich abläuft, indem es die Verarbeitbarkeit der Nachrichten gewährleistet und technische Rückmeldungen über den erfolgreichen Empfang und die Weiterverarbeitung bereitstellt.

### Wie dieser IG zu lesen ist

Dieser Implementation Guide beschreibt, wie die Use Cases unter Verwendung der FHIR Profile auszuführen sind.
Die folgenden Anwendungsfälle sind beschrieben und umzusetzen:
* {{pagelink:Home/Anwendungsfaelle/1_Rezeptanforderung}}
* {{pagelink:Home/Anwendungsfaelle/2_Rezeptanforderung_Patient}}
* {{pagelink:Home/Anwendungsfaelle/3_Rezeptanforderung_Apotheke}}
* {{pagelink:Home/Anwendungsfaelle/4_Rezeptanforderung_Zyto}}

Der Tab {{pagelink:Home/Datenobjekte}} listet alle in diesem Projekt erstellten FHIR Artefakte:
* {{pagelink:Home/Datenobjekte/Logical-Models}} beschreiben die Nachrichtentypen der Spezifikation aus fachlicher Sicht
* {{pagelink:Home/Datenobjekte/Profile}} beschreiben die erstellten FHIR-Profile
* {{pagelink:Home/Datenobjekte/Mappings}} beschreiben die Mappings zwischen den Logischen Modellen und den FHIR-Profilen
* {{pagelink:Home/Datenobjekte/Identifier}} beschreiben gesonderte Identifier, die für dieses Projekt erstellt wurden
* {{pagelink:Home/Datenobjekte/Terminologien}} beschreiben die in diesem Projekt erstellten Terminologien

Der Tab {{pagelink:Home/UebergreifendeFestlegungen}} und dessen Unterseiten stellen Anforderungen an Systeme dar, die diesen IG umsetzen wollen.

Beispiele können unter {{pagelink:Home/Examples.page.md}} eingesehen werden.

### Abhängigkeiten

{% include dependency-table.xhtml %}

### Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an [erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de) oder nutzen Sie das [GitHub-Repository](https://github.com/gematik/spec-E-Rezept-ServiceRequest/issues).

### Rechtliche Hinweise

Dieser Implementation Guide wurde von der [gematik GmbH](https://www.gematik.de/) erstellt und veröffentlicht.

Copyright © 2025 gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von Health Level Seven International, eingetragen beim United States Patent and Trademark Office.
