
# Inhalt

- [Inhalt](#inhalt)
  - [Verwendung von KIM](#verwendung-von-kim)
  - [KIM Dienstkennungen](#kim-dienstkennungen)
  - [KIM Datenübertragung](#kim-datenübertragung)
  - [KIM Rezeptanforderung](#kim-rezeptanforderung)

## Verwendung von KIM

Die Übertragung der Daten bzw. der Anfrage erfolgt via KIM. Dabei sind vier Nachrichtentypen zu unterscheiden:

- Übermittlung der Rezeptanforderung (Anforderung)
- Übermittlung der Verordnung zu einer Rezeptanforderung  (Antwort)
- Übermittlung der Abgabeinformationen zu einer Rezeptanforderung (Abgabeinformationen)
- Stornierung/Ablehnung einer Rezeptanforderung (Stornierung)

## KIM Dienstkennungen

Dienstkennungen in KIM-Nachrichten kennzeichnen den transportierten Inhalt für das Empfangssystem. Diese erlauben damit eine Dunkelverarbeitung bei Nachrichtenempfang und ggfs. die vollautomatisierte Erstellung und den Versand einer Antwortnachricht.

|Anwendung                          |elektronische Ersatzbescheinigung (eEB)|
|:--------                          |:--------------------------------------|
|Verantwortlich                     |gematik                                |
|Anwendungsbeschreibung             |Rezeptanforderungsverfahren zur Übertragung relevanter Informationen zur Anforderung, Übertragung von Verschreibungen und resultierenden Abgabeinformationen|
|Dienstkennung & Kurzbeschreibung|**eRezept-Rezeptanforderung;Anforderung;V1.0** <br /> Nachrichten-Typ: Anfragedaten zur Anforderung einer E-Rezeptes<br /> Verwendung: Pflegeeinrichtungen, Vertragsärzte, Vertragszahnärzte, Krankenhäuser, Apotheken <br /><br />  **eRezept-Rezeptanforderung;Antwort;V1.0** <br /> Nachrichten-Typ: Verschreibung auf Grundlage einer Rezeptanforderung<br /> Verwendung: Pflegeeinrichtungen, Vertragsärzte, Vertragszahnärzte, Krankenhäuser, Apotheken <br /> <br /> **eRezept-Rezeptanforderung;Abgabeinformationen;V1.0** <br /> Nachrichten-Typ: Abgabeinformationen zu einer Abgabe ausgeläst durch eine Rezeptanforderung<br />  Verwendung: Pflegeeinrichtungen, Apotheken <br /> <br /> **eRezept-Rezeptanforderung;Stornierung;V1.0** <br /> Nachrichten-Typ: Stornierung/Ablehnung einer Rezeptanforderung<br />  Verwendung: Pflegeeinrichtungen, Vertragsärzte, Vertragszahnärzte, Krankenhäuser, Apotheken<br /> <br /> **eRezept-Rezeptanforderung;Eingangsbestaetigung;V1.0** <br /> Nachrichten-Typ: Eingangsbestätigung (MDN) zu einer Nachricht<br />  Verwendung: Pflegeeinrichtungen, Vertragsärzte, Vertragszahnärzte, Krankenhäuser, Apotheken|

## KIM Datenübertragung

Die FHIR-Datensätze in Anfrage- und Antwortnachrichten werden ausschließlich als Anhang in der KIM Nachricht übertragen.
