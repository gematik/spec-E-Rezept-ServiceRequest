# {{page-title}}

Generell sind die hier spezifizierten FHIR Ressourcen unabhängig vom gewählten Transportmedium. Dennoch basiert diese FHIR Spezifikation auf dem [App-Transport-Framework](https://simplifier.net/app-transport-framework/~guides) der gematik.

Weitere Festlegungen und Spezifikationen sind dem entsprechenden Implementierungsleitfaden zu entnehmen.

Insbesondere ist zu beachten, dass nachdem eine Nachricht im System angekommen ist das System mit einer Bestätigung antworten SOLL. Diese Bestätigung enthält die Information, ob die übermittelten FHIR-Ressourcen interpretiert werden konnten und eine weiterverarbeitung im empfangenden System möglich ist.

## Präferiertes Transportmedium

Leistungserbringer, die diese FHIR-Spezifikation nutzen, sind Teilnehmer der TI (Telematikinfrastruktur). Daher wird empfohlen KIM (Kommunikation im Medizinwesen) und zukünftig auch TIM (Telematikinfrastruktur-Messenger) als sicheres Austauschmedium dieser FHIR-Objekte zu verwenden.

KIM und TIM bieten sicheren und standardisierten Austausch von FHIR-Objekten innerhalb der Telematikinfrastruktur. Sie gewährleisten Vertraulichkeit, Integrität und Nachverfolgbarkeit der Kommunikation, was zur Effizienzsteigerung und Verbesserung der Patientenversorgung beiträgt.
