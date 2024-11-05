Mapping: RezeptanforderungFachlichesMapping
Source: GEM_ERP_SR_LOG_PrescriptionRequest
Target: "ERPServiceRequestPrescriptionRequest"
Id: Rezeptanforderung-Fachliches-Mapping
Title: "Rezeptanforderung Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_PrescriptionRequest auf das FHIR-Modell ERPServiceRequestPrescriptionRequest"

// MetaDaten
* insert RS_MAP_MetaDaten

// Administrative Informationen
* Status -> "ERPServiceRequestPrescriptionRequest.status"
* VorgangsID -> "ERPServiceRequestPrescriptionRequest.identifier:requestId.value"
* VersichertenEinloesung -> "ERPServiceRequestPrescriptionRequest.extension:redeemByPatient.valueBoolean"

* involvierteParteien -> "ERPServiceRequestPrescriptionRequest.subject/performer/requester"
  * PatientenInformationen -> "ERPServiceRequestPrescriptionRequest.subject(ERPServiceRequestPatient)"
    * PatientenIdentifierKVNR -> "ERPServiceRequestPatient.identifier.value"
    * PatientenName -> "ERPServiceRequestPatient.name"
    * PatientenGeburtstag -> "ERPServiceRequestPatient.birthDate"

  * VerordnenderArzt -> "ERPServiceRequestPrescriptionRequest.performer(ERPServiceRequestPractitioner)"
    * LANR -> "ERPServiceRequestPractitioner.identifier.value"
    * Name -> "ERPServiceRequestPractitioner.name"

  * Anfragender -> "ERPServiceRequestPrescriptionRequest.requester(ERPServiceRequestOrganization)"
    * Name -> "ERPServiceRequestOrganization.name"
    * Adresse -> "ERPServiceRequestOrganization.address"
    * Telefon -> "ERPServiceRequestOrganization.contact.telecom:tel.value"

  * PflegeeinrichtungKopie -> "ERPServiceRequestPrescriptionRequest.supportingInfo:pflegeeinrichtungKopie(ERPServiceRequestOrganization)"
    * Name -> "ERPServiceRequestOrganization.name"
    * Telefon -> "ERPServiceRequestOrganization.contact.telecom:tel.value"
    * KIMAdresse -> "ERPServiceRequestOrganization.contact.telecom:kim.value"

* Freitext -> "ERPServiceRequestPrescriptionRequest.note"

* GrundDerAnforderung -> "ERPServiceRequestPrescriptionRequest.reasonCode"
  * GrundCode -> "ERPServiceRequestPrescriptionRequest.reasonCode.coding"
  * GrundText -> "ERPServiceRequestPrescriptionRequest.reasonCode.text"

* Prioritaet -> "ERPServiceRequestPrescriptionRequest.priority"
  * PrioritaetCode -> "ERPServiceRequestPrescriptionRequest.priority"

* Restreichweite -> "ERPServiceRequestPrescriptionRequest.reasonCode.extension:remainingSupply"
  * Freitext -> "ERPServiceRequestPrescriptionRequest.reasonCode.extension:remainingSupplyFreeText.valueString"
  * Einheit -> "ERPServiceRequestPrescriptionRequest.reasonCode.extension:remainingSupply.unit"
  * Wert -> "ERPServiceRequestPrescriptionRequest.reasonCode.extension:remainingSupply.value"

// Medizinische Informationen
* Medikation -> "ERPServiceRequestPrescriptionRequest.basedOn(ERPServiceRequestMedicationRequest)"
  * VorherigeRezeptID -> "ERPServiceRequestMedicationRequest.extension:PriorPrescriptionID.valueIdentifier.value"
  * MedikationsReferenz -> "ERPServiceRequestMedicationRequest.medication"
  * AnzahlPackungen -> "ERPServiceRequestMedicationRequest.dispenseReques.quantity"
    * Einheit -> "ERPServiceRequestMedicationRequest.dispenseRequest.quantity.code"
    * Wert -> "ERPServiceRequestMedicationRequest.dispenseRequest.quantity.value"
  // Konfiguratorische Informationen
  * AngabeMVO -> "ERPServiceRequestMedicationRequest.extension:requestMVO.extension:Kennzeichen.valueBoolean"

