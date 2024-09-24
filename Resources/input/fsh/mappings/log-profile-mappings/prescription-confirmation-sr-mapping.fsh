Mapping: RezeptanforderungBestaetigungFachlichesMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation
Target: "ERPServiceRequestPrescriptionRequest"
Id: Rezeptanforderung-Bestaetigung-Fachliches-Mapping
Title: "Rezeptanforderung Bestätigung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation auf das FHIR-Modell ERPServiceRequestPrescriptionRequest"

// MetaDaten
* insert RS_MAP_MetaDaten

// Administrative Informationen
* Status -> "ERPServiceRequestPrescriptionRequest.status"
* VorgangsID -> "ERPServiceRequestPrescriptionRequest.identifier:requestId.value"

* ERezeptToken -> "ERPServiceRequestPrescriptionRequest.extension:EPrescriptionToken"
* AenderungVerordnung -> "ERPServiceRequestPrescriptionRequest.extension:medicationChanged"


* Freitext -> "ERPServiceRequestPrescriptionRequest.note"

// Medizinische Informationen
* Medikation -> "ERPServiceRequestPrescriptionRequest.basedOn(KBV_Prescription)"
