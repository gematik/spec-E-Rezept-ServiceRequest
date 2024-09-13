Logical: GEM_ERP_SR_LOG_DispenseRequest
Parent: Element
Id: gem-erp-sr-log-dispense-request
Title: "Logical Model Dispenseieranforderung"
Description: "Fachliches Modell zur Beschreibung einer Dispenseieranforderung"
* insert Versioning
* insert RS_LOG_MessageHeader

// Administrative Informationen
* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der initialen Dispensieranforderung wird eine Anfrage mit dem Status 'active' erstellt und geschickt und signalisiert somit eine neue Anfrage."
* VorgangsID 1..1 string "ID des Vorgangs" "Wird vom initialen Sender gesetzt und muss immer mitgeführt werden."
* ERezeptToken 0..1 string "E-Rezept-Token" "Token der für die Einlösung der Verordnung gebraucht wird. Optional, da in der Antwort an die Pflegeeinrichtung der Token nicht gebraucht wird."
  * ^comment = "Angabe nach gemSpec_DM_eRp#A_19554."

* involvierteParteien 1..* BackboneElement "Involvierte Parteien" "Angaben zu den involvierten Parteien"
  * Anfragender 1..1 BackboneElement "Anfragender" "Angaben zum anfragenden"
    * Name 1..1 string "Name des Anfragenden"
    * Adresse 0..1 Address "Straßenadresse des Anfragenden"
    * Telefon 1..1 string "Telefonnummer des Anfragenden"

* Freitext 0..1 string "Freitext" "Individuelle Nachricht an den Empfänger"

* Prioritaet 0..1 BackboneElement "Priorität" "Angabe der Priorität der Anforderung"
  * PrioritaetCode 1..1 Coding "Priorität der Anforderung" "Folgende Prioritäten sind zulässig: Hoch, Normal"

* Anhaenge 0..* Attachment "Anhänge" "Anhänge zur Bestätigung. Das können PDFs, Bilder oder andere Dokumente sein."
  * Medikationsplan 0..1 Attachment "Medikationsplan" "Anhang des Medikationsplans"
  * weitereAnhaenge 0..* Attachment "Weitere Anhänge" "Weitere Anhänge"
  * ^comment = "Werden auf Ebene der KIM-Nachricht angehangen"