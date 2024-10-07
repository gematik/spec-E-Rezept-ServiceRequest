Profile: ERPServiceRequestMedicationRequest
Parent: MedicationRequest
Id: erp-service-request-medication-request
Title: "ERP Service Request Medication Request"
Description: "Medical and pharmaceutical information for the prescription request"
* insert Meta (erp-service-request-medication-request)

* extension MS
  * ^comment = "If the previous recipe ID is known, it can be named here"
* extension contains PrescriptionIdEx named PriorPrescriptionID 0..1 MS
* modifierExtension contains RequestMVOEX named requestMVO 0..1 MS ?! 

* subject MS
* subject only Reference(ERPServiceRequestPatient)
  * ^short = "Patient for whom a dispense is requested on behalf of the patient."

* extension[PriorPrescriptionID]
  * ^short = "Provide a previous PrescriptionID that corresponds to the requested medication."
  * ^comment = "Must be given in the form xxx.xxx.xxx.xxx.xxx.xx."
  * ^definition = "
The MedicationRequest can contain a PrescriptionId of a prescription that has already been issued.
If a previous prescription ID is known, the writing system MAY indicate this in the medication request.
If this ID is available, the receiving system MUST be able to search for the previous regulation and give the user the opportunity to display and compare the content.
"
* modifierExtension[requestMVO]
  * ^short = "Multiple prescription order"
  * ^definition = "If the prescription is should be a multiple prescription order. Only the 'Kennzeichen' should be stated, indicating that the prescription is requested to be a multiple prescription order."
  * ^comment = "When this extension is received by a PVS, the prescriber has to be visually notified about the request for a multiple prescription order."
  * ^isModifierReason = "When this extension is received by a PVS, the prescriber has to be visually notified about the request for a multiple prescription order."

* medication[x] MS
* medication[x] only Reference(KBV_PR_ERP_Medication_PZN or KBV_PR_ERP_Medication_Compounding or KBV_PR_ERP_Medication_Ingredient or KBV_PR_ERP_Medication_FreeText)

* dispenseRequest 0..1 MS
  * quantity 1..1 MS
    * value 1..1 MS
      * ^short = "Number of packs prescribed"
      * ^definition = "Number of packs prescribed"
    * system 1..1 MS
    * system = $UNITSOFMEASURE (exactly)
    * code 1..1 MS
    * code = #{Package} (exactly)
    * unit 0..0
