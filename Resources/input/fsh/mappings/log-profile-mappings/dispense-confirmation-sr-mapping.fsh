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

* Belieferungsart -> "ERPServiceRequestDispenseRequest.code.coding[delivery-type]"
  * BelieferungsartCode -> "ERPServiceRequestDispenseRequest.code.coding[delivery-type].code"

* Medikation -> "ERPServiceRequestDispenseRequest.supportingInfo:Abgabedaten"
  * Abgabeinformationen -> "ERPServiceRequestMedicationDispense"