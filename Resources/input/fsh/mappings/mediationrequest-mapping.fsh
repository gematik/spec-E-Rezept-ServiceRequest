Mapping: MedicationRequestMapping
Source: MedicationRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1 Fachliche Information"
Id: Rezeptanforderung-medizinische-Informationen
Title: "Medication Request Mapping (Strukturierter_Verordnungsdatensatz)"
Description: "Mapping für fachliche Informationseinheiten der angefragten Medikation des Feature Dokuments"
* -> "Rezeptanforderung_medizinische_Informationen"
* extension[PriorPrescriptionID] -> "Vorheriges_Rezept"
* medication[x] -> "Paeparat"