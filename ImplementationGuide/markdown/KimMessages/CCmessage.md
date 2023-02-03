# Inhalt

- [KIM Nachrichtenkopie für Pflegeeinrichtungen](#kim-nachrichtenkopie-pflege)
  - [Verarbeitungsregeln](#verarbeitungsregeln-pflege)
- [KIM Nachrichtenkopie für verordnende Leistungserbringer](#kim-nachrichtenkopie-aerzte)
  - [Verarbeitungsregeln](#verarbeitungsregeln-aerzte)

## KIM Nachrichtenkopie für Pflegeeinrichtungen

Die verpflichtenden und freiwilligen KIM-Header Informationen sind bei den Nachrichtenkopien für Pflegeeinrichtungen identisch mit denen der Originalnachricht. Gleiches gilt für alle weitere Bestandteile der KIM-Nachricht.

Es ist vorzusehen, dass die von der Medikamentversorgung betroffene Pflegeeinrichtung eines Versicherten eine Kopie von Nachrichten des aktuellen Vorgangs erhält. Dazu wird die KIM-Adresse der betroffenen Pflegeeinrichtung im KIM Header Field `cc` hinterlegt.

Beispiel:

    Date: Fri, 4 Nov 2022 13:22:59 +0100 (CET)
    From: praxisamplatzdersonne@kim.telematik-test
    Reply-To: praxisamplatzdersonne@kim.telematik-test
    To: ihreheimbelieferndeapotheke@kim.telematik-test
    Cc: pflegeeinrichtung@kim.telematik-test

Folgende Bedingungen gelten, damit die Pflegeeinrichtung eine Nachrichtenkopie erhält:

- Die Pflegeeinrichtung ist nicht selbst Absender der KIM-Nachricht
- Die Pflegeeinrichtung ist nicht selbst Adressat der KIM-Nachricht
- Die Pflegeeinrichtung ist diejenige, die von dem konkreten E-Rezept-Vorgang betroffen ist. Folgende fachlichen Informationseinheiten bzw. Dienstkennungen können aufgrund der Use Cases des fachlichen Konzepts betroffen sein:
  - Rezeptanforderung / `E-Rezept;Rezeptanforderung;V1.0`
  - Rezeptanforderung_Rezeptuebermittlung / `E-Rezept;Rezeptanforderung_Rezeptuebermittlung;V1.0`
  - Rezeptanforderung_Storno / `E-Rezept;Rezeptanforderung_Storno;V1.0`
  - Rezeptanforderung_Ablehnung / `E-Rezept;Rezeptanforderung_Ablehnung;V1.0`

Dass es sich bei der empfangenen KIM-Nachricht um eine Kopie handelt, ist an folgenden Merkmalen erkennbar:
 - Das Element `MessageHeader.destination.receiver` der inkludierten FHIR-Nachricht entspricht inhaltlich nicht dem Kopieempfänger. Ist ein Empfänger nicht ausdrücklich in diesem Element genannt, ist er Kopieempfänger.
 - Das KIM Header Field `cc` einer KIM-Nachricht enthält die KIM-Adresse des Empfängers. Ist der Empfänger in diesem Header Field enthalten, so handelt es sich ebenfalls um einen Kopieempfänger.

### Verarbeitungsregeln

KIM-Nachrichten, die eines dieser Merkmale aufweisen, dürfen durch das Kopie-empfangende Primärsystem lediglich interpretiert und angezeigt werden. Eine modifizierende Satzverarbeitung der enthaltenen FHIR-Datensätze sowie eine Teilnahme an weiteren Vorgangsschritten darf hingegen **nicht stattfinden**.

## KIM Nachrichtenkopie für verordnende Leistungserbringer

Die verpflichtenden und freiwilligen KIM-Header Informationen sind bei den Nachrichtenkopien für verordnende Leistungserbringer identisch mit denen der Originalnachricht. Gleiches gilt für alle weitere Bestandteile der KIM-Nachricht.

Es ist vorzusehen, dass der verordnende Leistungserbringer eines Versicherten eine Kopie von Nachrichten mit Verordnungs- und Dispensierinformationen des aktuellen Vorgangs erhält. Dazu wird die KIM-Adresse des verordnenden Leistungserbringers im KIM Header Field `cc` hinterlegt.

Beispiel:

    Date: Fri, 4 Nov 2022 17:02:59 +0100 (CET)
    From: ihreheimbelieferndeapotheke@kim.telematik-test
    Reply-To: ihreheimbelieferndeapotheke@kim.telematik-test
    To: pflegeeinrichtung@kim.telematik-test
    Cc: praxisamplatzdersonne@kim.telematik-test

Folgende Bedingungen gelten, damit der verordnende Leistungserbringer eine Nachrichtenkopie erhält:

- Der verordnende Leistungserbringer oder dessen LEI ist nicht selbst Absender der KIM-Nachricht
- Der verordnende Leistungserbringer oder dessen LEI ist nicht selbst Adressat der KIM-Nachricht
- Der verordnende Leistungserbringer ist derjenige, die von dem konkreten E-Rezept-Vorgang die Rezeptausstellung durchgeführt hat. Folgende fachlichen Informationseinheit bzw. Dienstkennung kann aufgrund der Use Cases des fachlichen Konzepts betroffen sein:
  - Verordnung_Dispensierung / `E-Rezept;Verordnung_Dispensierung;V1.0`

Dass es sich bei der empfangenen KIM-Nachricht um eine Kopie handelt, ist an folgenden Merkmalen erkennbar:

- Das Element `MessageHeader.destination.receiver` der inkludierten FHIR-Nachricht entspricht inhaltlich nicht dem Kopieempfänger. Ist ein Empfänger nicht ausdrücklich in diesem Element genannt, ist er Kopieempfänger.
- Das KIM Header Field `cc` einer KIM-Nachricht enthält die KIM-Adresse des Empfängers. Ist der Empfänger in diesem Header Field enthalten, so handelt es sich ebenfalls um einen Kopieempfänger.

### Verarbeitungsregeln

KIM-Nachrichten, die eines dieser Merkmale aufweisen, dürfen durch das Kopie-empfangende Patientenverwaltungssystem lediglich interpretiert und angezeigt werden. Eine modifizierende Satzverarbeitung der enthaltenen FHIR-Datensätze sowie eine Teilnahme an weiteren Vorgangsschritten darf hingegen **nicht stattfinden**.
