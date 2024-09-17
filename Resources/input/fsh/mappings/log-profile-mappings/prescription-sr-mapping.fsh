Mapping: RezeptanforderungFachlichesMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest
Target: "ERPServiceRequestPrescriptionRequest"
Id: Rezeptanforderung-Fachliches-Mapping
Title: "Rezeptanforderung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_PrescriptionRequest auf das FHIR-Modell ERPServiceRequestPrescriptionRequest"

// MetaDaten
* MetaDaten -> "ERPServiceRequestRequestHeader"
  * Empfaenger -> "destination"
    * KIMAdresse -> "endpoint"
    * TelematikID -> "receiver.identifier.value"
  * Absender -> "ERPServiceRequestRequestHeader"
    * TelematikID -> "ERPServiceRequestRequestHeader.sender.identifier.value"
    * Name -> "ERPServiceRequestRequestHeader.sender.display"
  * AbsendendesSystem -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Name -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Software -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Version -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * EMailKontakt -> "Erstellendes PS" "Automatisiert durch Software gesetzt"
    * Website -> "Erstellendes PS" "Automatisiert durch Software gesetzt"

// Administrative Informationen
* Status -> "Anfragendes PS" "Setzt den Status der Anfrage auf 'active'"
* VorgangsID -> "Anfragendes PS" "Erzeugt einen Vorgang und generiert eine VorgangsID"
* VorherigeRezeptID -> "Anfragendes PS" "Kann aus dem Medikamentenmanagement abgefragt werden"

* involvierteParteien -> ""
  * PatientenInformationen -> "Anfragendes PS" "Abfrage aus Stammdatenmanagement"
    * PatientenIdentifierKVNR -> "Anfragendes PS"
    * PatientenName -> "Anfragendes PS"
    * PatientenGeburtstag -> "Anfragendes PS"

  * VerordnenderArzt -> "Anfragendes PS" "Falls vorher bekannt aus Kontaktmanagement oder vorheriger RezeptID"
    * LANR -> "Anfragendes PS"
    * Name -> "Anfragendes PS"

  * Anfragender -> "Anfragendes PS"
    * Name -> "Anfragendes PS"
    * Adresse -> "Anfragendes PS"
    * Telefon -> "Anfragendes PS"

  * PflegeeinrichtungKopie -> "Anfragendes AVS" "Im Fall, dass die Apotheke die Anfrage initiiert"
    * Name -> "Anfragendes AVS"
    * Telefon -> "Anfragendes AVS"
    * KIMAdresse -> "Anfragendes AVS"

* Freitext -> "Nutzer des PS" "Abfrage im Moment der Anforderung"

* GrundDerAnforderung -> "Nutzer des PS" "Abfrage im Moment der Anforderung"
  * GrundCode -> "Nutzer des PS" "Abfrage im Moment der Anforderung"
  * GrundText -> "Nutzer des PS" "Abfrage im Moment der Anforderung"

* Prioritaet -> "Nutzer des PS" "Abfrage im Moment der Anforderung"
  * PrioritaetCode -> "Nutzer des PS" "Abfrage im Moment der Anforderung"

* Restreichweite -> "Anfragendes PS oder Nutzer des PS" "Abfrage/ Eingabe im Moment der Anforderung"
  * Freitext -> "Nutzer des PS" "Abfrage im Moment der Anforderung"
  * Einheit -> "Anfragendes PS" "Ggf. automatisierte Berechnung"
  * Wert -> "Anfragendes PS" "Ggf. automatisierte Berechnung"
    
* Anhaenge -> "Anfragendes PS oder Nutzer des PS" "Generierung oder Bereitstellung im Moment der Anforderung"

// Medizinische Informationen
* Medikation -> "Anfragendes PS oder Nutzer des PS" "Bereitstellung aus Medikamentenmanagement"
  * MedikationsReferenz -> "Anfragendes PS" "Bereitstellung aus Medikamentenmanagement"
  * AnzahlPackungen -> "Anfragendes PS oder Nutzer des PS" "Bereitstellung aus Medikamentenmanagement"
    * Einheit -> "Anfragendes PS" "Bereitstellung aus Medikamentenmanagement"
    * Wert -> "Anfragendes PS oder Nutzer des PS" "Bereitstellung aus Medikamentenmanagement"

// Konfiguratorische Informationen
* VersichertenEinloesung -> "Nutzer des PS" "Angabemöglichkeit im Moment der Anforderung"
* AngabeMVO -> "Nutzer des PS" "Angabemöglichkeit im Moment der Anforderung. Unterstützung ggf. durch PS."

