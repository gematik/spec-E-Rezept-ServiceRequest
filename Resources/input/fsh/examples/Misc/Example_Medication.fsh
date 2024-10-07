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

Instance: Example-Initial-Medication-2
InstanceOf: $KBV_PR_ERP_Medication_PZN
Usage: #inline
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* extension[Kategorie].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
* extension[Arzneimittelkategorie].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[Impfstoff].valueBoolean = false
* extension[Normgroesse].valueCode = #N1
* code = http://fhir.de/CodeSystem/ifa/pzn#02483617
* code.text = "Buscopan PLUS 20 St"
* form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#FTA

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

Instance: SimpleMedication
InstanceOf: GEM_ERP_PR_Medication
Title:   "Sample Simple Medication"
Usage: #example
* code.coding[pzn]
  * system = "http://fhir.de/CodeSystem/ifa/pzn"
  * code = #08585997
* code.text = "Prospan® Hustensaft 100ml"