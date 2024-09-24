Logical: GEM_ERP_SR_LOG_DispenseRequest
Parent: Element
Id: gem-erp-sr-log-dispense-request
Title: "Logical Model Dispenseieranforderung"
Description: "Fachliches Modell zur Beschreibung einer Dispenseieranforderung"
* insert Versioning
* insert RS_LOG_MessageHeader

* obeys log-dispense-request-1
* obeys log-dispense-request-2

// Administrative Informationen
* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der initialen Dispensieranforderung wird eine Anfrage mit dem Status 'active' erstellt und geschickt und signalisiert somit eine neue Anfrage."
  * obeys log-dispense-request-1
  * obeys log-dispense-request-2
* VorgangsID 1..1 string "ID des Vorgangs" "Wird vom initialen Sender gesetzt und muss immer mitgeführt werden."
* ERezeptToken 1..1 string "E-Rezept-Token" "Token der für die Einlösung der Verordnung gebraucht wird."
  * ^comment = "Angabe nach gemSpec_DM_eRp#A_19554."
  * obeys log-dispense-request-2

* involvierteParteien 1..* BackboneElement "Involvierte Parteien" "Angaben zu den involvierten Parteien"
  * Anfragender 1..1 BackboneElement "Anfragender" "Angaben zum anfragenden"
    * AnfragenderTyp 1..1 Coding "Typ des Anfragenden" "Folgende Typen sind zulässig: Apotheke, Pflegeeinrichtung"
      * obeys log-dispense-request-1
    * Name 1..1 string "Name des Anfragenden"
    * Adresse 0..1 Address "Straßenadresse des Anfragenden"
    * Telefon 1..1 string "Telefonnummer des Anfragenden"

  * PatientenInformationen 1..1 BackboneElement "Patienteninformationen" "Angaben zum Patienten"
    * PatientenIdentifierKVNR 1..1 string "KVNR des Patienten"
    * PatientenName 1..1 HumanName "Name des Patienten" "Strukturierte Angabe des Namens des Patienten"
    * PatientenGeburtstag 1..1 date "Geburtstag des Patienten" "Angabe des Geburtstags mit Jahr, Monat und Tag"


* Freitext 0..1 string "Freitext" "Individuelle Nachricht an den Empfänger"

* Prioritaet 0..1 BackboneElement "Priorität" "Angabe der Priorität der Anforderung"
  * PrioritaetCode 1..1 Coding "Priorität der Anforderung" "Folgende Prioritäten sind zulässig: Hoch, Normal"

* Anhaenge 0..* Attachment "Anhänge" "Anhänge zur Bestätigung. Das können PDFs, Bilder oder andere Dokumente sein."
  * Medikationsplan 0..1 Attachment "Medikationsplan" "Anhang des Medikationsplans"
  * weitereAnhaenge 0..* Attachment "Weitere Anhänge" "Weitere Anhänge"
  * ^comment = "Werden auf Ebene der KIM-Nachricht angehangen"

Invariant: log-dispense-request-1
Description: "Wenn eine Anfrage gestellt wird (status = 'active'), muss der Anfragende eine Pflegeeinrichtung sein."
Severity: #error

Invariant: log-dispense-request-2
Description: "Wenn eine Anfrage gestellt wird (status = 'active'), muss auch der E-Rezept-Token vorhanden sein."
Severity: #error