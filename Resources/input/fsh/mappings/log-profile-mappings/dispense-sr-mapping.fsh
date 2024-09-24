Mapping: AbgabeanforderungFachlichesMapping
Source: GEM_ERP_SR_LOG_DispenseRequest
Target: "ERPServiceRequestDispenseRequest"
Id: Abgabeanforderung-Fachliches-Mapping
Title: "Abgabeanforderung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_DispenseRequest auf das FHIR-Modell ERPServiceRequestDispenseRequest"

// MetaDaten
* MetaDaten -> "ERPServiceRequestDispenseRequestHeader"
  * Empfaenger -> "ERPServiceRequestDispenseRequestHeader.destination"
    * KIMAdresse -> "ERPServiceRequestDispenseRequestHeader.destination.endpoint"
    * TelematikID -> "ERPServiceRequestDispenseRequestHeader.destination.receiver.identifier.value"
  * Absender -> "ERPServiceRequestDispenseRequestHeader.sender"
    * TelematikID -> "ERPServiceRequestDispenseRequestHeader.sender.identifier.value"
    * Name -> "ERPServiceRequestDispenseRequestHeader.sender.display"
  * AbsendendesSystem -> "ERPServiceRequestDispenseRequestHeader.source"
    * Name -> "ERPServiceRequestDispenseRequestHeader.source.name"
    * Software -> "ERPServiceRequestDispenseRequestHeader.source.software"
    * Version -> "ERPServiceRequestDispenseRequestHeader.source.version"
    * EMailKontakt -> "ERPServiceRequestDispenseRequestHeader.source.contact.value"
    * Website -> "ERPServiceRequestDispenseRequestHeader.source.endpoint"

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