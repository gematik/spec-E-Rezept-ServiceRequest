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
* identifier[predisId] only ERPServiceRequestPreDisIdentifier
  * ^short = "Identifier that connects a prescription and a dispensing request."
  * ^comment = "Can be mapped via a UUID, for example."
  * ^definition = "In some applications, it is necessary to know which prescription request belongs to which delivery request. If, for example, a medication is requested, you want to be able to track which is the corresponding delivery request. The predisIdentifier is used for this purpose, which identifies a pair of ServiceRequest**Prescription**Request and ServiceRequest**Dispense**Request together."

* basedOn 0..1 MS
  * ^short = "KBV Prescription to be supplied by the pharmacy."
  * ^comment = "Exactly one MedicationRequest is assigned to a ServiceRequest, so that independent processing is possible."
* basedOn only Reference($KBV_PR_ERP_Prescription)

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

* subject MS
* subject only Reference($KBV_PR_FOR_Patient)
  * ^short = "Patient for whom a prescription is to be delivered."

* occurrence[x] 1..1 MS
* occurrence[x] only dateTime
  * ^short = "Indicates the date when the medication should be delivered."

* authoredOn 1..1 MS
  * ^short = "Creation date of the request."
  * ^comment = "Is initially created and then no longer changed."

* requester 1..1 MS
* requester only Reference(ERPServiceRequestOrganization or $KBV_PR_FOR_Practitioner)
  * ^short = "Inquiring institution or doctor."
  * ^comment = "If the prescriber's system creates this profile, the institution/person who made the prescription request must be specified here."

* performer MS
* performer only Reference(ERPServiceRequestOrganization)
  * ^short = "Pharmacy that is to deliver the e-prescription."

* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Supporting information about delivery"

* supportingInfo MS
* supportingInfo contains AusstellenderArzt 1..1 MS and AbgabeDaten 0..1 MS
* supportingInfo[AusstellenderArzt] only Reference($KBV_PR_FOR_Practitioner)
* supportingInfo[AusstellenderArzt].type = "Practitioner" (exactly)
  * ^short = "Doctor who issued the prescription."
  * ^comment = "If there are any questions about the prescription, the pharmacy can use this information to get in touch with a prescriber."
// TODO: wenn status = erfüllt dann Abgabedaten vorhanden
* supportingInfo[AbgabeDaten] only Reference($GEM_ERP_PR_MedicationDispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
  * ^short = "Delivery data that is also sent to the e-prescription specialist service."
  * ^comment = "In this way, the inquiring facility/person can understand which medications are actually supplied."
  
* note MS
  * ^short = "Further information on delivery."
  * ^comment = "Any use cases that are not specified can be placed here in free text."
