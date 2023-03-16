Profile: MedicationRequestRequestedMedication
Parent: MedicationRequest
Id: medication-request-requested-medication
Title: "Angefragte Medication"
Description: "Medizinische und pharmazeutische Angaben zur Rezeptanfrage"
* insert Meta (medication-request-requested-medication)

* extension MS
  * ^comment = "Falls die vorherige RezeptID bekannt ist, kann diese hier benannt werden"
* extension contains
    GEM_EX_MEDREQ_Prescription_Id named PriorPrescriptionID 0..1

* medication[x] MS
* medication[x] ^slicing.discriminator.type = #type
* medication[x] ^slicing.discriminator.path = "$this"
* medication[x] ^slicing.rules = #closed

* medicationReference 1..1 MS
* medicationReference only Reference($KBV_PR_ERP_Medication_FreeText or $KBV_PR_ERP_Medication_Compounding or $KBV_PR_ERP_Medication_PZN or $KBV_PR_ERP_Medication_Ingredient)
* medicationReference ^sliceName = "medicationReference"
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
  * ^comment = "Anfragender Arzt/ Einrichung/ Apotheke für diesen MedicationRequest"
* requester only Reference($KBV_PR_FOR_Practitioner or OrganizationWithKIMAdress)
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
* insurance 0..1

* dosageInstruction 0..1

* dispenseRequest 0..1 MS
* dispenseRequest.quantity 1..1 MS
* dispenseRequest.quantity.value 1..1 MS
* dispenseRequest.quantity.value ^short = "Anzahl der verordneten Packungen"
* dispenseRequest.quantity.value ^definition = "Anzahl der verordneten Packungen"
* dispenseRequest.quantity.unit 0..0
* dispenseRequest.quantity.system 1..1 MS
* dispenseRequest.quantity.system = $UNITSOFMEASURE (exactly)
* dispenseRequest.quantity.code 1..1 MS
* dispenseRequest.quantity.code = #{Package} (exactly)
* dispenseRequest.performer 0..0

* substitution 0..1

Instance: Example-Initial-Medication-Request
InstanceOf: MedicationRequestRequestedMedication
Usage: #inline
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
InstanceOf: MedicationRequestRequestedMedication
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
