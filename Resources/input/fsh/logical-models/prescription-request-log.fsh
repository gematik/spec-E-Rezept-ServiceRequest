Logical: GEM_ERP_SR_LOG_PrescriptionRequest
Parent: Element
Id: gem-erp-sr-log-prescription-request
Title: "Logical Model Rezeptanforderung"
Description: "Fachliches Modell zur Beschreibung einer Rezeptanforderung"
* insert Versioning

* insert RS_LOG_MessageHeader

// Administrative Informationen
* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der Rezeptanforderung wird eine Anfrage mit dem Status 'active' erstellt und geschickt und signalisiert somit eine neue Anfrage."
* VorgangsID 1..1 string "ID des Vorgangs" "Wird vom initialen Sender gesetzt und muss immer mitgeführt werden."
* VorherigeRezeptID 0..1 BackboneElement "ID des vorherigen Rezepts" "Kann bei der Anforderung einer Folgeverordnung verwendet werden, um einen Bezug zu einer vorherigen Verordnung herzustellen."

* involvierteParteien 1..* BackboneElement "Involvierte Parteien" "Angaben zu den involvierten Parteien"
  * PatientenInformationen 1..1 BackboneElement "Patienteninformationen" "Angaben zum Patienten"
    * PatientenIdentifierKVNR 1..1 string "KVNR des Patienten"
    * PatientenName 1..1 HumanName "Name des Patienten" "Strukturierte Angabe des Namens des Patienten"
    * PatientenGeburtstag 1..1 date "Geburtstag des Patienten" "Angabe des Geburtstags mit Jahr, Monat und Tag"

  * VerordnenderArzt 0..1 BackboneElement "Verordnender Arzt" "Angaben zum verordnenden Arzt. Anzugeben, wenn ein Arzt zur Ausstellung identifiziert werden kann."
    * LANR 0..1 string "LANR des Arztes"
    * Name 1..1 HumanName "Name des Arztes"

  * Anfragender 1..1 BackboneElement "Anfragender" "Angaben zum anfragenden"
    * Name 1..1 string "Name des Anfragenden"
    * Adresse 0..1 Address "Straßenadresse des Anfragenden"
    * Telefon 1..1 string "Telefonnummer des Anfragenden"
		  * TelematikId 1..1 string "Telematik-ID des Anfragenden" //Seems to be a bug that this has to be indented

  * PflegeeinrichtungKopie 0..1 BackboneElement "Zu benachrichtigende Pflegeeinrichtung" "Angaben zur Pflegeeinrichtung, die über den Ablauf der Rezeptanforderung per Kopie informiert werden soll. Muss angegeben werden, wenn die Apotheke die Rezeptanforderung stellt."
    * Name 1..1 string "Name der Pflegeeinrichtung"
    * Telefon 1..1 string "Telefonnummer der Pflegeeinrichtung"
    * KIMAdresse 1..1 Address "KIM-Adresse der Pflegeeinrichtung"

* Freitext 0..1 string "Freitext" "Individuelle Nachricht an den Empfänger"

* GrundDerAnforderung 0..1 BackboneElement "Grund der Anforderung" "Entweder Codiert oder als Freitext"
  * GrundCode 0..1 Coding "Code des Grundes" "Folgende Gründe sind vorgesehen: Korrektur, Reichweite erschöpft(Dauermedikation), nach Vitalwertmessung, nach Bedarf (z.B. aufgrund von Schmerzen)"
  * GrundText 0..1 string "Text des Grundes"

* Prioritaet 0..1 BackboneElement "Priorität" "Angabe der Priorität der Anforderung"
  * PrioritaetCode 1..1 Coding "Priorität der Anforderung" "Folgende Prioritäten sind zulässig: Hoch, Normal"

* Restreichweite 0..1 BackboneElement "Restreichweite" "Angabe der Restreichweite"
  * Freitext 0..1 string "Restreichweite in Tage oder Anzahl an Einheiten"
  * Einheit 0..1 string "Einheit der Restreichweite"
  * Wert 0..1 decimal "Wert der Restreichweite"
    
* Anhaenge 0..* Attachment "Anhänge" "Anhänge zur Anforderung. Das können PDFs, Bilder oder andere Dokumente sein."

// Medizinische Informationen
* Medikation 1..1 BackboneElement "Medikation" "Angaben zur Medikation"
  * MedikationCodiert 0..1 CodeableConcept "Medikation codiert" "Codiertes Medikament"
    * NameDesMedikaments 1..1 string "Name des Medikaments"
    * PZN 1..1 string "PZN des Medikaments"
  * MedikationObjekt 0..1 Medication "Referenz auf das Medikamentenobjekt" "Referenz auf das Medikamentenobjekt nach KBV_Verordnung/ePA Medication"  
  * Menge 1..1 BackboneElement "Menge des Medikaments"
    * Einheit 1..1 string "Einheit der Menge"
    * Wert 1..1 string "Wert der Menge"

// Konfiguratorische Informationen
* VersichertenEinloesung 0..1 boolean "Versicherten Einlösung" "Angabe, ob der Versicherte das E-Rezept selbst einlösen möchte."
* AngabeMVO 0..1 boolean "Angabe MVO" "Angabe, ob der anfordernde eine MVO wünscht. Es obliegt dem Verordnenden dem Wunsch nachzukommen. Der verordnende LE entscheidet über die Menge und die Zeiträume"
