Mapping: GEM_ERP_SR_LOG_PrescriptionRequestConfirmationSourceMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation
Id: Quelle-Rezeptanforderung-Bestaetigung-Mapping
Title: "Quelle der Rezeptanforderung Bestätigung Informationen"
Description: "Beschreibt die Quelle der Rezeptanforderung Bestätigung Informatione"

// MetaDaten
* MetaDaten -> "Erstellendes PVS"
  * Empfaenger -> "Aus initialer Rezeptanforderung"
    * KIMAdresse -> "Aus initialer Rezeptanforderung (KIM Nachricht)"
    * TelematikID -> "Aus initialer Rezeptanforderung"
  * Absender -> "Erstellendes PVS"
    * TelematikID -> "Erstellendes PVS, SMC-B oder HBA Zertifikat"
    * Name -> "Erstellendes PVS"
  * AbsendendesSystem -> "Erstellendes PVS" "Automatisiert durch Software gesetzt"
    * Name -> "Erstellendes PVS" "Automatisiert durch Software gesetzt"
    * Software -> "Erstellendes PVS" "Automatisiert durch Software gesetzt"
    * Version -> "Erstellendes PVS" "Automatisiert durch Software gesetzt"
    * EMailKontakt -> "Erstellendes PVS" "Automatisiert durch Software gesetzt"
    * Website -> "Erstellendes PVS" "Automatisiert durch Software gesetzt"

// Administrative Informationen
* ERezeptToken -> "E-Rezept-Fachdienst" "Token lässt sich aus den Informationen des E-Rezept Fachdienstes erzeugen"
* VersichertenEinloesung -> "Rezeptanforderung" "Aus der initialen Rezeptanforderung"
* Status -> "PVS" "Setzt den Status der Anfrage auf 'completed'"
* VorgangsID -> "Rezeptanforderung" "VorgangsID aus der initialen Rezeptanforderung"

* Freitext -> "Nutzer des PVS" "Abfrage im Moment der Bestätigung"
    
* Anhaenge -> "Nutzer oder PVS" "Angabe im Moment der Bestätigung"
  * Medikationsplan -> "Nutzer oder PVS" "Aktualisierung und ggf. automatische Generierung vom PVS"
  * weitereAnhaenge -> "Nutzer oder PVS"

// Medizinische Informationen
* Medikation -> "PVS" "Informationen aus Verordnungsdatensatz"
  * MedizinischeInformationenAusVerordnung -> "PVS" "Informationen aus Verordnungsdatensatz (MedicationRequest und Medication)"