Mapping: RezeptanforderungStornierungFachlichesMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation
Target: "ERPServiceRequestPrescriptionRequest"
Id: Rezeptanforderung-Stornierung-Fachliches-Mapping
Title: "Rezeptanforderung Stornierung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation auf das FHIR-Modell ERPServiceRequestPrescriptionRequest"

// MetaDaten
* insert RS_MAP_MetaDaten

// Administrative Informationen
* Status -> "ERPServiceRequestPrescriptionRequest.status"
* VorgangsID -> "ERPServiceRequestPrescriptionRequest.identifier:requestId.value"

* Grund -> "ERPServiceRequestPrescriptionRequest.reasonCode.text"

// Medizinische Daten
* Medikation -> "ERPServiceRequestPrescriptionRequest.basedOn(ERPServiceRequestMedicationRequest)"
  * MedikationsReferenz -> "ERPServiceRequestMedicationRequest.medicationReference"
  * AnzahlPackungen -> "ERPServiceRequestMedicationRequest.dispenseRequest.quantity"
    * Einheit -> "ERPServiceRequestMedicationRequest.dispenseRequest.quantity.unit"
    * Wert -> "ERPServiceRequestMedicationRequest.dispenseRequest.quantity.value"
