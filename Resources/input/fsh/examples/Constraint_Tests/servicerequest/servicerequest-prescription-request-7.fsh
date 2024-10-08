/*
This file contains Tests for servicerequest-prescription-request-7

Description: "If the status is completed and the prescription should not be redeemed by the patient, the e-prescription-token must be present."
Expression: "(status = 'completed' and (modifierExtension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex').value = true or modifierExtension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex').exists().not())) implies extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex').exists()"
*/

Instance: INVALID-prescription-request-7-1-of-2
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 7-1-of-2"
* identifier[requestId].value = "INVALID-prescription-request-7-1-of-2"
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC3"
* status = RequestStatus#completed
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* performer.identifier = Hans-Topp-Glücklich-Identifier

Instance: INVALID-prescription-request-7-2-of-2
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 7-2-of-2"
* identifier[requestId].value = "INVALID-prescription-request-7-2-of-2"
* modifierExtension[redeemByPatient].valueBoolean = false
* basedOn = Reference(Example-Initial-Medication-Request)
* requisition.value = "GroupID-UC3"
* status = RequestStatus#completed
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* performer.identifier = Hans-Topp-Glücklich-Identifier
