Mapping: ServiceRequestDispenseRequest
Source: ServiceRequestDispenseRequest
Target: "gemF_eRp_KIM#3.1.1 Fachliche Information"
Id: dispense-request-mapping
Title: "Dispense Request Mapping (Rezeptanforderung_Rezeptuebermittlung)"
Description: "Mapping für fachliche Informationseinheiten der Belieferungsanfrage des Feature Dokuments"
* -> "ServiceRequest"
* extension[EPrescriptionToken] -> "ERezept_Access_Code"
* extension[EPrescriptionToken] -> "ERezept_Task_ID"
* basedOn -> "Veraenderungskennzeichen_zur_Ursprungsanforderung"
* basedOn -> "Strukturierter_Verordnungsdatensatz"
* requisition -> "Vorgangs_ID"
* note -> "Hinweise_fuer_Empfänger"
* note -> "Freitext"

Mapping: ServiceRequestDispenseRequestStorno
Source: ServiceRequestDispenseRequest
Target: "gemF_eRp_KIM#3.1.1 Fachliche Information"
Id: dispense-request-mapping-storno
Title: "Dispense Request Mapping (Rezeptanforderung_Rezeptuebermittlung_Storno)"
Description: "Mapping für fachliche Informationseinheiten des Stornos einer Belieferungsanfrage des Feature Dokuments"
* -> "ServiceRequest"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Begründung der Stornierung"

Mapping: ServiceRequestDispenseRequestReject
Source: ServiceRequestDispenseRequest
Target: "gemF_eRp_KIM#3.1.1 Fachliche Information"
Id: dispense-request-mapping-reject
Title: "Dispense Request Mapping (Rezeptanforderung_Rezeptuebermittlung_Ablehnung)"
Description: "Mapping für fachliche Informationseinheiten der Ablehnung einer Belieferungsanfrage des Feature Dokuments"
* -> "ServiceRequest"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Ablehnungsgrund"
* note -> "Freitext"