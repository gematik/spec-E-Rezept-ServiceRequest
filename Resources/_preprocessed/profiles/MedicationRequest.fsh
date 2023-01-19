// Originally defined on lines 1 - 73
Profile: GEM_PR_ERP_MEDREQ_MedicationRequest
Parent: MedicationRequest
Id: GEM-PR-ERP-MEDREQ-MedicationRequest
Title: "GEM PR ERP MEDREQ Medication Request"
Description: "Profile on the Medication Request that is to be sent"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-MedicationRequest"
* ^version = "1.0"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-MedicationRequest|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0
* implicitRules 0..0
* contained 0..0
* identifier 0..0
* status = #draft (exactly)
* intent = #proposal (exactly)
* reported[x] 0..0
* extension contains
    PrescriptionDeliveryTypeEX named PrescriptionDeliveryType 0.. and
    PrescriptionIdEX named PriorPrescriptionID 0.. and
    RemainingQuantityEX named RemainingQuantity 0.. and
    RemainingRangeDateEX named RemainingRangeDate 0.. and
    FreeTextEX named FreeText 0..
* extension[PrescriptionDeliveryType] 1..1
* extension[PriorPrescriptionID] ..1
* extension[RemainingQuantity] ..1
* extension[RemainingRangeDate] ..1
* extension[FreeText] ..1
* extension[PrescriptionDeliveryType] 1..1
* extension[PrescriptionDeliveryType] MS
* extension[PrescriptionDeliveryType] ^short = "Zustelltyp"
* extension[PrescriptionIdEX] ^short = "PrescriptionId der vorausgegangenen Verordnung"
* extension[FreeText].value[x] 1..
* extension[FreeText].value[x] only string
* extension[FreeText] ^short = "Freitext"
* medication[x] ^slicing.discriminator.type = #type
* medication[x] ^slicing.discriminator.path = "$this"
* medication[x] ^slicing.rules = #closed
* medicationReference 1..
* medicationReference MS
* medicationReference only Reference(https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText|1.1.0 or https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding|1.1.0 or https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0 or https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient|1.1.0)
* medicationReference ^sliceName = "medicationReference"
* medicationReference.reference 1..
* medicationReference.reference MS
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
* dispenseRequest 1..1
* dispenseRequest MS
* dispenseRequest.quantity 1..1
* dispenseRequest.quantity MS
* dispenseRequest.quantity.value 1..1
* dispenseRequest.quantity.value MS
* dispenseRequest.quantity.value ^short = "Anzahl der verordneten Packungen"
* dispenseRequest.quantity.value ^definition = "Anzahl der verordneten Packungen"
* dispenseRequest.quantity.unit 0..0
* dispenseRequest.quantity.system 1..1
* dispenseRequest.quantity.system MS
* dispenseRequest.quantity.system = "http://unitsofmeasure.org" (exactly)
* dispenseRequest.quantity.code 1..1
* dispenseRequest.quantity.code MS
* dispenseRequest.quantity.code = #{Package} (exactly)
* dispenseRequest.performer 0..0
* substitution 0..1
* extension[FreeText].extension 0..0

// Originally defined on lines 76 - 98
Instance: KBV_PR_FOR_PatientExample
InstanceOf: KBV_PR_FOR_Patient
Usage: #inline
* id = "KBV-PR-FOR-PatientExample"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* identifier.value = "S037462981"
* name.use = #official
* name.family = "Fürst"
* name.family.extension[0].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name.family.extension[0].valueString = "Fuerst"
* name.given = "Doreen"
* birthDate = "1965-04-10"
* address.type = #both
* address.line = "Pappelallee 89"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[0].valueString = "89"
* address.line.extension[1].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[1].valueString = "Pappelallee"
* address.city = "Rothenkirchen"
* address.postalCode = "08237"
* address.country = "D"

// Originally defined on lines 100 - 120
Instance: MedicationExamplePZN
InstanceOf: Medication
Usage: #inline
* id = "MedicationExamplePZN"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* extension[0].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* extension[0].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
* extension[1].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* extension[1].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* extension[2].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* extension[2].valueBoolean = false
* extension[3].url = "http://fhir.de/StructureDefinition/normgroesse"
* extension[3].valueCode = #N1
* code = http://fhir.de/CodeSystem/ifa/pzn#02090906
* code.text = "Fucidine® 20mg/g Creme 15g N1"
* form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#CRE
* amount.numerator.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize"
* amount.numerator.extension.valueString = "15"
* amount.numerator = http://unitsofmeasure.org#g "g"
* amount.denominator.value = 1

// Originally defined on lines 122 - 137
Instance: MedicationRequestExampleSelfPickup
InstanceOf: GEM_PR_ERP_MEDREQ_MedicationRequest
Title: "MedicationRequestExample_SelfPickup"
Description: "Example of a medication request to be picked up by the patient themselves"
Usage: #inline
* id = "MedicationRequestExampleSelfPickup"
* extension[0][PrescriptionDeliveryTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeEX"
* extension[0][PrescriptionDeliveryTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeCS#SelfPickup "Selbstabholer"
* medicationReference = Reference(MedicationExamplePZN)
* subject = Reference(KBV_PR_FOR_PatientExample)
* dosageInstruction.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension.valueBoolean = true
* dosageInstruction.text = "3mal täglich dünn auftragen"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true

// Originally defined on lines 139 - 154
Instance: MedicationRequestExampleRequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MedicationRequest
Title: "MedicationRequestExample_RequestingOrganisation"
Description: "Example of a medication request resulting in a prescription sent to the dispensing organization"
Usage: #inline
* id = "MedicationRequestExampleRequestingOrganisation"
* extension[0][PrescriptionDeliveryTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeEX"
* extension[0][PrescriptionDeliveryTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeCS#RequestingOrganisation "Beschaffung durch anfragende Organisation"
* medicationReference = Reference(MedicationExamplePZN)
* subject = Reference(KBV_PR_FOR_PatientExample)
* dosageInstruction.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension.valueBoolean = true
* dosageInstruction.text = "3mal täglich dünn auftragen"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true

// Originally defined on lines 156 - 171
Instance: MedicationRequestExampleDispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_MedicationRequest
Title: "MedicationRequestExample_DispensingOrganisation"
Description: "Example of a medication request resulting in a prescription sent to the dispensing organization"
Usage: #inline
* id = "MessageHeaderExampleDispensingOrganisation"
* extension[0][PrescriptionDeliveryTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeEX"
* extension[0][PrescriptionDeliveryTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeCS#DispensingOrganisation "Belieferung der anfragenden Organisation durch Apotheke"
* medicationReference = Reference(MedicationExamplePZN)
* subject = Reference(KBV_PR_FOR_PatientExample)
* dosageInstruction.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension.valueBoolean = true
* dosageInstruction.text = "3mal täglich dünn auftragen"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true

