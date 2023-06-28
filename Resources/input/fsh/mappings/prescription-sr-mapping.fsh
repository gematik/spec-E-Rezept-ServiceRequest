Mapping: ERPServiceRequestPrescriptionRequest
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung
Title: "Rezeptanforderung"
Description: "Mapping for 'fachliche Informationseinheiten' of the 'Verordnungsanfrage' of the feature document"
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

Mapping: ERPServiceRequestPrescriptionRequestRezeptuebermittlung
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Rezeptuebermittlung
Title: "Rezeptanforderung_Rezeptübermittlung"
Description: "Mapping for 'fachliche Informationseinheiten' of the 'Verordnungsanfrage' of the feature document"
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
Description: "Mapping for 'fachliche Informationseinheiten' of the cancellation of a 'Verordnungsanfrage' of the feature document"
* -> "Rezeptanforderung_Storno"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Begründung der Stornierung"

Mapping: ERPServiceRequestPrescriptionRequestAblehnung
Source: ERPServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Ablehnung
Title: "Rezeptanforderung_Storno (Verordnender)"
Description: "Mapping for 'fachliche Informationseinheiten' of the refusal of a 'Verordnungsanfrage' of the feature document"
* -> "Rezeptanforderung_Storno"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Ablehnungsgrund"
* note -> "Freitext"