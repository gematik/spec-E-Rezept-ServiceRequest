Profile: ERPServiceRequestPrescriptionRequest
Parent: ServiceRequest
Id: erp-service-request-prescription-request
Title: "ERP Service Request Prescription Request"
Description: "ServiceRequest, which is used to request a recipe"
* insert Meta (erp-service-request-prescription-request)

* extension MS
* extension contains
    EPrescriptionTokenEX named EPrescriptionToken 0..1 MS ?!
    and ChangedMedicationEX named medicationChanged 0..1 MS ?!
* extension[EPrescriptionTokenEX]
  * ^short = "Here the e-prescription token can be made available for processing in a pharmacy."
  * ^comment = "The token is of the form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. See [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."
* extension[medicationChanged]
  * ^short = "Indicates whether the medication has been changed by the prescriber."
  * ^comment = "If the medication has been changed, the value is set to true."

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
  * ^definition = "This field references the underlying MedicationRequest, which contains the medical information for the prescription request. For active requests ERPServiceRequestMedicationRequest may be used, otherwise KBV_PR_ERP_MedicationRequest."
* basedOn only Reference(ERPServiceRequestMedicationRequest or KBV_PR_ERP_Prescription)

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

* code MS
  * ^short = "Indicates the type of service request."
  * coding 1..1 MS
  * coding from ServiceRequestTypeVS
  * coding = ServiceRequestTypeCS#prescription-request (exactly)
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

* requester 0..1 MS
* requester only Reference(ERPServiceRequestOrganization)
  * ^short = "Inquiring facility or practitioner."
  * ^comment = "The KIM address is already stored in the message header. Therefore, the preferred specification is to store a KBV_PR_FOR_Practitioner."

* requester.type 1..1 MS
* requester.type from ServiceRequestOrganizationTypeVS (required)
  * ^short = "Type of Requester (Pharmacy or Care Facility)."
  * ^comment = "This value helps the receiving Systems to identify the source of the request."

* performer MS
* performer only Reference(ERPServiceRequestPractitioner)
  * ^short = "Doctor who is to issue the prescription."

* note MS
  * ^short = "Further information on the prescription request."
  * ^comment = "Any use cases that are not specified can be placed here in free text."

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
  * extension[remainingSupply]
    * ^short = "Remaining supply"
    * ^definition = "Indicates the remaining supply of the medication."

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



// Constraints
//TODO, "if status active then requester must be present"
//TODO, "if status completed then token must be present"
//TODO: "if status active then basedOn Reference must be ERPMedicationRequest otherwise KBV_PR_ERP"
//TODO: Wenn Anfragender Apotheke muss Pflegeinrichtung Kopie vorhanden sein