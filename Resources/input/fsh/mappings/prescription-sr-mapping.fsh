Mapping: ERPServiceRequestPrescriptionRequest
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung
Title: "Rezeptanforderung"
Description: "Mapping für fachliche Informationseinheiten der Verordnungsanfrage des Feature Dokuments"
* -> "Rezeptanforderung"
* requisition -> "Vorgangs_ID"
* priority -> "Prioritaet"
* performer -> "Adressat_der_Rezeptanforderung"
* requester -> "Adressat_der_Rezeptuebermittlung"
* subject -> "Patienteninformationen"
* basedOn -> "Praeparat"
* reasonCode -> "Bedarfsbegruendung (Code)"
* reasonReference -> "Bedarfsbegruendung (Observation)"
* reasonReference -> "Restreichweite"
* note -> "Freitext"

Mapping: ERPServiceRequestPrescriptionRequestBestaetigung
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Bestaetigung
Title: "Rezeptanforderung_Rezeptübermittlung"
Description: "Mapping für fachliche Informationseinheiten der Verordnungsanfrage des Feature Dokuments"
* -> "Rezeptanforderung_Rezeptübermittlung"
* extension[EPrescriptionTokenEX] -> "ERezept_Task_ID"
* extension[EPrescriptionTokenEX] -> "ERezept_Access_Code"
* requisition -> "Vorgangs_ID"
* basedOn -> "Strukturierter_Verordnungsdatensatz"
* note -> "Hinweise_fuer_Empfaenger"
* note -> "Freitext"

Mapping: ERPServiceRequestPrescriptionRequestStorno
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Storno
Title: "Rezeptanforderung_Storno (Anfragender)"
Description: "Mapping für fachliche Informationseinheiten des Stornos einer Verordnungsanfrage des Feature Dokuments"
* -> "Rezeptanforderung_Storno"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Begründung der Stornierung"

Mapping: ERPServiceRequestPrescriptionRequestAblehnung
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Ablehnung
Title: "Rezeptanforderung_Storno (Verordnender)"
Description: "Mapping für fachliche Informationseinheiten der Ablehnung einer Verordnungsanfrage des Feature Dokuments"
* -> "Rezeptanforderung_Storno"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Ablehnungsgrund"
* note -> "Freitext"