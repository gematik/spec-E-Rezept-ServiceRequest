Logical: GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation
Parent: Element
Id: gem-erp-sr-log-prescription-request-cancellation
Title: "Logical Model Rezeptanforderung_Storno"
Description: "Fachliches Modell zur Beschreibung einer Stornierung einer Rezeptanforderung seitens der Pflegeeinrichtung."
* insert Versioning
* insert RS_LOG_MessageHeader

// Administrative Informationen
* Status 1..1 code "Status" "Status der Anforderung. Wird genutzt, um den Bearbeitungsstand einer Anfrage zu verfolgen. Im Falle der Storinierung einer Rezeptanforderung wird eine Anfrage mit dem Status 'revoked' erstellt und geschickt."
* Grund 1..1 string "Grund der Stornierung" "Der Grund, warum die Stornierung angegeben wurde kann als Freitext hinterlegt werden."
* VorgangsID 1..1 string "ID des Vorgangs" "Wird hier genutzt, um die Anfrage die storniert werden soll, zu referenzieren."
