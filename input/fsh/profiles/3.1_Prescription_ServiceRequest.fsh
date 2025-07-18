Profile: ERPServiceRequestPrescriptionRequest
Parent: ServiceRequest
Id: erp-service-request-prescription-request
Title: "ERP Service Request Prescription Request"
Description: "ServiceRequest, which is used to request a recipe"
* insert Meta (erp-service-request-prescription-request)

* obeys servicerequest-prescription-request-1
* obeys servicerequest-prescription-request-2
* obeys servicerequest-prescription-request-3
* obeys servicerequest-prescription-request-4
* obeys servicerequest-prescription-request-5
// * obeys servicerequest-prescription-request-6
// * obeys servicerequest-prescription-request-7

* extension MS
* extension contains EPrescriptionTokenEX named EPrescriptionToken 0..* MS
* modifierExtension contains ChangedMedicationEX named medicationChanged 0..1 MS ?!
    and RedeemByPatientEX named redeemByPatient 0..1 MS ?!

* extension[EPrescriptionTokenEX]
  * ^short = "Here the e-prescription token(s) can be made available for processing in a pharmacy."
  * ^definition = "One ServiceRequest must adress exactly one request for a medication. However the practitioner might choose to issue multiple prescriptions for that request, therefore the cardinality is 1..*."
  * ^comment = "The token is of the form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. See [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."
* modifierExtension[medicationChanged]
  * ^short = "Indicates whether the medication has been changed by the prescriber."
  * ^definition = "If the medication has been changed, the value is set to true."
  * ^comment = "If the medication has been changed, the receiving system must display the changed medication to the receiving user."
  * ^isModifierReason = "If the medication has been changed, the receiving system must display the changed medication to the receiving user."
* modifierExtension[redeemByPatient]
  * ^short = "Redeem By Patient"
  * ^definition = "Indicates whether the prescription should be redeemed by the patient."
  * ^comment = "This determines the Flow Type of the prescription to be set to 160/200 so that the patient can redeem the prescription himself. If not set the Flow Type is set to 169/209."
  * ^isModifierReason = "This determines the Flow Type of the prescription to be set to 160/200 so that the patient can redeem the prescription himself. If not set the Flow Type is set to 169/209."

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier 1..* MS
  * ^short = "Defines identifiers to be used in this profile."
* identifier contains 
  requestId 1..1 
* identifier[requestId] only ERPServiceRequestRequestIdentifier
  * ^short = "Identifier that uniquely references a ServiceRequest."
  * ^comment = "For referencing and assignment of ServiceRequest, e.g. if one ServiceRequest is to replace another, it is important to be able to make this assignment with the identifier. Can be mapped via a UUID, for example."

* basedOn 1..1 MS
  * ^short = "Requested or fulfilled MedicationRequest."
  * ^comment = "Exactly one MedicationRequest is assigned to a ServiceRequest, so that independent processing is possible."
  * ^definition = "This field references the underlying MedicationRequest, which contains the medical information for the prescription request."
* basedOn only Reference(ERPServiceRequestMedicationRequest)

* requisition 1..1 MS
* requisition only ERPServiceRequestProcedureIdentifier
  * ^short = "Identifier of the overall process. Multiple ServiceRequests within a process are allocated the same ID."
  * ^comment = "Is to be understood as a case or process ID (see mapping) in order to be able to track which request the ServiceRequest belongs to."

* status MS
* status from ServiceRequestStatusVS
  * ^short = "Indicates the processing status of a service request."
  * ^comment = "If the status changes, this value is overwritten."

* intent MS
* intent = #order (exactly)

* code 1..1 MS
  * ^short = "Indicates the type of service request."

  * coding 1..* MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
    * ^slicing.description = "Differentiates between the service request type and additional information."
    * ^slicing.ordered = false
  
  * coding contains request-type 1..1 MS

  * coding[request-type] from ServiceRequestTypeVS
  * coding[request-type] = ServiceRequestTypeCS#prescription-request
    * ^short = "Indicates the type of service request."
    * system 1..1
    * code 1..1
      * ^comment = "#prescription-request defines this ServiceRequest as a prescription request from a requester to a doctor."

* subject MS
* subject only Reference(ERPServiceRequestPatient)
  * ^short = "Patient for whom a prescription is requested on behalf of the patient."

