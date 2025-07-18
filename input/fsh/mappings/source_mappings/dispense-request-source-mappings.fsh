Mapping: GEM_ERP_SR_LOG_DispenseRequestSourceMapping
Source: GEM_ERP_SR_LOG_DispenseRequest
Id: Quelle-Dispensieranforderung-Mapping
Title: "Quelle der Dispensieranforderungsinformationen"
Description: "Beschreibt die Quelle der Dispensieranforderungsinformationen. Wird von der Pflegeeinrichtung zur Anforderung zur Abgabe von Arzneimitteln verwendet."

// MetaDaten
* MetaDaten -> "Erstellendes PS" "Pflegesystem"
  * Empfaenger -> "Aus Kontaktmanagement oder VZD Suche"
    * KIMAdresse -> "Aus Kontaktmanagement oder VZD Suche"
    * TelematikID -> "Aus Kontaktmanagement oder VZD Suche"
  * Absender -> "Erstellendes PS" "Pflegesystem"
    * TelematikID -> "Erstellendes PS, SMC-B Zertifikat"
    * Name -> "Erstellendes PS"
  * AbsendendesSystem -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Name -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Software -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Version -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * EMailKontakt -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Website -> "Erstellendes PS" "Automatisiert durch Software gesetzt"

// Administrative Informationen
* Status -> "Anfragendes PS" "Setzt den Status der Anfrage auf 'active'"
* VorgangsID -> "Initiale Rezeptanforderung"
* ERezeptToken -> "Rezeptanforderung_Bestätigung" "Wurde vom verordnenden Arzt bereitgestellt"

* involvierteParteien
  * Anfragender -> "Anfragendes PS"
    * Name -> "Anfragendes PS"
    * Adresse -> "Anfragendes PS"
    * Telefon -> "Anfragendes PS"

* Freitext -> "Nutzer des PS" "Abfrage im Moment der Anforderung"

* Prioritaet -> "Nutzer des PS" "Abfrage im Moment der Anforderung"
  * PrioritaetCode -> "Nutzer des PS" "Abfrage im Moment der Anforderung"
    
* Anhaenge -> "Nutzer oder PS" "Angabe im Moment der Bestätigung"
  * Medikationsplan -> "Nutzer, PS oder Rezeptanforderung_Bestätigung" "Aktualisierung und ggf. automatische Generierung vom PS"
  * weitereAnhaenge -> "Nutzer oder PS"
