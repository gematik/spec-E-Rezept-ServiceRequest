Logical: GEM_ERP_SR_LOG_PrescriptionRequest
Parent: Base
Id: gem-erp-sr-log-prescription-request
Title: "Rezeptanforderung Logical Model"
Description: "Fachliches Modell zur Beschreibung einer Rezeptanforderung"
* insert Versioning

// Administrative Informationen
* Status 1..1 code "Status" "Status der Anforderung. Beispiel: Neue Anforderung, Änderung"
* VorgangsID 1..1 string "ID des Vorgangs" "Wird vom initialen Sender gesetzt und muss immer mitgeführt werden"
* VorherigeRezeptID 0..1 BackboneElement "ID des vorherigen Rezepts" "Wird gebraucht, wenn der verordnende Arzt das vorherige Rezept löschen soll"

* involvierteParteien 1..1 BackboneElement "Involvierte Parteien" "Angaben zu den involvierten Parteien"
  * PatientenInformationen 1..1 BackboneElement "Patienteninformationen" "Angaben zum Patienten, es muss entweder die KVNR oder eine Referenz auf ein gültiges KBV_FOR_Paitient Objekt existieren."
    * PatientenIdentifierKVNR 0..1 string "KVNR des Patienten"
    * PatientenReferenz 0..1 reference "Referenz zum KBV_FOR_Patient Objekt, welches alle relevanten informationen enthält, die für eine Verordnung relevant sind"
    * PatientenVersichertenInformationen 0..1 reference "Referenz auf die Versicherteninformationen"

  * VerordnenderArzt 1..1 BackboneElement "Verordnender Arzt" "Angaben zum verordnenden Arzt"
    * ArztLANR 1..1 string "LANR des Arztes"

  * Anfragender 1..1 BackboneElement "Anfragender" "Angaben zum anfragenden"
    * AnfragenderName 1..1 string "Name des Anfragenden"
    * AnfragenderAdresse 1..1 string "Adresse des Anfragenden"
    * AnfragenderTelefon 1..1 string "Telefonnummer des Anfragenden"

* Freitext 0..1 string "Freitext" "Freitextfeld für zusätzliche Informationen des Anfragenden"

* GrundDerAnforderung 0..1 CodeableConcept "Grund der Anforderung" "Entweder Codiert oder als Freitext"
  * GrundCode 0..1 Coding "Code des Grundes" "Beispiel Änderung des Zustands des Versicherten"
  * GrundText 0..1 string "Text des Grundes"

* Prioritaet 0..1 BackboneElement "Priorität" "Angabe der Priorität der Anforderung"
  * Prioritaet 1..1 Coding "Priorität der Anforderung"
  * GrundFuerPriorität 0..1 CodeableConcept "Grund der Priorität"
    * GrundCode 1..1 Coding "Code des Grundes" "Beispiel geringe Restreichweite"
    * GrundText 0..1 string "Text des Grundes"
    
* Anhaenge 0..* Attachment "Anhänge" "Anhänge zur Anforderung. Das können PDFs, Bilder oder andere Dokumente sein."

// Medizinische Informationen
* Medikationsanfrage 1..1 BackboneElement "Medikationsanfrage" "Angaben zur Medikationsanfrage"
  * Medikation 1..* BackboneElement "Medikation" "Angaben zur Medikation"
    * MedikationCodiert 0..1 CodeableConcept "Medikation codiert" "Codiertes Medikament"
      * NameDesMedikaments 1..1 string "Name des Medikaments"
      * PZN 1..1 string "PZN des Medikaments"
    * MedikationObjekt 0..1 reference "Referenz auf das Medikamentenobjekt" "Referenz auf das Medikamentenobjekt nach KBV_Verordnung"  
  * Menge 1..1 BackboneElement "Menge des Medikaments"
    * Einheit 1..1 string "Einheit der Menge"
    * Wert 1..1 string "Wert der Menge"

// Konfiguratorische Informationen
* autIdem 0..1 boolean "autIdem" "Angabe, ob ausdrücklich das angegebene Medikament angefragt wird"
* VersichertenEinlösung 0..1 boolean "Versicherten Einlösung" "Angabe, ob der Versicherte das E-Rezept selbst einlösen möchte."
* AngabeMVO 0..1 boolean "Angabe MVO" "Angabe, ob der anfordernde eine MVO wünscht. Es obliegt dem Verordnenden dem Wunsch nachzukommen. Der verordnende LE entscheidet über die Menge und die Zeiträume"