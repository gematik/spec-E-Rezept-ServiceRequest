# Inhalt

- [KIM Rezeptanforderung](#kim-rezeptanforderung)
  - [KIM Rezeptanforderung Beispielnachricht](#kim-rezeptanforderung-beispielnachricht)

## KIM Rezeptanforderung

Die FHIR-Datensätze in Anfrage- und Antwortnachrichten werden ausschließlich als Anhang in der KIM Nachricht übertragen.
**siehe unten**

|KIM-Header              |Inhalt                                 |verpflichtend|
|------------------------|---------------------------------------|-------------|
|X-KIM-Dienstkennung     |E-Rezept;Rezeptanforderung;V1.0|ja|
|X-KIM-Sendersystem      |\<PS-Bezeichnung>;\<Releaseversion>   |ja|
|X-KIM-Support           |\<Support-Email-Adresse PS-Hersteller>|nein|
|Subject                 |\<T/E>ERP_MEDREQ_ANF_\<UUID>                 |ja <br />T/E: *T*estsystem (RU) / *E*chtsystem (PU)<br />UUID: request bundle-identifier |
|Content-Type            | application/xml;<br />name="<T/E>ERP_MEDREQ_ANF_<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: request bundle-identifier <br />
|Content-Transfer-Encoding |base64 |ja|
|Content-Disposition     |attachment; filename="<T/E>ERP_MEDREQ_ANF_<UUID>.xml" |ja<br />T/E: Testsystem (RU) / Echtsystem (PU)<br />UUID: request bundle-identifier|
|Content-Description     |ERP_MEDREQ_ANF                                |ja|
Der Anhang enthält die Anfrage als FHIR-Ressource `GEM PR ERP MEDREQ Request Bundle`

### KIM Rezeptanforderung Beispielnachricht

    Date: Fri, 4 Nov 2022 13:02:59 +0100 (CET)
    From: pflegeeinrichtung@kim.telematik-test
    Reply-To: pflegeeinrichtung@kim.telematik-test
    To: praxisamplatzdersonne@kim.telematik-test
    Message-ID: <1015545854.7.1667563379499@localhost>
    Subject: TERP_MEDREQ_ANF_7a1d5187-3070-4a23-a877-162bdd479b9b
    MIME-Version: 1.0
    Content-Type: multipart/mixed;
     boundary="----=_Part_6_1831919254.1667563379306"
    X-KIM-Dienstkennung: E-Rezept;Rezeptanforderung;V1.0
    X-KIM-Sendersystem: SmartPlegeTI;1.8.0

    ------=_Part_6_1831919254.1667563379306
    Content-Type: text/plain; charset=utf-8
    Content-Transfer-Encoding: 7bit

    Rezeptanforderung TERP_MEDREQ_ANF_7a1d5187-3070-4a23-a877-162bdd479b9b
    ------=_Part_6_1831919254.1667563379306
    Content-Type: application/xml;
     name=TERP_MEDREQ_ANF_7a1d5187-3070-4a23-a877-162bdd479b9b.xml
    Content-Transfer-Encoding: base64
    Content-Disposition: attachment;
     filename=TERP_MEDREQ_ANF_7a1d5187-3070-4a23-a877-162bdd479b9b.xml
    Content-Description: ERP_MEDREQ_ANF

    RGllc2VzIGlzdCBlaW4gZW5jb2RpZXJ0ZXMgQmVpc3BpZWwgZGVyIGVudHNwcmVjaGVuZGVuIHRy
    YW5zcG9ydGllcnRlbiBGSElSIE5hY2hyaWNodC4gRGllIGpld2VpbGlnZSBCZWlzcGllbG5hY2hy
    aWNodCBiZWZpbmRldCBzaWNoIGhpZXI6IGh0dHBzOi8vc2ltcGxpZmllci5uZXQvZXJlemVwdC1t
    ZWRpY2F0aW9ucmVxdWVzdC1jb21tdW5pY2F0aW9uL35yZXNvdXJjZXM/Y2F0ZWdvcnk9RXhhbXBs
    ZSZmaGlyVmVyc2lvbj1SNCZzb3J0Qnk9UmFua1Njb3JlX2Rlc2M=
    ------=_Part_6_1831919254.1667563379306--
