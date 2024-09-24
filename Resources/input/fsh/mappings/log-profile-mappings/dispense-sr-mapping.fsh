Mapping: AbgabeanforderungFachlichesMapping
Source: GEM_ERP_SR_LOG_DispenseRequest
Target: "ERPServiceRequestDispenseRequest"
Id: Abgabeanforderung-Fachliches-Mapping
Title: "Abgabeanforderung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_DispenseRequest auf das FHIR-Modell ERPServiceRequestDispenseRequest"

// MetaDaten
* insert RS_MAP_MetaDaten

// Administrative Informationen
* Status -> "ERPServiceRequestDispenseRequest.status"
* VorgangsID -> "ERPServiceRequestDispenseRequest.identifier:requestId.value"
* ERezeptToken -> "ERPServiceRequestDispenseRequest.extension:EPrescriptionToken"

* involvierteParteien -> "ERPServiceRequestDispenseRequest.requester"
  * Anfragender -> "ERPServiceRequestDispenseRequest.requester(ERPServiceRequestOrganization)"
    * AnfragenderTyp -> "ERPServiceRequestDispenseRequest.requester.type"
    * Name -> "ERPServiceRequestOrganization.name"
    * Adresse -> "ERPServiceRequestOrganization.address"
    * Telefon -> "ERPServiceRequestOrganization.contact.telecom:tel.value"

* Freitext -> "ERPServiceRequestDispenseRequest.note"

* Prioritaet -> "ERPServiceRequestDispenseRequest.priority"
  * PrioritaetCode -> "ERPServiceRequestDispenseRequest.priority"