Logical: GEM_ERP_SR_LOG_PrescriptionRequest_Rejection
Parent: Element
Id: gem-erp-sr-log-prescription-request-rejection
Title: "Logical Model Rezeptanforderung_Storno (Ablehnung)"
Description: "Fachliches Modell zur Beschreibung einer Ablehnung einer Rezeptanforderung seitens des Verordnenden."
* insert Versioning
* insert RS_LOG_MessageHeader

// Administrative Informationen
* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der Storinierung einer Rezeptanforderung wird eine Anfrage mit dem Status 'revoked' erstellt und geschickt."
* Grund 1..1 string "Grund der Ablehnung" "Der Grund, warum die Rezeptanforderung abgelehnt wurde muss als Freitext hinterlegt werden."
* VorgangsID 1..1 string "ID des Vorgangs" "Wird hier genutzt, um die Anfrage die storniert werden soll, zu referenzieren."