* occurrence[x] 0..1 MS
* occurrence[x] only dateTime
  * ^short = "Specifies the date on which the prescription is to be issued (Bedarfszeitraum)."
  * ^comment = "Can be used by the requester to make the timely urgency clear."

* authoredOn 1..1 MS
  * ^short = "Creation date of the request."
  * ^comment = "Is initially created and then no longer changed."

* requester 0..1 MS // 0..1 für die Antwort, siehe Constraint
* requester only Reference(ERPServiceRequestOrganization)
  * ^short = "Inquiring facility or practitioner."
  * ^comment = "The KIM address is already stored in the message header."

* performer MS
* performer only Reference(ERPServiceRequestPractitioner)
  * ^short = "Doctor who is to issue the prescription."

* note MS
  * ^short = "Further information on the prescription request."
  * ^comment = "Any use cases that are not specified can be placed here in free text."
  * time 1..1 MS
    * ^comment = "This is used in order to sort the Annotations"
    
* reasonCode MS
  * ^short = "Reason for the prescription request."
  * ^comment = "The reason for the prescription request can be documented here."
  * coding 0..1 MS
  * coding from MedicationRequestReasonVS (required)
  * text 0..1 MS
  //Restreichweite
  * extension MS
  * extension contains
      RemainingSupplyEX named remainingSupply 0..1 MS
      and RemainingSupplyFreeTextEX named remainingSupplyFreeText 0..1 MS
  * extension[remainingSupply]
    * ^short = "Remaining supply"
    * ^definition = "Indicates the remaining supply of the medication."
  * extension[remainingSupplyFreeText]
    * ^short = "Remaining supply as free text"
    * ^definition = "Here the remaining supply of the medication can be stated as free text."

* priority 0..1 MS
  * ^short = "Indicates the urgency of the request."
  * ^definition = "The priority can be used to indicate the urgency of the request."
  * ^comment = "Allowed values: routine | urgent"
* priority from ServiceRequestPriorityVS (required)

* supportingInfo MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
  * ^slicing.description = "Additional information on the prescription request."
  * ^slicing.ordered = false

* supportingInfo contains pflegeeinrichtungKopie 0..1 MS

* supportingInfo[pflegeeinrichtungKopie] only Reference(ERPServiceRequestOrganization)
* supportingInfo[pflegeeinrichtungKopie]
  * ^short = "Reference to the care facility that receives a copy of the prescription."
  * ^comment = "This needs to be set if the initiating Requester is a pharmacy."
  * type = "Organization"

Invariant: servicerequest-prescription-request-1
Description: "If the status is active, the requester must be present."
Expression: "status = 'active' implies requester.exists()"
Severity: #error

Invariant: servicerequest-prescription-request-2
Description: "If the status is completed and the prescription should be redeemed by the patient, the e-prescription-token must not be present."
Expression: "(status = 'completed' and modifierExtension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex').exists() and modifierExtension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex').value = true) implies extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex').exists().not()"
Severity: #error

Invariant: servicerequest-prescription-request-3
Description: "If the status is revoked or entered-in-error, then the reasonCode or note must be present."
Expression: "(status = 'revoked' or status = 'entered-in-error') implies (reasonCode.text.exists() or note.exists())"
Severity: #error

Invariant: servicerequest-prescription-request-4
Description: "If the status is completed, the performer must be present."
Expression: "status = 'completed' implies performer.exists()"
Severity: #error

Invariant: servicerequest-prescription-request-5
Description: "If the status is completed and the prescription should not be redeemed by the patient, the e-prescription-token must be present."
Expression: "(status = 'completed' and (modifierExtension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex').value = false or modifierExtension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex').exists().not())) implies extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex').exists()"
Severity: #error

// Wird aktuell nicht gebraucht, da basedOn immer vorhanden ist. Wenn PDFs nicht mehr gebraucht werden, könnte das wieder genutzt werden.
// Invariant: servicerequest-prescription-request-6
// Description: "If the status is active, then basedOn is required."
// Expression: "status = 'active' implies basedOn.exists()"
// Severity: #error

// Invariant: servicerequest-prescription-request-7
// Description: "If the status is completed, then basedOn is required."
// Expression: "status = 'completed' implies basedOn.exists()"
// Severity: #error