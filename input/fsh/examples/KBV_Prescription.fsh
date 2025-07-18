Instance: Example-Response-Medication
InstanceOf: KBV_PR_ERP_Medication_PZN
Usage: #inline
* extension[Kategorie].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[Kategorie].valueCodeableConcept.coding.version = "http://snomed.info/sct/11000274103/version/20240515"
* extension[Kategorie].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
* extension[Arzneimittelkategorie].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[Arzneimittelkategorie].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[Impfstoff].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[Impfstoff].valueBoolean = false
* extension[Normgroesse].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[Normgroesse].valueCode = #N1
* code = http://fhir.de/CodeSystem/ifa/pzn#08585997
* code.text = "Prospan® Hustensaft 100ml N1"
* form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#FLE
* ingredient[+]
  * itemCodeableConcept = $cs-ask#A03BB01
  * itemCodeableConcept.text = "Butylscopolaminium-bromid"
  * strength
    * numerator.value = 10
    * numerator.unit = "mg"
    * denominator.value = 1
    * denominator.unit = "Stück"
* ingredient[+]
  * itemCodeableConcept = $cs-ask#N02BE01
  * itemCodeableConcept.text = "Paracetamol"
  * strength
    * numerator.value = 500
    * numerator.unit = "mg"
    * denominator.value = 1
    * denominator.unit = "Stück"