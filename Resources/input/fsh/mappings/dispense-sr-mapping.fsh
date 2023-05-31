Mapping: ERPServiceRequestDispenseRequest
Source: ERPServiceRequestDispenseRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Dispensieranforderung-Rezeptuebermittlung
Title: "Dispensieranforderung_Rezeptuebermittlung"
Description: "Mapping für fachliche Informationseinheiten der Belieferungsanfrage des Feature Dokuments"
* -> "Dispensieranforderung_Rezeptuebermittlung"
* extension[EPrescriptionToken] -> "ERezept_Access_Code"
* extension[EPrescriptionToken] -> "ERezept_Task_ID"
* basedOn -> "Strukturierter_Verordnungsdatensatz"
* requisition -> "Vorgangs_ID"
* note -> "Hinweise_fuer_Empfänger"
* note -> "Freitext"

Mapping: ERPServiceRequestDispenseRequestApproval
Source: ERPServiceRequestDispenseRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Dispensieranforderung-Bestaetigung
Title: "Dispensieranforderung_Bestätigung"
Description: "Mapping für fachliche Informationseinheiten der Belieferungsanfrage des Feature Dokuments"
* -> "Dispensieranforderung_Bestätigung"
* requisition -> "Vorgangs_ID"
* supportingInfo[AbgabeDaten] -> "Strukturierter_Dispensierungsdatensatz"
* note -> "Hinweise_fuer_Empfänger"
* note -> "Freitext"
