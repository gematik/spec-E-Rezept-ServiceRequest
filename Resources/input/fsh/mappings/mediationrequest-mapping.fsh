Mapping: MedicationRequestMapping
Source: ERPServiceRequestMedicationRequest
Target: "gemF_eRp_KIM#3.1.1-Fachliche-Information"
Id: Rezeptanforderung-medizinische-Informationen
Title: "Medication Request Mapping (Strukturierter_Verordnungsdatensatz)"
Description: "Mapping for 'fachliche Informationseineit' of the requested medication of the feature document"
* -> "Rezeptanforderung_medizinische_Informationen"
* extension[PriorPrescriptionID] -> "Vorheriges_Rezept"
* medication[x] -> "Paeparat"