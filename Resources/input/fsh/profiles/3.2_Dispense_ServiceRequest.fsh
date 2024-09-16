Profile: ERPServiceRequestDispenseRequest
Parent: ServiceRequest
Id: erp-service-request-dispense-request
Title: "ERP Service Request Dispense Request"
Description: "ServiceRequest that is used to supply a recipe"
* insert Meta (erp-service-request-dispense-request)

* extension MS
* extension contains
    EPrescriptionTokenEX named EPrescriptionToken 0..1 MS
* extension[EPrescriptionToken]
  * ^short = "The e-prescription token for delivery to the pharmacy can be provided here."
  * ^comment = "The token is of the form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. See [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Defines identifiers to be used in a process"

* identifier 1..* MS
* identifier contains requestId 1..1
* identifier[requestId] only ERPServiceRequestRequestIdentifier
  * ^short = "Identifier that uniquely references a ServiceRequest."
  * ^comment = "For referencing and assignment of ServiceRequest, e.g. if one ServiceRequest is to replace another, it is important to be able to make this assignment with the identifier. Can be mapped via a UUID, for example."

* requisition 1..1 MS
* requisition only ERPServiceRequestProcedureIdentifier
  * ^short = "Identifier of the process. All ServiceRequests within a process receive the same ID."
  * ^comment = "Is to be understood as a case or process ID in order to be able to track which request the ServiceRequest belongs to."

* status MS
* status from ServiceRequestStatusVS
  * ^short = "Indicates the processing status of a service request."
  * ^comment = "If the status changes, this value is overwritten."

* intent = #filler-order (exactly)

* code MS
  * ^short = "Indicates the type of service request."
* code.coding 1..1 MS
* code.coding from ServiceRequestTypeVS
* code.coding.system 1..1
* code.coding.code 1..1
* code.coding.code = #dispense-request (exactly)
  * ^comment = "#dispense-request serves as a service request for a pharmacy to deliver a prescription."

* occurrence[x] 0..1 MS
* occurrence[x] only dateTime
  * ^short = "Indicates the date when the medication should be delivered."

* authoredOn 1..1 MS
  * ^short = "Creation date of the request."
  * ^comment = "Is initially created and then no longer changed."

* requester 0..1 MS
* requester only Reference(ERPServiceRequestOrganization)
  * ^short = "Inquiring facility or practitioner."
  * ^comment = "The KIM address is already stored in the message header. Therefore, the preferred specification is to store a KBV_PR_FOR_Practitioner."

* requester.type 1..1 MS
* requester.type = #PFL (exactly)
  * ^short = "Care Facility as requester for the dispensation of the prescription"
  * ^comment = "This value helps the receiving Systems to identify the source of the request."

* priority 0..1 MS
  * ^short = "Indicates the urgency of the request."
  * ^definition = "The priority can be used to indicate the urgency of the request."
  * ^comment = "Allowed values: routine | urgent"
* priority from ServiceRequestPriorityVS (required)

* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Supporting information about dispense"

* supportingInfo MS
* supportingInfo contains AbgabeDaten 0..1 MS
* supportingInfo contains AbgabeArzneimittel 0..1 MS

* supportingInfo[AbgabeDaten] only Reference(GEM_ERP_PR_MedicationDispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
  * ^short = "Dispense data that is also sent to the e-prescription server."

* supportingInfo[AbgabeArzneimittel] only Reference(GEM_ERP_PR_Medication)
* supportingInfo[AbgabeArzneimittel].type = "Medication" (exactly)
  * ^short = "Medication data that is also sent to the e-prescription server."

* note MS
  * ^short = "Further information on the dispense request."
  * ^comment = "Any use cases that are not specified can be placed here in free text."

//constraints
//TODO: wenn status = active, dann Token vorhanden
//TODO: wenn status = active, dann Anfragender vorhanden
//TODO: wenn status = active, dann AnfragenderTyp = PFL
// TODO: wenn status = completed dann Abgabedaten vorhanden
// TODO: wenn AbgabeDaten vorhanden dann Abgabedatenarzneimittel vorhanden