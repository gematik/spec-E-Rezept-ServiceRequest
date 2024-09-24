Mapping: RezeptanforderungStornierungAblehnungFachlichesMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation
Target: "ERPServiceRequestPrescriptionRequest"
Id: Rezeptanforderung-Bestaetigung-Fachliches-Mapping
Title: "Rezeptanforderung Stornierung/ Ablehnung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation auf das FHIR-Modell ERPServiceRequestPrescriptionRequest"

// MetaDaten
* MetaDaten -> "ERPServiceRequestRequestHeader"
  * Empfaenger -> "ERPServiceRequestRequestHeader.destination"
    * KIMAdresse -> "ERPServiceRequestRequestHeader.destination.endpoint"
    * TelematikID -> "ERPServiceRequestRequestHeader.destination.receiver.identifier.value"
  * Absender -> "ERPServiceRequestRequestHeader.sender"
    * TelematikID -> "ERPServiceRequestRequestHeader.sender.identifier.value"
    * Name -> "ERPServiceRequestRequestHeader.sender.display"
  * AbsendendesSystem -> "ERPServiceRequestRequestHeader.source"
    * Name -> "ERPServiceRequestRequestHeader.source.name"
    * Software -> "ERPServiceRequestRequestHeader.source.software"
    * Version -> "ERPServiceRequestRequestHeader.source.version"
    * EMailKontakt -> "ERPServiceRequestRequestHeader.source.contact.value"
    * Website -> "ERPServiceRequestRequestHeader.source.endpoint"

// Administrative Informationen
* Status -> "ERPServiceRequestPrescriptionRequest.status"
* VorgangsID -> "ERPServiceRequestPrescriptionRequest.identifier:requestId.value"

* Grund -> "ERPServiceRequestPrescriptionRequest.reasonCode.text"
