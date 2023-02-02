# Inhalt

- [KIM Nachrichtenkopie](#kim-nachrichtenkopie)

## KIM Nachrichtenkopie

Die verpflichtenden und freiwilligen KIM-Header Informationen sind bei den Nachrichtenkopien identisch mit denen der Originalnachricht. Gleiches gilt für alle weitere Bestandteile der KIM-Nachricht.

Es ist vorzusehen, dass die von der Medikamentversorgung betroffene Pflegeeinrichtung eines Versicherten eine Kopie von Nachrichten des aktuellen Vorgangs erhält.

Folgende Bedingungen gelten, damit die Einrichtung eine Nachrichtenkopie erhält:

- Die Pflegeeinrichtung ist nicht selbst Absender der KIM-Nachricht
- Die Pflegeeinrichtung ist nicht selbst Adressat der KIM-Nachricht
- Die Pflegeeinrichtung ist diejenige, die von dem konkreten E-Rezept-Vorgang betroffen ist. Folgende fachlichen Informationseinheiten bzw. Dienstkennungen können betroffen sein:
  - Rezeptanforderung / `E-Rezept;Rezeptanforderung;V1.0`
  - Rezeptanforderung_Rezeptuebermittlung / `E-Rezept;Rezeptanforderung_Rezeptuebermittlung;V1.0`
  - Rezeptanforderung_Storno / `E-Rezept;Rezeptanforderung_Storno;V1.0`
  - Rezeptanforderung_Ablehnung / `E-Rezept;Rezeptanforderung_Ablehnung;V1.0`

Dass es sich bei der empfangenen KIM-Nachricht um eine Kopie handelt, ist an folgenden Merkmalen erkennbar:
 - Das Element `MessageHeader.destination.receiver` der inkludierten FHIR-Nachricht entspricht inhaltlich nicht dem Kopieempfänger. Ist ein Empfänger nicht ausdrücklich in diesem Element genannt, ist er Kopieempfänger.
 - Das Header Field `cc` aus dem Segment `Destination Address Fields` einer KIM-Nachricht enthält die KIM-Adresse des Empfängers. Ist der Empfänger in diesem Header Field enthalten, so handelt es sich ebenfalls um einen Kopieempfänger.

KIM-Nachrichten, die eines dieser Merkmale aufweisen, dürfen durch das Kopie-empfangende Primärsystem lediglich interpretiert und angezeigt werden. Eine modifizierende Satzverarbeitung der enthaltenen FHIR-Datensätze sowie eine Teilnahme an weiteren Vorgangsschritten darf hingegen **nicht stattfinden**.