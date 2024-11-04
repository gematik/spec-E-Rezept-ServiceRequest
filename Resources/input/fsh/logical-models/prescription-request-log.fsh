Logical: GEM_ERP_SR_LOG_PrescriptionRequest
Parent: Element
Id: gem-erp-sr-log-prescription-request
Title: "Logical Model Rezeptanforderung"
Description: "Fachliches Modell zur Beschreibung einer Rezeptanforderung"
* insert Versioning

* insert RS_LOG_MessageHeader

* obeys log-prescription-request-1
* obeys log-prescription-request-2

// Administrative Informationen
* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der Rezeptanforderung wird eine Anfrage mit dem Status 'active' erstellt und geschickt und signalisiert somit eine neue Anfrage."
  * obeys log-prescription-request-1
* VorgangsID 1..1 string "ID des Vorgangs" "Wird vom initialen Sender gesetzt und muss immer mitgeführt werden."
* VersichertenEinloesung 0..1 boolean "Versicherten Einlösung" "Angabe, ob der Versicherte das E-Rezept selbst einlösen möchte."

* involvierteParteien 1..* BackboneElement "Involvierte Parteien" "Angaben zu den involvierten Parteien"
  * PatientenInformationen 1..1 BackboneElement "Patienteninformationen" "Angaben zum Patienten"
    * PatientenIdentifierKVNR 1..1 string "KVNR des Patienten"
    * PatientenName 1..1 HumanName "Name des Patienten" "Strukturierte Angabe des Namens des Patienten"
    * PatientenGeburtstag 1..1 date "Geburtstag des Patienten" "Angabe des Geburtstags mit Jahr, Monat und Tag"

  * VerordnenderArzt 0..* BackboneElement "Verordnender Arzt" "Angaben zum verordnenden Arzt. Anzugeben, wenn ein Arzt zur Ausstellung identifiziert werden kann."
    * LANR 0..1 string "LANR des Arztes"
    * Name 1..1 HumanName "Name des Arztes"

  * Anfragender 1..1 BackboneElement "Anfragender" "Angaben zum anfragenden"
    * obeys log-prescription-request-1
    * AnfragenderTyp 1..1 Coding "Typ des Anfragenden" "Folgende Typen sind zulässig: Apotheke, Pflegeeinrichtung"
      * obeys log-prescription-request-2
    * Name 1..1 string "Name des Anfragenden"
    * Adresse 0..1 Address "Straßenadresse des Anfragenden"
    * Telefon 1..1 string "Telefonnummer des Anfragenden"

  * PflegeeinrichtungKopie 0..1 BackboneElement "Zu benachrichtigende Pflegeeinrichtung" "Angaben zur Pflegeeinrichtung, die über den Ablauf der Rezeptanforderung per Kopie informiert werden soll. Muss angegeben werden, wenn die Apotheke die Rezeptanforderung stellt."
    * obeys log-prescription-request-2
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
  * ^comment = "Werden auf Ebene der KIM-Nachricht angehangen"

// Medizinische Informationen
* Medikation 1..1 BackboneElement "Medikation" "Angaben zur Medikation"
  * VorherigeRezeptID 0..1 BackboneElement "ID des vorherigen Rezepts" "Kann bei der Anforderung einer Folgeverordnung verwendet werden, um einen Bezug zu einer vorherigen Verordnung herzustellen."
  * MedikationsReferenz 0..1 Medication "Referenz auf das Medikamentenobjekt" "Referenz auf das Medikamentenobjekt nach KBV_Verordnung (Freitext, PZN, Wirkstoff, Rezeptur)"
    * ^comment = "Folgende Profile aus dem E-Rezept Verordnungsdatensatz sind zulässig: KBV_PR_ERP_Medication_Compounding, KBV_PR_ERP_Medication_FreeText, KBV_PR_ERP_Medication _Ingredient, KBV_PR_ERP_Medication_PZN"
  * AnzahlPackungen 1..1 BackboneElement "Anzahl der Packungen"
    * Einheit 1..1 string "Einheit der Menge, fix auf 'Packung' gesetzt"
    * Wert 1..1 string "Anzahl der Packungen"
  // Konfiguratorische Informationen
  * AngabeMVO 0..1 boolean "Angabe MVO" "Angabe, ob der anfordernde eine MVO wünscht. Es obliegt dem Verordnenden dem Wunsch nachzukommen. Der verordnende LE entscheidet über die Menge und die Zeiträume"

Invariant: log-prescription-request-1
Description: "Wenn eine Anfrage gestellt wird (status = 'active'), muss auch der Anfragende vorhanden sein."
Severity: #error

Invariant: log-prescription-request-2
Description: "Wenn eine Anfrage von einer Apotheke (involvierteParteien.Anfragender.AnfragenderTyp = 'APO') gestellt wird, muss die Angabe der Pflegeeinrichtung zur Kopie angegeben werden (involvierteParteien.PflegeeinrichtungKopie)."
Severity: #error