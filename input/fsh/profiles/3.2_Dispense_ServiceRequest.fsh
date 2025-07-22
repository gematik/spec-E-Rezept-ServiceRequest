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

* modifierExtension contains ChangedMedicationEX named medicationChanged 0..1 MS ?!

* modifierExtension[medicationChanged]
  * ^short = "Indicates whether the medication has been changed by the pharmacy."
  * ^definition = "If the medication has been changed, the value is set to true."
  * ^comment = "If the medication has been changed, the receiving system must display the changed medication to the receiving user."
  * ^isModifierReason = "If the medication has been changed, the receiving system must display the changed medication to the receiving user."

* extension MS
* extension contains
    EPrescriptionTokenEX named EPrescriptionToken 0..1 MS and
    AlternativeDeliveryAddressEX named alternativeDeliveryAddress 0..1 MS

* extension[EPrescriptionToken]
  * ^short = "The e-prescription token for delivery to the pharmacy can be provided here."
  * ^comment = "The token is of the form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. See [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."

* extension[alternativeDeliveryAddress]
  * ^short = "Alternative delivery address."
  * ^definition = "If the ServiceRequest states that the delivery should be delivered to an alternative address, it must be stated here."

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

* code 1..1 MS
  * ^short = "Indicates the type of service request."

  * coding 1..* MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
    * ^slicing.description = "Differentiates between the service request type and additional information."
    * ^slicing.ordered = false
  
  * coding contains
    request-type 1..1 MS
    and delivery-type 0..1 MS

  * coding[request-type] from ServiceRequestTypeVS (required)
  * coding[request-type] = ServiceRequestTypeCS#dispense-request
    * ^short = "Indicates the type of service request."
    * system 1..1
    * code 1..1
      * ^comment = "#dispense-request serves as a service request for a pharmacy to deliver a prescription."

  * coding[delivery-type] from DeliveryTypeVS (required)
    * ^short = "Indicates how the delivery should be made."
    * ^definition = "The delivery type can be used to indicate how the delivery should be made. The following options are available: pickup-by-healthcare-service, pickup-by-patient, delivery-to-healthcare-service, delivery-to-alternative-address."
    * ^comment = "If the delivery type is delivery-to-alternative-address, the alternative address must be specified in location."
    * system 1..1
    * code 1..1

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

* supportingInfo[AbgabeDaten] only Reference(ERPServiceRequestMedicationDispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
  * ^short = "Dispense data that is also sent to the e-prescription server."

* note MS
  * ^short = "Further information on the dispense request."
  * ^comment = "Any use cases that are not specified can be placed here in free text."
  * time 1..1 MS
    * ^comment = "This is used in order to sort the Annotations"

Invariant: servicerequest-dispense-request-1
Description: "If the status is active, then requester must be present."
Expression: "status = 'active' implies requester.exists()"
Severity: #error

Invariant: servicerequest-dispense-request-2
Description: "If the status is active, then the e-prescription-token must be present."
Expression: "status = 'active' implies extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex').exists()"
Severity: #error

Invariant: servicerequest-dispense-request-3
Description: "If the status is completed, then the dispense data must be present."
Expression: "status = 'completed' implies supportingInfo.where(type='MedicationDispense').exists()"
Severity: #error

Invariant: servicerequest-dispense-request-4
Description: "If the the code for the delivery type is alternatve-address, then the address must be stated."
Expression: "(status = 'active' and code.coding.where(system='https://gematik.de/fhir/erp-servicerequest/CodeSystem/delivery-type-cs').exists() and code.coding.where(system='https://gematik.de/fhir/erp-servicerequest/CodeSystem/delivery-type-cs').code = 'delivery-to-alternative-address') implies (extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/alternative-delivery-address-ex').exists() and extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/alternative-delivery-address-ex').value.empty().not())"
Severity: #error
