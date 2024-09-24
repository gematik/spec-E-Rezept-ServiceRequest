Mapping: DispensieranforderungFachlichesMapping
Source: GEM_ERP_SR_LOG_DispenseRequest
Target: "ERPServiceRequestDispenseRequest"
Id: Dispensieranforderung-Fachliches-Mapping
Title: "Dispensieranforderung Fachliches Mapping"
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

  * PatientenInformationen -> "ERPServiceRequestDispenseRequest.subject(ERPServiceRequestPatient)"
    * PatientenIdentifierKVNR -> "ERPServiceRequestPatient.identifier.value"
    * PatientenName -> "ERPServiceRequestPatient.name"
    * PatientenGeburtstag -> "ERPServiceRequestPatient.birthDate"

* Freitext -> "ERPServiceRequestDispenseRequest.note"

* Prioritaet -> "ERPServiceRequestDispenseRequest.priority"
  * PrioritaetCode -> "ERPServiceRequestDispenseRequest.priority"