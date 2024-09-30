# FHIR-Implementation Guide: KIM-Nachrichten für das E-Rezept

## Allgemeine Beschreibung
Das Feature "KIM-Nachrichten für das E-Rezept" ermöglicht es, Nachrichten im Kontext des E-Rezepts ohne Beteiligung des Fachdienstes zwischen den beteiligten Akteuren zu initiieren, zu versenden und zu empfangen.

Die Übermittlung erfolgt als strukturierte FHIR-Bundles unter Verwendung der TI-Anwendung "Kommunikation im Medizinwesen" (KIM) als gesichertes Übermittlungsverfahren.
Eine ausführliche fachliche Beschreibung findet sich im dazugehörigen [Featuredokument gemF_eRp_KIM](https://gemspec.gematik.de/docs/gemF/gemF_eRp_KIM/latest/).

## Relevante Dokumente

### Feature-Dokument
Dem vorliegenden Implementation Guide (IG) liegt das [Featuredokument gemF_eRp_KIM](https://gemspec.gematik.de/docs/gemF/gemF_eRp_KIM/latest/) zugrunde. Das Dokument definiert die Anforderungen, User Stories und fachlichen Anwendungsfälle und bildet die Grundlage für diesen IG.

### FHIR-IG
Dieser Implementation Guide bietet eine kurze Einführung in das Thema sowie detaillierte technische Anweisungen zur Umsetzung der Anwendungsfälle aus dem Featuredokument. Dabei werden die fachlichen Datenmodelle, relevanten Profile und deren Anwendung beschrieben.

## Wie dieser IG zu lesen ist

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