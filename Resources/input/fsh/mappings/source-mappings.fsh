Mapping: GEM_ERP_SR_LOG_PrescriptionRequestSourceMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest
Id: Rezeptanforderung-Source-Mapping
Title: "Quellinformationen der Rezeptanforderung"
Description: "Mapping for 'fachliche Informationseinheiten' of the 'Verordnungsanfrage' of the feature document"
* -> "Rezeptanforderung"

// Administrative Informationen
* Status -> "PS"
* VorgangsID -> ""
* VorherigeRezeptID -> ""

* involvierteParteien -> ""
  * PatientenInformationen -> ""
    * PatientenIdentifierKVNR -> ""
    * PatientenName -> ""
    * PatientenGeburtstag -> ""

  * VerordnenderArzt -> ""
    * ArztLANR -> ""
				* ArztName -> ""

  * Anfragender -> ""
    * AnfragenderName -> ""
    * AnfragenderAdresse -> ""
    * AnfragenderTelefon -> ""
				* AnfragenderTelematikID -> ""

  * PflegeeinrichtungKopie -> ""
    * PflegeeinrichtungName -> ""
    * PflegeeinrichtungTelefon -> ""
    * PflegeeinrichtungKIMAdresse -> ""

* Freitext -> ""

* GrundDerAnforderung -> ""
  * GrundCode -> ""
  * GrundText -> ""

* Prioritaet -> ""
  * Prioritaet -> ""

* Restreichweite -> ""
  * Freitext -> ""
  * Einheit -> ""
  * Wert -> ""
    
* Anhaenge -> ""

// Medizinische Informationen
* Medikation -> ""
  * MedikationCodiert -> ""
    * NameDesMedikaments -> ""
    * PZN -> ""
  * MedikationObjekt -> ""
  * Menge -> ""
    * Einheit -> ""
    * Wert -> ""

// Konfiguratorische Informationen
* VersichertenEinloesung -> ""
* AngabeMVO -> ""
