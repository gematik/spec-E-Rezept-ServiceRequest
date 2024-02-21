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
* extension[PriorPrescriptionID]
  * ^short = "Provide a previous PrescriptionID that corresponds to the requested medication."
  * ^comment = "Must be given in the form xxx.xxx.xxx.xxx.xxx.xx."
  * ^definition = "
The MedicationRequest can contain a PrescriptionId of a prescription that has already been issued.

If a previous prescription ID is known, the writing system MAY indicate this in the medication request.

If this ID is available, the receiving system MUST be able to search for the previous regulation and give the user the opportunity to display and compare the content.
"

* medication[x] MS
* medication[x] only Reference

* medicationReference 1..1 MS
* medicationReference.reference 1..1 MS
* medicationReference.type 0..0
* medicationReference.identifier 0..0
* medicationReference.display 0..0

* subject MS
* subject only Reference($KBV_PR_FOR_Patient)
* subject.type 0..0
* subject.identifier 0..0
* subject.reference 1..1

* encounter 0..0

* requester MS
  * ^short = "Requesting doctor/facility/pharmacy for this MedicationRequest"
  * ^comment = "Is optional to specify here, since it must already be specified in the ServiceRequest"
* requester only Reference($KBV_PR_FOR_Practitioner or ERPServiceRequestOrganization)
* requester.type 0..0
* requester.identifier 0..1
* requester.reference 0..1

* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
* groupIdentifier 0..0
* courseOfTherapyType 0..0

// Wenn eine Coverage genutzt wird, kann es auch gleich die richtige sein
* insurance only Reference($KBV_PR_FOR_Coverage)
  * ^short = "Insurance status of the patient for whom the medication is requested"
  * ^comment = "If this information is already known, it can optionally be given here"
* insurance 0..1

* dosageInstruction 0..1

* dispenseRequest 0..1 MS
* dispenseRequest.quantity 1..1 MS
* dispenseRequest.quantity.value 1..1 MS
* dispenseRequest.quantity.value ^short = "Number of packs prescribed"
* dispenseRequest.quantity.value ^definition = "Number of packs prescribed"
* dispenseRequest.quantity.unit 0..0
* dispenseRequest.quantity.system 1..1 MS
* dispenseRequest.quantity.system = $UNITSOFMEASURE (exactly)
* dispenseRequest.quantity.code 1..1 MS
* dispenseRequest.quantity.code = #{Package} (exactly)
* dispenseRequest.performer 0..0

* substitution 0..1

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
* extension[Kategorie].valueCodeableConcept.coding = http://snomed.info/sct#373873005:860781008=362943005 "Pharmaceutical / biologic product (product) : Has product characteristic (attribute) = Manual method (qualifier value)"
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
