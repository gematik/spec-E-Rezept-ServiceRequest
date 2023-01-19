// Originally defined on lines 1 - 9
CodeSystem: PrescriptionDeliveryTypeCS
Id: PrescriptionDeliveryTypeCS
Title: "CodeSystem for PrescriptionDeliveryType"
Description: "This type defines how the prescription will be delivered"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeCS"
* ^version = "1.0"
* #SelfPickup "Selbstabholer"
* #RequestingOrganisation "Beschaffung durch anfragende Organisation"
* #DispensingOrganisation "Belieferung der anfragenden Organisation durch Apotheke"

