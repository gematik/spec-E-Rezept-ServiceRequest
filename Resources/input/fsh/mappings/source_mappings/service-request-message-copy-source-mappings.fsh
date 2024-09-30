Mapping: GEM_ERP_SR_LOG_MessageCopySourceMapping
Source: GEM_ERP_SR_LOG_MessageCopy
Id: Quelle-Message-Copy-Mapping
Title: "Quelle der Informationen für die Nachrichtenkopie"
Description: "Beschreibt die Quelle der Informationen für die Nachrichtenkopie. Diese werden immer versendet, wenn die Rezeptanforderung und deren Bestätigung zwischen Arzt und Apotheke ausgetauscht werden."

// MetaDaten
* MetaDaten -> "Erstellendes PS"
  * Empfaenger -> "VZD oder Rezeptanforderung" "Wenn die Nachricht initial erstellt wird kann die Apotheke die Informationen aus dem System oder VZD beziehen. Der Verordnende kann die Informationen aus der Rezeptanforderung beziehen."
    * KIMAdresse -> "VZD oder Rezeptanforderung" "Wenn die Nachricht initial erstellt wird kann die Apotheke die Informationen aus dem System oder VZD beziehen. Der Verordnende kann die Informationen aus der Rezeptanforderung beziehen."
    * TelematikID -> "VZD oder Rezeptanforderung" "Wenn die Nachricht initial erstellt wird kann die Apotheke die Informationen aus dem System oder VZD beziehen. Der Verordnende kann die Informationen aus der Rezeptanforderung beziehen."
  * Absender -> "Erstellendes PS"
    * TelematikID -> "Erstellendes PS, SMC-B oder HBA Zertifikat"
    * Name -> "Erstellendes PS"
  * AbsendendesSystem -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Name -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Software -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Version -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * EMailKontakt -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Website -> "Erstellendes PS" "Automatisiert durch Software gesetzt"

* IndikatorKopie -> "Erstellendes PS"
* Anforderungsinformationen -> "FHIR-Datensatz der zum Empfänger des Originals geschickt wird"