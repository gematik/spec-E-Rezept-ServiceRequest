Profile: ERPServiceRequestMedicationRequest
Parent: MedicationRequest
Id: erp-service-request-medication-request
Title: "ERP Service Request Medication Request"
Description: "Medical and pharmaceutical information for the prescription request"
* insert Meta (erp-service-request-medication-request)

* extension MS
  * ^comment = "If the previous recipe ID is known, it can be named here"
* extension contains
    PrescriptionIdEx named PriorPrescriptionID 0..1 MS
    and KBV_EX_ERP_Multiple_Prescription named requestMVO 0..1 MS ?!
    and RedeemByPatientEX named redeemByPatient 0..1 MS ?!

* extension[PriorPrescriptionID]
  * ^short = "Provide a previous PrescriptionID that corresponds to the requested medication."
  * ^comment = "Must be given in the form xxx.xxx.xxx.xxx.xxx.xx."
  * ^definition = "
The MedicationRequest can contain a PrescriptionId of a prescription that has already been issued.
If a previous prescription ID is known, the writing system MAY indicate this in the medication request.
If this ID is available, the receiving system MUST be able to search for the previous regulation and give the user the opportunity to display and compare the content.
"
* extension[requestMVO]
  * ^short = "Multiple prescription order"
  * ^definition = "If the prescription is should be a multiple prescription order. Only the 'Kennzeichen' should be stated, indicating that the prescription is requested to be a multiple prescription order."
  * ^comment = "When this extension is received by a PVS, the prescriber has to be visually notified about the request for a multiple prescription order."
  * extension[Kennzeichen] MS
  * extension[Nummerierung] 0..0
  * extension[Zeitraum] 0..0
  * extension[ID] 0..0

* extension[redeemByPatient]
  * ^short = "Redeem By Patient"
  * ^definition = "Indicates whether the prescription should be redeemed by the patient."
  * ^comment = "This determines the Flow Type of the prescription to be set to 160/200 so that the patient can redeem the prescription himself."

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

Instance: Example-Initial-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #example
* extension[PriorPrescriptionID].valueIdentifier
  * system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
  * value = "160.100.000.000.001.36"
* status = #active
* intent = #order
* medicationReference = Reference(Example-Initial-Medication)
* subject = Reference(Example-Patient)
* authoredOn = "2022-05-20"
* dosageInstruction.text = "2mal tägl. 5ml"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true

Instance: Example-Initial-Medication
InstanceOf: $KBV_PR_ERP_Medication_PZN
Usage: #inline
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* extension[Kategorie].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[Kategorie].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[Kategorie].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
* extension[Arzneimittelkategorie].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[Arzneimittelkategorie].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[Impfstoff].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[Impfstoff].valueBoolean = false
* extension[Normgroesse].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[Normgroesse].valueCode = #N1
* code = http://fhir.de/CodeSystem/ifa/pzn#08585997
* code.text = "Prospan® Hustensaft 100ml"
* form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#FLE

Instance: Example-Zyto-Medication-Request
InstanceOf: ERPServiceRequestMedicationRequest
Usage: #inline
* status = #active
* intent = #order
* medicationReference = Reference(Example-Zyto-Medication)
* subject = Reference(Example-Patient)
* authoredOn = "2022-05-20"
* substitution.allowedBoolean = false

Instance: Example-Zyto-Medication
InstanceOf: $KBV_PR_ERP_Medication_Compounding
Usage: #inline
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding|1.1.0"
* extension[Kategorie].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[Kategorie].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[Kategorie].valueCodeableConcept.coding = http://snomed.info/sct#373873005:860781008=362943005
* extension[Arzneimittelkategorie].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[Arzneimittelkategorie].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[Impfstoff].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[Impfstoff].valueBoolean = false
* code = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type#rezeptur
* form.text = "Infusionslösung"
* amount.numerator.extension[Gesamtmenge].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension[Gesamtmenge].valueString = "500"
* amount.numerator.unit = "ml"
* amount.denominator.value = 1
* ingredient[0].itemCodeableConcept.text = "Etoposid"
* ingredient[=].strength.numerator.value = 180
* ingredient[=].strength.numerator.unit = "mg"
* ingredient[=].strength.denominator.value = 1
* ingredient[+].itemCodeableConcept.text = "NaCl 0,9 %"
* ingredient[=].strength.numerator.value = 500
* ingredient[=].strength.numerator.unit = "ml"
* ingredient[=].strength.denominator.value = 1
