
# Inhalt

- [Inhalt](#inhalt)
  - [Verwendung von KIM](#verwendung-von-kim)
  - [KIM Dienstkennungen](#kim-dienstkennungen)
  - [KIM Datenübertragung](#kim-datenübertragung)
  - [KIM Rezeptanforderung](#kim-rezeptanforderung)
  - [Übertragung von Klartextinformationen](#kim-klartext)

## Verwendung von KIM

Die Übertragung der Daten bzw. der Anfrage erfolgt via KIM. Dabei sind vier Nachrichtentypen zu unterscheiden:

- Übermittlung der Rezeptanforderung (Anforderung)
- Übermittlung der Verordnung zu einer Rezeptanforderung  (Antwort)
- Übermittlung der Abgabeinformationen zu einer Rezeptanforderung (Abgabeinformationen)
- Stornierung/Ablehnung einer Rezeptanforderung (Stornierung)

## KIM Dienstkennungen

Dienstkennungen in KIM-Nachrichten kennzeichnen den transportierten Inhalt für das Empfangssystem. Diese erlauben damit eine Dunkelverarbeitung bei Nachrichtenempfang und ggfs. die vollautomatisierte Erstellung und den Versand einer Antwortnachricht.

|Anwendung                          |E-Rezept|
|:--------                          |:--------------------------------------|
|Verantwortlich                     |gematik                                |
|Anwendungsbeschreibung             |Rezeptanforderungsverfahren zur Übertragung relevanter Informationen zur Anforderung, Übertragung von Verschreibungen und resultierenden Abgabeinformationen|
|Dienstkennung & Kurzbeschreibung|**E-Rezept;Rezeptanforderung;V1.0** <br /> Nachrichten-Typ: Anfragedaten zur Anforderung einer E-Rezeptes<br /> Verwendung: Pflegeeinrichtungen, Vertragsärzte, Vertragszahnärzte, Krankenhäuser, Apotheken <br /><br /> **E-Rezept;Rezeptanforderung_Rezeptuebermittlung;V1.0** <br /> Nachrichten-Typ: Auf eine Rezeptanforderung beruhende elektronische Verordnung<br /> Verwendung: Pflegeeinrichtungen, Vertragsärzte, Vertragszahnärzte, Krankenhäuser, Apotheken <br /> <br /> **E-Rezept;Verordnung_Dispensierung;V1.0** <br /> Nachrichten-Typ: Abgabeinformationen zu einer Abgabe ausgelöst durch eine Verordnung und eine Abgabe<br /> Verwendung: Pflegeeinrichtungen, Apotheken <br /> <br /> **E-Rezept;Rezeptanforderung_Storno;V1.0** <br /> Nachrichten-Typ: Stornierung einer Rezeptanforderung<br /> Verwendung: Pflegeeinrichtungen, Vertragsärzte, Vertragszahnärzte, Krankenhäuser, Apotheken <br /> <br /> **E-Rezept;Rezeptanforderung_Ablehnung;V1.0** <br /> Nachrichten-Typ: Ablehnung einer Rezeptanforderung<br /> Verwendung: Pflegeeinrichtungen, Vertragsärzte, Vertragszahnärzte, Krankenhäuser, Apotheken|

## KIM Datenübertragung

Die FHIR-Datensätze in Anfrage- und Antwortnachrichten werden ausschließlich als Anhang in der KIM Nachricht übertragen.

## Übertragung von Klartextinformationen

Es ist vorzusehen, dass neben dem Anhang (FHIR-Datensätze in XML-Auszeichnung) eine zusätzliche, für Menschen leichter lesbare Repräsentation der wichtigsten übermittelten Informationen als Plain-Text, in einer KIM Nachricht übertragen werden. Dadurch ist es möglich, dass ein Mitarbeiter der empfangenden Leisterungserbringerinstitution die Initiative übernehmen kann, falls das empfangende Primärsystem (noch) nicht in der Lage ist, die FHIR-Datensätze der Nachricht automatisiert zu verarbeiten und zu präsentieren.

Die Darstellung der Informationen erfolgt im KIM-Nachrichtensegment `Content-Type: text/plain` nach der Zeichenkette für Nachrichtentyp und Nachrichten-ID. Welche Informationen darzustellen sind, ist der [Mappingtabelle](https://simplifier.net/guide/Implementierungsleitfaden-ERP-Rezeptanforderung/ImplementationGuide-markdown-Mappingtable?version=current) zu entnehmen. Der jeweilige Nachrichtentyp ist über das Informationsobjekt 1. Ebene abgegrenzt (Rezeptanforderung, Rezeptanforderung_Storno, Rezeptanforderung_Rezeptuebermittlung, Rezeptanforderung_Ablehnung, Verordnung_Dispensierung).

Die Darstellung erfolgt als Schlüssel-/Wertpaar in der Form

    <Bezeichner>:
    <Wert>

Als Schlüssel (Bezeichner der Informationseinheit) wird das Informationsobjekt 2. Ebene verwendet und, sofern vorhanden, das Informationsobjekt 3. Ebene. Anschließend folgt als Trenner ein `:CRLF` (Doppelpunkt und Zeilenumbruch), gefolgt vom konkreten Wert der Informationseinheit.

Beispiel zweier Schlüssel-/Wertpaar aus einer Rezeptanforderung:

    Praeparat Bezeichnung:
    Ibuprofen akut 1500

    Praeparat Packungsgroesse:
    250 Stck

Es wird perspektivisch davon ausgegangen, dass die in den Use Cases beschriebenen Primärsysteme die Erzeugung, Verarbeitung und Aufbereitung der entsprechenden FHIR-Datensätze durchführen werden entsprechend des Umsetzungsvorschlags des technischen Konzepts und der Bedarf an diese Form der Klartextdarstellung der Informationen sukzessive abnimmt.
