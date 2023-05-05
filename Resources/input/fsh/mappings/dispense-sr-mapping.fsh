Mapping: ERPServiceRequestDispenseRequest
Source: ERPServiceRequestDispenseRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Rezeptuebermittlung
Title: "Dispense Request Mapping für Rezeptübermittlung"
Description: "Mapping für fachliche Informationseinheiten der Belieferungsanfrage des Feature Dokuments"
* -> "Rezeptanforderung_Rezeptuebermittlung"
* extension[EPrescriptionToken] -> "ERezept_Access_Code"
* extension[EPrescriptionToken] -> "ERezept_Task_ID"
* basedOn -> "Veraenderungskennzeichen_zur_Ursprungsanforderung"
* basedOn -> "Strukturierter_Verordnungsdatensatz"
* requisition -> "Vorgangs_ID"
* note -> "Hinweise_fuer_Empfänger"
* note -> "Freitext"

Mapping: ERPServiceRequestDispenseRequestStorno
Source: ERPServiceRequestDispenseRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Rezeptuebermittlung-Storno
Title: "Dispense Request Mapping für Storno"
Description: "Mapping für fachliche Informationseinheiten des Stornos einer Belieferungsanfrage des Feature Dokuments"
* -> "Rezeptanforderung_Rezeptuebermittlung_Storno"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Begründung der Stornierung"

Mapping: ERPServiceRequestDispenseRequestAblehnung
Source: ERPServiceRequestDispenseRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-Rezeptuebermittlung-Ablehnung
Title: "Dispense Request Mapping für Ablehnung"
Description: "Mapping für fachliche Informationseinheiten der Ablehnung einer Belieferungsanfrage des Feature Dokuments"
* -> "Rezeptanforderung_Rezeptuebermittlung_Ablehnung"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Ablehnungsgrund"
* note -> "Freitext"