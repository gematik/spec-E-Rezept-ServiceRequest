# Inhalt

- [KIM Nachrichtenkopie](#kim-nachrichtenkopie)

## KIM Nachrichtenkopie

Die verpflichtenden und freiwilligen KIM-Header Informationen sind bei den Nachrichtenkopien identisch mit denen der Originalnachricht.

Es ist vorzusehen, dass die von der Medikamentversorgung betroffene Pflegeeinrichtung eine Kopie des aktuellen Vorgangs erhält. Folgende Bedingungen gelten, damit die Einrichtung eine Nachrichtenkopie erhält:

- Die Pflegeeinrichtung ist nicht selbst Absender der KIM-Nachricht
- Die Pflegeeinrichtung ist nicht selbst Empfänger der KIM-Nachricht
- Die Pflegeeinrichtung ist diejenige, die von dem konkreten E-Rezept-Vorgang betroffen ist. Diese fachlichen Informationseinheiten bzw. Dienstkennungen können betroffen sein:
  - Rezeptanforderung / `E-Rezept;Rezeptanforderung;V1.0`
  - Rezeptanforderung_Rezeptuebermittlung / `E-Rezept;Rezeptanforderung_Rezeptuebermittlung;V1.0`
  - Rezeptanforderung_Storno / `E-Rezept;Rezeptanforderung_Storno;V1.0`
  - Rezeptanforderung_Ablehnung / `E-Rezept;Rezeptanforderung_Ablehnung;V1.0`

Dass es sich bei der empfangenen KIM-Nachricht um eine Kopie handelt, ist an folgenden Merkmalen erkennbar:
 - m1
 - m2

KIM-Nachrichten, die eines dieser Merkmale aufweisen, dürfen durch das Kopie-empfangende Primärsystem lediglich interpretiert und angezeigt werden. Eine modifizierende Satzverarbeitung der enthaltenen FHIR-Datensätze darf hingegen **nicht stattfinden**.