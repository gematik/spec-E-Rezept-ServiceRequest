Profile: ERPServiceRequestDispenseRequest
Parent: ServiceRequest
Id: erp-service-request-dispense-request
Title: "ERP Service Request Dispense Request"
Description: "ServiceRequest that is used to supply a recipe"
* insert Meta (erp-service-request-dispense-request)

* extension MS
* extension contains
    EPrescriptionTokenEX named EPrescriptionToken 0..1 MS //muss 0..1 sein für den Fall, dass die Pflegeeinrichtung den DispenseRequest an den Arzt schickt, der es dann zur Apotheke weiterleitet
* extension[EPrescriptionToken]
  * ^short = "The e-prescription token for delivery to the pharmacy can be provided here."
  * ^comment = "The token is of the form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. See [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Defines identifiers to be used in a process"

* identifier 1..* MS
* identifier contains requestId 1..1 and predisId 0..1
* identifier[requestId] only ERPServiceRequestRequestIdentifier
  * ^short = "Identifier that uniquely references a ServiceRequest."
  * ^comment = "For referencing and assignment of ServiceRequest, e.g. if one ServiceRequest is to replace another, it is important to be able to make this assignment with the identifier. Can be mapped via a UUID, for example."

* requisition 1..1 MS
* requisition only ERPServiceRequestProcedureIdentifier
  * ^short = "Identifier of the process. All ServiceRequests within a process receive the same ID."
  * ^comment = "Is to be understood as a case or process ID in order to be able to track which request the ServiceRequest belongs to."

* subject MS
* subject only Reference(Patient)
  * ^short = "Patient for whom a prescription is to be delivered."

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

* occurrence[x] 1..1 MS
* occurrence[x] only dateTime
  * ^short = "Indicates the date when the medication should be delivered."

* authoredOn 1..1 MS
  * ^short = "Creation date of the request."
  * ^comment = "Is initially created and then no longer changed."

* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Supporting information about delivery"

* supportingInfo MS
* supportingInfo contains AbgabeDaten 0..1 MS
// TODO: wenn status = erfüllt dann Abgabedaten vorhanden
* supportingInfo[AbgabeDaten] only Reference(MedicationDispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
  * ^short = "Delivery data that is also sent to the e-prescription specialist service."
  * ^comment = "In this way, the inquiring facility/person can understand which medications are actually supplied."

* note MS
  * ^short = "Further information on delivery."
  * ^comment = "Any use cases that are not specified can be placed here in free text."
