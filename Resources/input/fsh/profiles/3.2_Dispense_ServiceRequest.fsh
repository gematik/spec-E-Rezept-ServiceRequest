Profile: ERPServiceRequestDispenseRequest
Parent: ServiceRequest
Id: erp-service-request-dispense-request
Title: "ERP Service Request Dispense Request"
Description: "ServiceRequest that is used to supply a recipe"
* insert Meta (erp-service-request-dispense-request)

* obeys servicerequest-dispense-request-1
* obeys servicerequest-dispense-request-2
* obeys servicerequest-dispense-request-3
* obeys servicerequest-dispense-request-4
* obeys servicerequest-dispense-request-5

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

* subject MS
* subject only Reference(ERPServiceRequestPatient)
  * ^short = "Patient for whom a dispense is requested on behalf of the patient."

* intent = #filler-order (exactly)

* code MS
  * ^short = "Indicates the type of service request."
  * coding 1..1 MS
  * coding from ServiceRequestTypeVS
  * coding = ServiceRequestTypeCS#dispense-request (exactly)
    * system 1..1
    * code 1..1
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
  * ^comment = "The KIM address is already stored in the message header."

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

* supportingInfo[AbgabeDaten] only Reference(GEM_ERP_PR_MedicationDispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
  * ^short = "Dispense data that is also sent to the e-prescription server."

* note MS
  * ^short = "Further information on the dispense request."
  * ^comment = "Any use cases that are not specified can be placed here in free text."
  * time 1..1 MS
    * ^comment = "This is used in order to sort the Annotations"

//TODO: Test Dispense Invariants!
Invariant: servicerequest-dispense-request-1
Description: "If the status is active, then requester must be present."
Expression: "status = 'active' implies requester.exists()"
Severity: #error

Invariant: servicerequest-dispense-request-2
Description: "If the status is active, then the e-prescription-token must be present."
Expression: "status = 'active' implies extension('EPrescriptionToken').exists()"
Severity: #error

Invariant: servicerequest-dispense-request-3
Description: "If the status is active, then the requester type must be Care Facility."
Expression: "status = 'active' implies requester.type = 'PFL'"
Severity: #error

Invariant: servicerequest-dispense-request-4
Description: "If the status is completed, then the dispense data must be present."
Expression: "status = 'completed' implies supportingInfo.where(type='MedicationDispense').exists()"
Severity: #error

Invariant: servicerequest-dispense-request-5
Description: "If the dispense data is present, then the dispense medication must be present."
Expression: "supportingInfo.where(type='MedicationDispense').exists() implies supportingInfo.where(type='Medication').exists()"
Severity: #error
