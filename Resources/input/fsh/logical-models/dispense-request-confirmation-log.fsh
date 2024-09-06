Logical: GEM_ERP_SR_LOG_DispenseRequest_Confirmation
Parent: Element
Id: gem-erp-sr-log-dispense-request-confirmation
Title: "Logical Model Dispenseieranforderung_Bestätigung"
Description: "Fachliches Modell zur Beschreibung einer Bestätigung einer Dispenseieranforderung"
* insert Versioning
* insert RS_LOG_MessageHeader

// Administrative Informationen
* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der Dispensieranforderung wird eine erledigte Anfrage mit dem Status 'completed' geschickt und signalisiert somit eine neue Anfrage."
* VorgangsID 1..1 string "ID des Vorgangs" "Wird vom initialen Sender gesetzt und muss immer mitgeführt werden."
* ERezeptToken 1..1 string "E-Rezept-Token" "Token der für die Einlösung der Verordnung gebraucht wird. Angabe nach gemSpec_DM_eRp#A_19554."

* Freitext 0..1 string "Freitext" "Individuelle Nachricht an den Empfänger"
    
* Anhaenge 0..* Attachment "Anhänge" "Anhänge zur Anforderung. Das können PDFs, Bilder oder andere Dokumente sein."