Profile: GEM_PR_ERP_MEDREQ_MedicationRequest
Parent:
Id: gem-pr-erp-medreq-medication-request
Title: "GEM PR ERP MEDREQ Medication Request"
Description: "Profile on the Medication Request that is to be sent"
* category 1..1 MS
* subject 1..1 MS
* subject only Reference($KBV_PR_FOR_Patient)
GEM_PR_MREQ_MedicationRequest
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

* dosageInstruction ..1 MS
* dosageInstruction.sequence ..0
* dosageInstruction.text MS
* dosageInstruction.text ^short = "Dosieranweisung"
* dosageInstruction.text ^definition = "Dosieranweisung einer Verordnung"
* dosageInstruction.text ^maxLength = 500
* dosageInstruction.additionalInstruction ..0
* dosageInstruction.patientInstruction MS
* dosageInstruction.patientInstruction ^short = "Gebrauchsanweisung einer Rezeptur"
* dosageInstruction.patientInstruction ^definition = "Gebrauchsanweisung einer Rezeptur"
* dosageInstruction.patientInstruction ^maxLength = 500
* dosageInstruction.timing ..0
* dosageInstruction.asNeeded[x] ..0
* dosageInstruction.site ..0
* dosageInstruction.route ..0
* dosageInstruction.method ..0
* dosageInstruction.doseAndRate ..0
* dosageInstruction.maxDosePerPeriod ..0
* dosageInstruction.maxDosePerAdministration ..0
* dosageInstruction.maxDosePerLifetime ..0

* substitution MS
* substitution.allowed[x] only boolean
* substitution.allowed[x] MS
* substitution.allowed[x] ^slicing.discriminator.type = #type
* substitution.allowed[x] ^slicing.discriminator.path = "$this"
* substitution.allowed[x] ^slicing.ordered = false
* substitution.allowed[x] ^slicing.rules = #closed
* substitution.allowedBoolean 1.. MS
* substitution.allowedBoolean only boolean
* substitution.allowedBoolean ^sliceName = "allowedBoolean"
* substitution.allowedBoolean ^short = "Aut idem"
* substitution.allowedBoolean ^definition = "In diesem Feld wird angegeben ob das Arzneimittel austauschbar ist oder nicht\r\n\r\ntrue:  aut idem möglich (austauschbar)\r\nfalse: aut idem ausgeschlossen (nicht austauschbar)"
* substitution.reason ..0