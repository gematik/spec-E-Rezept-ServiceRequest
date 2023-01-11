# Inhalt

- [KIM Verordnungs- und Dispensierinformationen versenden](#kim-verordnungdispensierung)
  - [KIM Beispielnachricht](#kim-verordnungdispensierung-beispielnachricht)

## KIM KIM Verordnungs- und Dispensierinformationen versenden

Die FHIR-Datensätze in Anfrage- und Antwortnachrichten werden ausschließlich als Anhang in der KIM Nachricht übertragen.
**siehe unten**

|KIM-Header              |Inhalt                                 |verpflichtend|
|------------------------|---------------------------------------|-------------|
|X-KIM-Dienstkennung     |E-Rezept;Verordnung_Dispensierung;V1.0|ja|
|X-KIM-Sendersystem      |\<PS-Bezeichnung>;\<Releaseversion>   |ja|
|X-KIM-Support           |\<Support-Email-Adresse PS-Hersteller>|nein|
|Subject                 |\<T/E>ERP_MEDREQ_DIS_\<UUID>                 |ja <br />T/E: *T*estsystem (RU) / *E*chtsystem (PU)<br />UUID: dispense information bundle identifier |
|Content-Type            |application/xml;<br />name="<T/E>ERP_MEDREQ_DIS_\<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: dispense information bundle identifier <br />|
|Content-Transfer-Encoding |base64 |ja|
|Content-Disposition     |attachment; filename="<T/E>ERP_MEDREQ_DIS_\<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: dispense information bundle identifier|
|Content-Description     |ERP_MEDREQ_DIS                                |ja|

Der Anhang enthält die Verordnungs- und Dispensierungsinformation als FHIR-Ressource `GEM PR ERP MEDREQ Dispense Information Bundle`.

### KIM Beispielnachricht

    Date: Fri, 4 Nov 2022 17:59:59 +0100 (CET)
    From: ihreheimbelieferndeapotheke@kim.telematik-test
    Reply-To: ihreheimbelieferndeapotheke@kim.telematik-test
    To: pflegeeinrichtung@kim.telematik-test
    Message-ID: <1015545854.7.1667563379500@localhost>
    Subject: TERP_MEDREQ_DIS_7a1d5187-3070-4a23-a877-162bdd47007a
    MIME-Version: 1.0
    Content-Type: multipart/mixed;
     boundary="----=_Part_6_1831919254.1667563377253"
    X-KIM-Dienstkennung: E-Rezept;Verordnung_Dispensierung;V1.0
    X-KIM-Sendersystem: MyAPO;21.0.4

    ------=_Part_6_1831919254.1667563377253
    Content-Type: text/plain; charset=utf-8
    Content-Transfer-Encoding: 7bit

    Verordnungsinformationen und Dispensierinformationen TERP_MEDREQ_DIS_7a1d5187-3070-4a23-a877-162bdd47007a
    ------=_Part_6_1831919254.1667563377253
    Content-Type: application/xml;
     name=TERP_MEDREQ_DIS_7a1d5187-3070-4a23-a877-162bdd47007a.xml
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment;
     filename=TERP_MEDREQ_DIS_7a1d5187-3070-4a23-a877-162bdd47007a.xml
    Content-Description: ERP_MEDREQ_DIS

    encodiertes Beispiel von
    BASE64_ENCODE(https://simplifier.net/erezept-medicationrequest-communication/dispenseinformationbundle)

    ------=_Part_6_1831919254.1667563377253--
