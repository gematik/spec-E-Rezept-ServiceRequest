Profile: GEM_PR_ERP_MEDREQ_MedicationRequest
Parent: $ISiKMedikationsVerordnung
Id: gem-pr-erp-medreq-medication-request
Title: "GEM PR ERP MEDREQ Medication Request"
Description: "Profile on the Medication Request that is to be sent"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_MedicationRequest)
* subject 1..1 MS
* subject only Reference($KBV_PR_FOR_Patient)

* medication[x] only Reference($KBV_PR_ERP_Medication_FreeText or $KBV_PR_ERP_Medication_Compounding or $KBV_PR_ERP_Medication_PZN or $KBV_PR_ERP_Medication_Ingredient)
* medication[x] MS
* medication[x] ^slicing.discriminator.type = #type
* medication[x] ^slicing.discriminator.path = "$this"
* medication[x] ^slicing.rules = #closed
* medicationReference 1.. MS
* medicationReference only Reference($KBV_PR_ERP_Medication_FreeText or $KBV_PR_ERP_Medication_Compounding or $KBV_PR_ERP_Medication_PZN or $KBV_PR_ERP_Medication_Ingredient)
* medicationReference ^sliceName = "medicationReference"
* medicationReference.reference 1.. MS
* medicationReference.type ..0
* medicationReference.identifier ..0
* medicationReference.display ..0

* dosageInstruction 0..0
* dosageInstruction.asNeededBoolean 0..0
* dosageInstruction.asNeeded[x] 0..0
* dosageInstruction.asNeeded[x] ^slicing.rules = #closed

* dosageInstruction.timing.repeat.bounds[x] ^slicing.rules = #closed
* dosageInstruction.doseAndRate.dose[x] ^slicing.rules = #closed
* dosageInstruction.doseAndRate.rate[x] ^slicing.rules = #closed

* substitution 0..0
* substitution.allowedBoolean 0..0
* substitution.allowed[x] ^slicing.rules = #closed