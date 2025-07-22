Instance: Example-Initial-Medication
InstanceOf: KBV_PR_ERP_Medication_PZN
Usage: #example
* extension[Kategorie].valueCodeableConcept.coding.version = "http://snomed.info/sct/11000274103/version/20240515"
* extension[Kategorie].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
* extension[Arzneimittelkategorie].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[Impfstoff].valueBoolean = false
* extension[Normgroesse].valueCode = #N1
* code = http://fhir.de/CodeSystem/ifa/pzn#08585997
* code.text = "Prospan® Hustensaft 100ml"
* form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#FLE
* ingredient
  * itemCodeableConcept = $cs-ask#R05CA12
  * itemCodeableConcept.text = "Hederae folium (Extr.sicc.(5-7.5:1))"
  * strength
    * numerator.value = 7
    * numerator.unit = "mg"
    * denominator.value = 1
    * denominator.unit = "ml"

Instance: Example-Initial-Medication-2
InstanceOf: KBV_PR_ERP_Medication_PZN
Usage: #example
* extension[Kategorie].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
* extension[Arzneimittelkategorie].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[Impfstoff].valueBoolean = false
* extension[Normgroesse].valueCode = #N1
* code = http://fhir.de/CodeSystem/ifa/pzn#02483617
* code.text = "Buscopan PLUS 20 St"
* form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#FTA
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

Instance: Example-Zyto-Medication
InstanceOf: KBV_PR_ERP_Medication_Compounding
Usage: #example
* extension[Kategorie].valueCodeableConcept.coding.code = #1208954007
* extension[Arzneimittelkategorie].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[Impfstoff].valueBoolean = false
* code = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type#rezeptur
* form.text = "Infusionslösung"
* amount.numerator.extension[Gesamtmenge].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension[Gesamtmenge].valueString = "500"
* amount.numerator.unit = "ml"
* amount.denominator.value = 1
* ingredient[+]
  * itemCodeableConcept.text = "Etoposid"
  * strength
    * numerator.value = 180
    * numerator.unit = "mg"
    * denominator.value = 1
* ingredient[+]
  * itemCodeableConcept.text = "NaCl 0,9 %"
  * strength
    * numerator.value = 500
    * numerator.unit = "ml"
    * denominator.value = 1