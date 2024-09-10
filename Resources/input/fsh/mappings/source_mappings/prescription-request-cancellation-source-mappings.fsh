Mapping: GEM_ERP_SR_LOG_PrescriptionRequestCancellationSourceMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation
Id: Quelle-Rezeptanforderung-Stornierung-Mapping
Title: "Quelle der Rezeptanforderung Stornierung Informationen"
Description: "Beschreibt die Quelle der Rezeptanforderung Stornierung Informatione"

// MetaDaten
* MetaDaten -> "Erstellendes PS"
  * Empfaenger -> "Aus initialer Rezeptanforderung"
    * KIMAdresse -> "Aus initialer Rezeptanforderung"
    * TelematikID -> "Aus initialer Rezeptanforderung"
  * Absender -> "Erstellendes PS"
    * TelematikID -> "Erstellendes PS, SMC-B oder HBA Zertifikat"
    * Name -> "Erstellendes PS"
  * AbsendendesSystem -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Name -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Software -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Version -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * EMailKontakt -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Website -> "Erstellendes PS" "Automatisiert durch Software gesetzt"

// Administrative Informationen
* Status -> "PS" "Setzt den Status der Anfrage auf 'revoked'"
* Grund -> "Nutzer des PS" "Abfrage im Moment der Stornierung"
* VorgangsID -> "PS" "Aus initialer Rezeptanforderung"