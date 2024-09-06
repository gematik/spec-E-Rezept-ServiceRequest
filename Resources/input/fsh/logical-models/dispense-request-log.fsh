Logical: GEM_ERP_SR_LOG_DispenseRequest
Id: gem-erp-sr-log-dispense-request
Title: "Logical Model Dispenseieranforderung"
Description: "Fachliches Modell zur Beschreibung einer Dispenseieranforderung"
* insert Versioning
* insert RS_LOG_MessageHeader

// Administrative Informationen
* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der initialen Dispensieranforderung wird eine Anfrage mit dem Status 'active' erstellt und geschickt und signalisiert somit eine neue Anfrage."
* VorgangsID 1..1 string "ID des Vorgangs" "Wird vom initialen Sender gesetzt und muss immer mitgeführt werden."
* ERezeptToken 1..1 string "E-Rezept-Token" "Token der für die Einlösung der Verordnung gebraucht wird. Angabe nach gemSpec_DM_eRp#A_19554."

* involvierteParteien 1..* BackboneElement "Involvierte Parteien" "Angaben zu den involvierten Parteien"
  * Anfragender 1..1 BackboneElement "Anfragender" "Angaben zum anfragenden"
    * AnfragenderName 1..1 string "Name des Anfragenden"
    * AnfragenderAdresse 0..1 Address "Straßenadresse des Anfragenden"
    * AnfragenderTelefon 1..1 string "Telefonnummer des Anfragenden"
				* AnfragenderTelematikID 1..1 string "Telematik-ID des Anfragenden"

* Freitext 0..1 string "Freitext" "Individuelle Nachricht an den Empfänger"

* Prioritaet 0..1 BackboneElement "Priorität" "Angabe der Priorität der Anforderung"
  * Prioritaet 1..1 Coding "Priorität der Anforderung" "Folgende Prioritäten sind zulässig: Hoch, Normal"

* Restreichweite 0..1 BackboneElement "Restreichweite" "Angabe der Restreichweite"
  * Freitext 0..1 string "Restreichweite in Tage oder Anzahl an Einheiten"
  * Einheit 0..1 unit "Einheit der Restreichweite"
  * Wert 0..1 code "Wert der Restreichweite"
    
* Anhaenge 0..* Attachment "Anhänge" "Anhänge zur Anforderung. Das können PDFs, Bilder oder andere Dokumente sein."