Profile: ERPServiceRequestMedicationDispense
Parent: MedicationDispense
Id: erp-service-request-medication-dispense
Title: "ERP Service Request Medication Dispense"
Description: "Medical and pharmaceutical information for the dispense information"
* insert Meta (erp-service-request-medication-dispense)

* identifier MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^slicing.description = "Slicing for identifier elements"
  * ^slicing.ordered = false

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only $GEM_ERP_PR_PrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns

* subject MS
* subject only Reference(ERPServiceRequestPatient)
  * ^short = "Patient for whom a dispense is requested on behalf of the patient."

* medication[x] MS
* medication[x] only Reference(KBV_PR_ERP_Medication_PZN or KBV_PR_ERP_Medication_Compounding or KBV_PR_ERP_Medication_Ingredient or KBV_PR_ERP_Medication_FreeText)
