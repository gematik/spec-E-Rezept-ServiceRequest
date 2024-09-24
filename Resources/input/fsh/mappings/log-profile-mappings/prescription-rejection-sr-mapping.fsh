Mapping: RezeptanforderungAblehnungFachlichesMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest_Rejection
Target: "ERPServiceRequestPrescriptionRequest"
Id: Rezeptanforderung-Ablehnung-Fachliches-Mapping
Title: "Rezeptanforderung Ablehnung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_PrescriptionRequest_Rejection auf das FHIR-Modell ERPServiceRequestPrescriptionRequest"

// MetaDaten
* insert RS_MAP_MetaDaten

// Administrative Informationen
* Status -> "ERPServiceRequestPrescriptionRequest.status"
* VorgangsID -> "ERPServiceRequestPrescriptionRequest.identifier:requestId.value"

* Grund -> "ERPServiceRequestPrescriptionRequest.reasonCode.text"
