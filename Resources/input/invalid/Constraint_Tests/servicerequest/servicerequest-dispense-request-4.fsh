/*
This file contains Tests for servicerequest-dispense-request-4

Description: "If the the code for the delivery type is alternatve-address, then the address must be stated."
Expression: "code.coding.where(system='https://gematik.de/fhir/erp-servicerequest/CodeSystem/DeliveryTypeCS').code = 'delivery-to-alternative-address' implies (extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/alternative-delivery-address-ex').exists() and extension.where(url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/alternative-delivery-address-ex').value.empty().not())"
*/

Instance: INVALID-dispense-request-4
InstanceOf: ERPServiceRequestDispenseRequest
Usage: #example
Title: "Invalid Dispense Request 4"
* identifier[requestId].value = "INVALID-dispense-request-4"
* requisition.value = "GroupID-UC1"
* status = RequestStatus#completed
* intent = RequestIntent#filler-order
* subject = Reference(Example-Patient)
* code.coding[request-type] = ServiceRequestTypeCS#dispense-request
* code.coding[delivery-type] = DeliveryTypeCS#delivery-to-alternative-address
* requester = Reference(Example-HealthCareService-Organization)
* supportingInfo[AbgabeDaten] = Reference (UC1-Medication-Dispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)
* authoredOn = "2025-05-14"
