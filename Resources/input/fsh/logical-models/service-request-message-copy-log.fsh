Logical: GEM_ERP_SR_LOG_MessageCopy
Parent: Element
Id: gem-erp-sr-log-message-copy
Title: "Logical ServiceRequest_Nachricht_Kopie"
Description: "Fachliches Modell zur Beschreibung einer Kopie für die Pflegeeinrichtung."
* insert Versioning
* insert RS_LOG_MessageHeader

* IndikatorKopie 0..1 boolean "Indikator Kopie" "Indikator, ob es sich um eine Kopie handelt."
* ArtDerKopie 1..1 code "Art der Kopie" """
Auswahl aus: 
- Rezeptanforderung
- Rezeptanforderung_Stornierung
- Rezeptanforderung_Bestätigung 
"""
* Anforderungsinformationen 1..1 Bundle "Anforderungsinformationen" """
Kopie der Informationen die ursprünglich übertragen wurden. Siehe
- [Logical Model Rezeptanforderung](https://simplifier.net/erezept-servicerequest/gem-erp-sr-log-prescription-request)
- [Logical Model Rezeptanforderung_Storno](https://simplifier.net/erezept-servicerequest/gem-erp-sr-log-prescription-request-cancellation)
- [Logical Model Rezeptanforderung_Bestätigung](https://simplifier.net/erezept-servicerequest/gem-erp-sr-log-prescription-request-confirmation)
"""