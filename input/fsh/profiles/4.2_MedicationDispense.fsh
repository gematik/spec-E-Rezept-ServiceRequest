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
* identifier[prescriptionID] only EPrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns

* subject MS
* subject only Reference(ERPServiceRequestPatient)
  * ^short = "Patient for whom a dispense is requested on behalf of the patient."

* medication[x] MS
* medication[x] only Reference(KBV_PR_ERP_Medication_PZN or KBV_PR_ERP_Medication_Compounding or KBV_PR_ERP_Medication_Ingredient or KBV_PR_ERP_Medication_FreeText)

* quantity 1..1 MS
  * ^short = "Number of dispensed units"
  * ^definition = "The number of units of the medication to be supplied per dispense. Usually value and unit are stated which are free text variants. If a structured code is used it must be from UnitsOfMeasure."
  * value 1..1 MS
    * ^short = "Number dispensed"
    * ^definition = "Number dispensed"
  * system 0..1
  * system = $UNITSOFMEASURE (exactly)
  * code 0..1
    * ^short = "Code from Unit of measure"
    * ^definition = "If a structured code is used it must be from UnitsOfMeasure"
  * unit 1..1 MS
    * ^short = "Requested units of the prescription"
    * ^definition = "This is a free text field that can be used to specify the units of the prescription."

* dosageInstruction MS
  * text MS
    * ^short = "Dosieranweisung"
    * ^definition = "Dosieranweisung einer Verordnung"
    * ^maxLength = 500
  * patientInstruction MS
    * ^short = "Gebrauchsanweisung einer Rezeptur"
    * ^definition = "Gebrauchsanweisung einer Rezeptur"
    * ^maxLength = 500