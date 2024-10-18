## {{page-title}}

|Im Rahmen der Veröffentlichung wird das [Semantic Versioning](https://semver.org/lang/de/) verwendet.

Die erste Ziffer X bezeichnet ein Major-Release und regelt die Gültigkeit von Releases. Die dritte Ziffer Y (Release x.0.y) bezeichnet eine technische Korrektur und versioniert kleinere Änderungen (Packages) während eines Jahres, z. B. 1.0.1.

| Datum | Version | Kommentar | Dokumente
|---|---|---|---|
|03.04.2023| 1.0.0 | Initialer Release | |
| 21.02.2024 | 1.0.1 | <ul><li>ATF Abhängigkeit auf 1.0.4 aktualisiert</li><li>Einschränkungen für Referenzen entfernt, Anforderungen im IG</li><ul><li>`ERPServiceRequestMedicationRequest`</li><ul><li>`medicationReference`</li><li>`subject`</li><li>`requester`</li><li>`insurance`</li></ul><li>`ERPServiceRequestPrescriptionRequest`</li><ul><li>`subject`</li><li>`requester`</li><li>`performer`</li></ul><li>`ERPServiceRequestDispenseRequest`</li><ul><li>`subject`</li><li>`supportingInfo:AbgabeDaten`</li></ul></ul><li>Entfernen der Einschränkung auf `meta.profile` für</li><ul><li>`ERPServiceRequestMessageContainer`</li><li>`ERPServiceRequestRequestHeader`</li></ul></ul> | |
|19.03.2023| 1.1.0 | <ul><li>ATF Abhängigkeit auf 1.3.0 aktualisiert</li><li>Verbesserungen am Implementation Guide</li></ul> | <ul><li>[Feature Dokument 1.1.0](https://fachportal.gematik.de/fileadmin/Fachportal/Downloadcenter/Vorabveroeffentlichungen/Medical/gemF_eRp_KIM_V1.1.0_Aend.pdf)</li><li>[FHIR-IG 1.1.0](https://simplifier.net/guide/erp-servicerequest-implementation-guide?version=1.1.0)</li></ul> |

