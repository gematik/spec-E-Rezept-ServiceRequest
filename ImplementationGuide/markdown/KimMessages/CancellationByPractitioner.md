# Inhalt

- [KIM Ablehnung der Rezeptanforderung durch Verordnenden übermitteln](#kim-rezeptablehnung)
  - [KIM Beispielnachricht](#kim-rezeptablehnung-beispielnachricht)

## KIM Ablehnung der Rezeptanforderung durch Verordnenden übermitteln

Die FHIR-Datensätze in Anfrage- und Antwortnachrichten werden ausschließlich als Anhang in der KIM Nachricht übertragen.
**siehe unten**

|KIM-Header              |Inhalt                                 |verpflichtend|
|------------------------|---------------------------------------|-------------|
|X-KIM-Dienstkennung     |E-Rezept;Rezeptanforderung_Ablehnung;V1.0|ja|
|X-KIM-Sendersystem      |\<PS-Bezeichnung>;\<Releaseversion>   |ja|
|X-KIM-Support           |\<Support-Email-Adresse PS-Hersteller>|nein|
|Subject                 |\<T/E>ERP_MEDREQ_ABL_\<UUID>                 |ja <br />T/E: *T*estsystem (RU) / *E*chtsystem (PU)<br />UUID: cancellation bundle identifier |
|Content-Type            |application/xml;<br />name="<T/E>ERP_MEDREQ_ABL_\<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: cancellation bundle identifier <br />|
|Content-Transfer-Encoding |base64 |ja|
|Content-Disposition     |attachment; filename="<T/E>ERP_MEDREQ_ABL_\<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: cancellation bundle identifier|
|Content-Description     |ERP_MEDREQ_ABL                                |ja|

Der Anhang enthält die Ablehnung der Rezeptanforderung als FHIR-Ressource `GEM PR ERP MEDREQ Cancellation Bundle`.

### KIM Beispielnachricht

    Date: Fri, 4 Nov 2022 13:22:59 +0100 (CET)
    From: praxisamplatzdersonne@kim.telematik-test
    Reply-To: praxisamplatzdersonne@kim.telematik-test
    To: pflegeeinrichtung@kim.telematik-test
    Message-ID: <1015545854.7.1667563379500@localhost>
    Subject: TERP_MEDREQ_ABL_7a1d5187-3070-4a23-a877-162bdd4798af
    MIME-Version: 1.0
    Content-Type: multipart/mixed;
     boundary="----=_Part_6_1831919254.1667563377253"
    X-KIM-Dienstkennung: E-Rezept;Rezeptanforderung_Ablehnung;V1.0
    X-KIM-Sendersystem: UltraPVS;2.0

    ------=_Part_6_1831919254.1667563377253
    Content-Type: text/plain; charset=utf-8
    Content-Transfer-Encoding: 7bit

    Ablehnung der Rezeptanforderung TERP_MEDREQ_ABL_7a1d5187-3070-4a23-a877-162bdd4798af
    ------=_Part_6_1831919254.1667563377253
    Content-Type: application/xml;
     name=TERP_MEDREQ_ABL_7a1d5187-3070-4a23-a877-162bdd4798af.xml
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment;
     filename=TERP_MEDREQ_ABL_7a1d5187-3070-4a23-a877-162bdd4798af.xml
    Content-Description: ERP_MEDREQ_ABL

    encodiertes Beispiel von
    BASE64_ENCODE(https://simplifier.net/erezept-medicationrequest-communication/cancellationbundlefrompractitioner)

    ------=_Part_6_1831919254.1667563377253--
