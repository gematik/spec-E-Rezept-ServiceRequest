/*
This file contains Tests for servicerequest-prescription-request-2

Description: "If the status is completed and the prescription should not be redeemed by the patient, the e-prescription-token must be present."
Expression: "(status = 'completed' and modifierExtension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex').value = true) implies extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex').exists().not()"
*/

Instance: INVALID-prescription-request-2
InstanceOf: ERPServiceRequestPrescriptionRequest
Usage: #example
Title: "Invalid Prescription Request 2"
* identifier[requestId].value = "INVALID-prescription-request-2"
* requisition.value = "GroupID-UC1"
* modifierExtension[redeemByPatient].valueBoolean = true
* extension[EPrescriptionToken].valueIdentifier.value = "Task/169.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = RequestStatus#completed
* basedOn = Reference(Example-Response-Medication-Request)
* subject = Reference(Example-Patient)
* authoredOn = "2025-05-13"
* intent = RequestIntent#order
* code = ServiceRequestTypeCS#prescription-request