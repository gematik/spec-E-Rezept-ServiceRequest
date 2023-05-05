Mapping: ERPServiceRequestPrescriptionRequest
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung
Title: "Prescription Request Mapping"
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

Mapping: ERPServiceRequestPrescriptionRequestStorno
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Storno
Title: "Prescription Request Mapping"
Description: "Mapping für fachliche Informationseinheiten des Stornos einer Verordnungsanfrage des Feature Dokuments"
* -> "Rezeptanforderung_Storno"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Begründung der Stornierung"

Mapping: ERPServiceRequestPrescriptionRequestAblehnung
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Ablehnung
Title: "Prescription Request Mapping"
Description: "Mapping für fachliche Informationseinheiten der Ablehnung einer Verordnungsanfrage des Feature Dokuments"
* -> "Rezeptanforderung_Ablehnung"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Ablehnungsgrund"
* note -> "Freitext"