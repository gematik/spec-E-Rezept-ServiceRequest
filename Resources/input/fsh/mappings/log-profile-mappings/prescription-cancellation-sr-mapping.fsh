Mapping: RezeptanforderungStornierungAblehnungFachlichesMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation
Target: "ERPServiceRequestPrescriptionRequest"
Id: Rezeptanforderung-Bestaetigung-Fachliches-Mapping
Title: "Rezeptanforderung Stornierung/ Ablehnung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation auf das FHIR-Modell ERPServiceRequestPrescriptionRequest"

// MetaDaten
* insert RS_MAP_MetaDaten

// Administrative Informationen
* Status -> "ERPServiceRequestPrescriptionRequest.status"
* VorgangsID -> "ERPServiceRequestPrescriptionRequest.identifier:requestId.value"

* Grund -> "ERPServiceRequestPrescriptionRequest.reasonCode.text"
