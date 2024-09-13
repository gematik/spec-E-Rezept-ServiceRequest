Profile: ERPServiceRequestPrescriptionRequest
Parent: ServiceRequest
Id: erp-service-request-prescription-request
Title: "ERP Service Request Prescription Request"
Description: "ServiceRequest, which is used to request a recipe"
* insert Meta (erp-service-request-prescription-request)

* extension MS
* extension contains
    EPrescriptionTokenEX named EPrescriptionToken 0..1 MS
* extension[EPrescriptionTokenEX]
  * ^short = "Here the e-prescription token can be made available for processing in a pharmacy."
  * ^comment = "The token is of the form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. See [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier 1..* MS
  * ^short = "Defines identifiers to be used in this profile."
* identifier contains 
  requestId 1..1 
  and predisId 0..1
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
* code.coding 1..1 MS
* code.coding from ServiceRequestTypeVS
* code.coding.system 1..1
* code.coding.code 1..1
* code.coding.code = #prescription-request (exactly)
  * ^comment = "#prescription-request defines this ServiceRequest as a prescription request from a requester to a doctor."

* subject MS
* subject only Reference(ERPServiceRequestPatient)
  * ^short = "Patient for whom a prescription is requested on behalf of the patient."

* occurrence[x] 0..1 MS
* occurrence[x] only dateTime
  * ^short = "Specifies the date on which the prescription is to be issued."
  * ^comment = "Can be used by the requester to make the timely urgency clear."

* authoredOn 1..1 MS
  * ^short = "Creation date of the request."
  * ^comment = "Is initially created and then no longer changed."

* requester 1..1 MS
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

* supportingInfo MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
  * ^slicing.description = "Additional information on the prescription request."
  * ^slicing.ordered = false

* supportingInfo contains pflegeeinrichtungKopie 0..1 MS

* supportingInfo[pflegeeinrichtungKopie]
  * ^short = "Reference to the care facility that receives a copy of the prescription."
  * ^comment = "This needs to be set if the initiating Requester is a pharmacy."
  * type = "PFL"



// Constraints
//TODO, "if status completed then token must be present"
//TODO: "if status active then basedOn Reference must be ERPMedicationRequest otherwise KBV_PR_ERP"