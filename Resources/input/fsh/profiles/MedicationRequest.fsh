Profile: GEM_PR_ERP_MEDREQ_MedicationRequest
Parent: MedicationRequest
Id: GEM-PR-ERP-MEDREQ-MedicationRequest
Title: "GEM PR ERP MEDREQ Medication Request"
Description: "Profile on the Medication Request that is to be sent"
* insert Meta (GEM-PR-ERP-MEDREQ-MedicationRequest)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-MedicationRequest)

* implicitRules 0..0
* contained 0..0
* identifier 0..0
* status = #draft (exactly)
* intent = #proposal (exactly)
* reported[x] 0..0

* extension contains
    PrescriptionDeliveryTypeEX named PrescriptionDeliveryType 1..1 and
    PrescriptionIdEX named PriorPrescriptionID ..1 and
    RemainingQuantityEX named RemainingQuantity ..1 and
    RemainingRangeDateEX named RemainingRangeDate ..1 and
    FreeTextEX named FreeText ..1
* extension[PrescriptionDeliveryType] 1..1 MS
* extension[PrescriptionDeliveryType] ^short = "Zustelltyp"
* extension[PrescriptionIdEX] ^short = "PrescriptionId der vorausgegangenen Verordnung"
* extension[FreeText].value[x] 1..
* extension[FreeText].value[x] only string
* extension[FreeText] ^short = "Freitext"

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

* subject only Reference(KBV_PR_FOR_Patient)
* subject.type 0..0
* subject.identifier 0..0
* subject.reference 1..1

* encounter 0..0

* requester only Reference(KBV_PR_FOR_Practitioner)
* requester.type 0..0
* requester.identifier 0..0
* requester.reference 1..1

* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
* groupIdentifier 0..0
* courseOfTherapyType 0..0
* insurance 0..1

* dosageInstruction 0..1

* dispenseRequest 1..1 MS
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


Instance: KBV_PR_FOR_PatientExample
InstanceOf: KBV_PR_FOR_Patient
Usage: #inline
* id = "KBV-PR-FOR-PatientExample"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier[versichertenId_GKV].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[versichertenId_GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId_GKV].value = "S037462981"
* name[name].use = #official
* name[name].family = "Fürst"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Fuerst"
* name[name].given = "Doreen"
* birthDate = "1965-04-10"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Pappelallee 89"
* address[Strassenanschrift].line.extension[Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[Hausnummer].valueString = "89"
* address[Strassenanschrift].line.extension[Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[Strasse].valueString = "Pappelallee"
* address[Strassenanschrift].city = "Rothenkirchen"
* address[Strassenanschrift].postalCode = "08237"
* address[Strassenanschrift].country = "D"

Instance: MedicationExamplePZN
InstanceOf: Medication
Usage: #inline
* id = "MedicationExamplePZN"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[=].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[=].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[=].valueBoolean = false
* extension[+].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[=].valueCode = #N1
* code = http://fhir.de/CodeSystem/ifa/pzn#02090906
* code.text = "Fucidine® 20mg/g Creme 15g N1"
* form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#CRE
* amount.numerator.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension.valueString = "15"
* amount.numerator = http://unitsofmeasure.org#g "g"
* amount.denominator.value = 1

Instance: MedicationRequestExampleSelfPickup
InstanceOf: GEM_PR_ERP_MEDREQ_MedicationRequest
Usage: #inline
Title: "MedicationRequestExample_SelfPickup"
Description: "Example of a medication request to be picked up by the patient themselves"
* id = "MedicationRequestExampleSelfPickup"
* MetaInstance(GEM-PR-ERP-MEDREQ-MedicationRequest)
* extension[+][PrescriptionDeliveryTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeEX"
* extension[=][PrescriptionDeliveryTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeCS#SelfPickup "Selbstabholer"
* medicationReference = Reference(MedicationExamplePZN)
* subject = Reference(KBV_PR_FOR_PatientExample)
* dosageInstruction.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension.valueBoolean = true
* dosageInstruction.text = "3mal täglich dünn auftragen"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true

Instance: MedicationRequestExampleRequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MedicationRequest
Usage: #inline
Title: "MedicationRequestExample_RequestingOrganisation"
Description: "Example of a medication request resulting in a prescription sent to the dispensing organization"
* id = "MedicationRequestExampleRequestingOrganisation"
* MetaInstance(GEM-PR-ERP-MEDREQ-MedicationRequest)
* extension[+][PrescriptionDeliveryTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeEX"
* extension[=][PrescriptionDeliveryTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeCS#RequestingOrganisation "Beschaffung durch anfragende Organisation"
* medicationReference = Reference(MedicationExamplePZN)
* subject = Reference(KBV_PR_FOR_PatientExample)
* dosageInstruction.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension.valueBoolean = true
* dosageInstruction.text = "3mal täglich dünn auftragen"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true

Instance: MedicationRequestExampleDispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MedicationRequest
Usage: #inline
Title: "MedicationRequestExample_DispensingOrganisation"
Description: "Example of a medication request resulting in a prescription sent to the dispensing organization"
* id = "MessageHeaderExampleDispensingOrganisation"
* MetaInstance(GEM-PR-ERP-MEDREQ-MedicationRequest)
* extension[+][PrescriptionDeliveryTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeEX"
* extension[=][PrescriptionDeliveryTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeCS#DispensingOrganisation "Belieferung der anfragenden Organisation durch Apotheke"
* medicationReference = Reference(MedicationExamplePZN)
* subject = Reference(KBV_PR_FOR_PatientExample)
* dosageInstruction.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension.valueBoolean = true
* dosageInstruction.text = "3mal täglich dünn auftragen"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true