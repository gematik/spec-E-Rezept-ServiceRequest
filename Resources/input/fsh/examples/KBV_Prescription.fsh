Instance: Example-Response-Medication-Request
InstanceOf: $KBV_PR_ERP_Prescription
Usage: #inline
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription|1.1.0"
* extension[Zuzahlungsstatus].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment"
* extension[Zuzahlungsstatus].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_StatusCoPayment#1
* extension[Notdienstgebuehr].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee"
* extension[Notdienstgebuehr].valueBoolean = false
* extension[BVG].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_BVG"
* extension[BVG].valueBoolean = false
* extension[Mehrfachverordnung].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription"
* extension[Mehrfachverordnung].extension[Kennzeichen].url = "Kennzeichen"
* extension[Mehrfachverordnung].extension[Kennzeichen].valueBoolean = false
* status = #active
* intent = #order
* medicationReference = Reference(Medication/Example-Response-Medication)
* subject = Reference(Patient/Example-Patient)
* authoredOn = "2022-05-20"
* requester = Reference(Practitioner/Example-Practitioner)
* insurance = Reference(Coverage/Initial-Coverage)
* dosageInstruction.extension[Dosierungskennzeichen].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension[Dosierungskennzeichen].valueBoolean = true
* dosageInstruction.text = "2mal tägl. 5ml"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true

Instance: Example-Response-Medication
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
* code.text = "Prospan® Hustensaft 100ml N1"
* form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#FLE