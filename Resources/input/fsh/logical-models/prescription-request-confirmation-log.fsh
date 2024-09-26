Logical: GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation
Parent: Element
Id: gem-erp-sr-log-prescription-request-confirmation
Title: "Logical Model Rezeptanforderung_Bestätigung"
Description: "Fachliches Modell zur Beschreibung einer Bestätigung einer Rezeptanforderung"
* insert Versioning

* insert RS_LOG_MessageHeader

* obeys log-prescription-request-3
* obeys log-prescription-request-4

// Administrative Informationen
* ERezeptToken 1..1 string "E-Rezept-Token" "Token der für die Einlösung der Verordnung gebraucht wird. Angabe nach gemSpec_DM_eRp#A_19554."
  * obeys log-prescription-request-4

* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der Bestätigung der Rezeptanforderung wird eine Anfrage mit dem Status 'completed' geschickt."
  * obeys log-prescription-request-3
  * obeys log-prescription-request-4
* VorgangsID 1..1 string "ID des Vorgangs" "Wird vom initialen Sender gesetzt und muss in der Antwort mitgeführt werden."
* VersichertenEinloesung 0..1 boolean "Versicherten Einlösung" "Angabe, ob der Versicherte das E-Rezept selbst einlösen möchte."

* Freitext 0..1 string "Freitext" "Individuelle Nachricht an den Empfänger"
    
* Anhaenge 0..* Attachment "Anhänge" "Anhänge zur Bestätigung. Das können PDFs, Bilder oder andere Dokumente sein."
  * Medikationsplan 0..1 Attachment "Medikationsplan" "Anhang des Medikationsplans"
  * weitereAnhaenge 0..* Attachment "Weitere Anhänge" "Weitere Anhänge"
  * ^comment = "Werden auf Ebene der KIM-Nachricht angehangen"

// Medizinische Informationen
* AenderungVerordnung 0..1 boolean "Änderung der Verordnung" "Gibt an, ob das verordnete Arzneimittel von dem angefragten abweicht."
* Medikation 1..1 BackboneElement "Medikation" "Angaben zur Medikation"
  * obeys log-prescription-request-3
  * MedizinischeInformationenAusVerordnung 1..1 Reference(MedicationRequest) "Medizinische Verordnungsinformationen" "MedicationRequest und Medication Objekt aus der KBV_Verordnung."

Invariant: log-prescription-request-3
Description: "Wenn eine Anfrage bestätigt wird (status = 'completed'), muss das Profil KBV_PR_ERP_Prescription mit einer KBV_Medication genutzt werden."
Severity: #error

Invariant: log-prescription-request-4
Description: "Wenn eine Anfrage bestätigt wird (status = 'completed'), muss der E-Rezept Token vorhanden sein."
Severity: #error