Mapping: GEM_ERP_SR_LOG_PrescriptionRequestSourceMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest
Id: Rezeptanforderung-Source-Mapping
Title: "Quelle der Rezeptanforderungsinformationen"
Description: "Beschreibt die Quelle der Rezeptanforderungsinformationen"

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
    * ArztLANR -> "Anfragendes PS"
    * ArztName -> "Anfragendes PS"

  * Anfragender -> "Anfragendes PS"
    * AnfragenderName -> "Anfragendes PS"
    * AnfragenderAdresse -> "Anfragendes PS"
    * AnfragenderTelefon -> "Anfragendes PS"
		* AnfragenderTelematikID -> "Anfragendes PS" "Aus SMC-B oder HBA Zertifikat"

  * PflegeeinrichtungKopie -> "Anfragendes AVS" "Im Fall, dass die Apotheke die Anfrage initiiert"
    * PflegeeinrichtungName -> "Anfragendes AVS"
    * PflegeeinrichtungTelefon -> "Anfragendes AVS"
    * PflegeeinrichtungKIMAdresse -> "Anfragendes AVS"

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
* Medikation -> "Anfragendes PS oder Nutzer des PS"
  * MedikationCodiert -> "Anfragendes PS" "Bereitstellung aus Medikamentenmanagement"
    * NameDesMedikaments -> "Anfragendes PS" "Bereitstellung aus Medikamentenmanagement"
    * PZN -> "Anfragendes PS" "Bereitstellung aus Medikamentenmanagement"
  * MedikationObjekt -> "Anfragendes PS" "Bereitstellung aus Medikamentenmanagement"
  * Menge -> "Anfragendes PS" "Bereitstellung aus Medikamentenmanagement"
    * Einheit -> "Anfragendes PS" "Bereitstellung aus Medikamentenmanagement"
    * Wert -> "Anfragendes PS" "Bereitstellung aus Medikamentenmanagement"

// Konfiguratorische Informationen
* VersichertenEinloesung -> "Nutzer des PS" "Angabemöglichkeit im Moment der Anforderung"
* AngabeMVO -> "Nutzer des PS" "Angabemöglichkeit im Moment der Anforderung. Unterstützung ggf. durch PS."
