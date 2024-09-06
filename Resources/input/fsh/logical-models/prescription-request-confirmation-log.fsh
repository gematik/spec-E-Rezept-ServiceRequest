Logical: GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation
Parent: Base
Id: gem-erp-sr-log-prescription-request-confirmation
Title: "Logical Rezeptanforderung_Bestätigung"
Description: "Fachliches Modell zur Beschreibung einer Bestätigung einer Rezeptanforderung"
* insert Versioning

* insert RS_LOG_MessageHeader

// Administrative Informationen
* ERezeptToken 1..1 string "E-Rezept-Token" "Token der für die Einlösung der Verordnung gebraucht wird. Angabe nach gemSpec_DM_eRp#A_19554."

* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der Bestätigung der Rezeptanforderung wird eine Anfrage mit dem Status 'completed' geschickt."
* VorgangsID 1..1 string "ID des Vorgangs" "Wird vom initialen Sender gesetzt und muss in der Antwort mitgeführt werden."

* Freitext 0..1 string "Freitext" "Individuelle Nachricht an den Empfänger"
    
* Anhaenge 0..* Attachment "Anhänge" "Anhänge zur Bestätigung. Das können PDFs, Bilder oder andere Dokumente sein."

// Medizinische Informationen
* Medikation 1..1 BackboneElement "Medikation" "Angaben zur Medikation"
  * MedizinischeInformationenAusVerordnung 1..1 Reference(MedicationRequest) "Medizinische Verordnungsinformationen" "MedicationRequest und Medication Objekt aus der KBV_Verordnung."