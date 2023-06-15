Profile: ERPServiceRequestPrescriptionRequest
Parent: ServiceRequest
Id: erp-service-request-prescription-request
Title: "ERP Service Request Prescription Request"
Description: "ServiceRequest, which is used to request a recipe"
* insert Meta (service-request-prescription-request)

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
* identifier contains requestId 1..1 and predisId 0..1
* identifier[requestId] only ERPServiceRequestRequestIdentifier
  * ^short = "Identifier that uniquely references a ServiceRequest."
  * ^comment = "For referencing and assignment of ServiceRequest, e.g. if one ServiceRequest is to replace another, it is important to be able to make this assignment with the identifier. Can be mapped via a UUID, for example."
* identifier[predisId] only ERPServiceRequestPreDisIdentifier
  * ^short = "Identifier that connects a prescription and a dispensing request."
  * ^comment = "Can be mapped via a UUID, for example."
  * ^definition = "In some applications, it is necessary to know which prescription request belongs to which delivery request. If, for example, a drug is requested, you want to be able to track which is the corresponding delivery request. The predisIdentifier is used for this purpose, which identifies a pair of ServiceRequest**Prescription**Request and ServiceRequest**Dispense**Request together.

Das implementierende System muss in der Lage sein diese Verknüpfung herzustellen als auch zu lesen."

* basedOn 1..1 MS
  * ^short = "Requested or fulfilled MedicationRequest."
  * ^comment = "Exactly one MedicationRequest is assigned to a ServiceRequest, so that independent processing is possible."
  * ^definition = "This field references the underlying MedicationRequest, which contains the medical information for the prescription request. If the prescription request is made, the ERPServiceRequestMedicationRequest profile MAY be used.
When the prescription has been created, the corresponding KBV_PR_ERP_Bundle prescription data record must be referenced."
* basedOn only Reference(ERPServiceRequestMedicationRequest or $KBV_PR_ERP_Prescription)

* requisition 1..1 MS
* requisition only ERPServiceRequestProcedureIdentifier
  * ^short = "Identifier of the process. All ServiceRequests within a process receive the same ID."
  * ^comment = "Is to be understood as a case or process ID (see mapping) in order to be able to track which request the ServiceRequest belongs to."

* status MS
* status from ServiceRequestStatusVS
  * ^short = "Indicates the processing status of a service request."
  * ^comment = "If the status changes, this value is overwritten."

* intent = #order (exactly)

* code MS
  * ^short = "Indicates the type of service request."
* code.coding 1..1 MS
* code.coding from ServiceRequestTypeVS
* code.coding.system 1..1
* code.coding.code 1..1
* code.coding.code = #prescription-request (exactly)
  * ^comment = "#prescription-request defines this ServiceRequest as a prescription request from a doctor."

* subject MS
* subject only Reference($KBV_PR_FOR_Patient)
  * ^short = "Patient for whom a prescription is requested on behalf of the patient."

* orderDetail 1..1 MS
* orderDetail.coding 1..1 MS
* orderDetail.coding from PrescriptionFullfillmentTypeVS
  * ^short = "Specifies how the recipe request should be fulfilled."
  * ^comment = "If the prescription goes to a pharmacy, a corresponding ServiceRequest must be included in the bundle."

* occurrence[x] 0..1 MS
* occurrence[x] only dateTime
  * ^short = "Specifies the date on which the prescription is to be issued."
  * ^comment = "Can be used by the requester to make the timely urgency clear."

* authoredOn 1..1 MS
  * ^short = "Creation date of the request."
  * ^comment = "Is initially created and then no longer changed."


* requester 1..1 MS
* requester only Reference(ERPServiceRequestOrganization or $KBV_PR_FOR_Practitioner)
  * ^short = "Inquiring facility or practitioner."
  * ^comment = "The KIM address is already stored in the message header. Therefore, the preferred specification is to store a KBV_PR_FOR_Practitioner."

* performer MS
* performer only Reference($KBV_PR_FOR_Practitioner)
  * ^short = "Doctor who is to write the prescription."

* reasonCode MS
* reasonCode from RequestReasonVS
  * ^short = "Code indicating why a prescription is requested."
  * ^comment = "Also used to indicate why the transaction was canceled in the event of a cancellation."

* reasonReference only Reference(ERPServiceRequestRemainingMedication)
  * ^short = "Reference to an observation resource that indicates how long the current medication will last."
  * ^comment = "If a reference to the reason is provided, a human-readable entry in .note must also be added in case systems cannot process the referenced observation."

* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Supporting information for the prescription request"

* supportingInfo MS
* supportingInfo contains
AuslieferndeApotheke 0..1 MS
* supportingInfo[AuslieferndeApotheke] only Reference(ERPServiceRequestOrganization)
* supportingInfo[AuslieferndeApotheke].type = "Organization"

* note MS
  * ^short = "Further information on the prescription request."
  * ^comment = "Any use cases that are not specified can be placed here in free text."
