Mapping: DispensieranforderungBestaetigungFachlichesMapping
Source: GEM_ERP_SR_LOG_DispenseRequest_Confirmation
Target: "ERPServiceRequestDispenseRequest"
Id: Dispensieranforderung-Bestaetigung-Fachliches-Mapping
Title: "Dispensieranforderung Bestätigung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_DispenseRequest_Confirmation auf das FHIR-Modell ERPServiceRequestDispenseRequest"

// MetaDaten
* insert RS_MAP_MetaDaten

// Administrative Informationen
* Status -> "ERPServiceRequestDispenseRequest.status"
* VorgangsID -> "ERPServiceRequestDispenseRequest.identifier:requestId.value"

* Freitext -> "ERPServiceRequestDispenseRequest.note"

* Medikation -> "ERPServiceRequestDispenseRequest.supportingInfo"
  * Abgabeinformationen -> "ERPServiceRequestDispenseRequest.supportingInfo:AbgabeDaten"
  * Abgabeinformationen -> "ERPServiceRequestDispenseRequest.supportingInfo:AbgabeArzneimittel"