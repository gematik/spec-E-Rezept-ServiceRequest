Mapping: GEM_ERP_SR_LOG_DispenseRequestConfirmationSourceMapping
Source: GEM_ERP_SR_LOG_DispenseRequest_Confirmation
Id: Quelle-Dispensieranforderung-Bestaetigung-Mapping
Title: "Quelle der Dispensieranforderung Bestätigung Informationen"
Description: "Beschreibt die Quelle der Dispensieranforderung Bestätigung Informatione"

// MetaDaten
* MetaDaten -> "Erstellendes AVS"
  * Empfaenger -> "Aus initialer Dispensieranforderung"
    * KIMAdresse -> "Aus initialer Dispensieranforderung (KIM Nachricht)"
    * TelematikID -> "Aus initialer Dispensieranforderung"
  * Absender -> "Erstellendes AVS"
    * TelematikID -> "Erstellendes AVS, SMC-B oder HBA Zertifikat"
    * Name -> "Erstellendes AVS"
  * AbsendendesSystem -> "Erstellendes AVS" "Automatisiert durch Software gesetzt"
    * Name -> "Erstellendes AVS" "Automatisiert durch Software gesetzt"
    * Software -> "Erstellendes AVS" "Automatisiert durch Software gesetzt"
    * Version -> "Erstellendes AVS" "Automatisiert durch Software gesetzt"
    * EMailKontakt -> "Erstellendes AVS" "Automatisiert durch Software gesetzt"
    * Website -> "Erstellendes AVS" "Automatisiert durch Software gesetzt"

// Administrative Informationen
* Status -> "AVS" "Setzt den Status der Anfrage auf 'completed'"
* VorgangsID -> "Dispensieranforderung" "VorgangsID aus der initialen Dispensieranforderung"

* Freitext -> "Nutzer des AVS" "Abfrage im Moment der Bestätigung"
    
* Anhaenge -> "Nutzer" "Angabe im Moment der Bestätigung"

// Medizinische Informationen
* Medikation -> "AVS" "Informationen aus Abgabedatensatz"
  * MedizinischeInformationenAusVerordnung -> "AVS" "Informationen aus Abgabedatensatz (MedicationRequest und Medication)"