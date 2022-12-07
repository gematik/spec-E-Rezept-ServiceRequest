Profile: GEM_PR_ERP_MEDREQ_MedicationRequest
Parent: MedicationRequest
Id: gem-pr-erp-medreq-medication-request
Title: "GEM PR ERP MEDREQ Medication Request"
Description: "Profile on the Medication Request that is to be sent"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_MedicationRequest)

* implicitRules 0..0
* contained 0..0
* identifier 0..0
* status = #draft (exactly)
* intent = #proposal (exactly)
* reported[x] 0..0

* extension contains
    PrescriptionDeliveryTypeEX named PrescriptionDeliveryType 1..1 and
    RemainingQuantityEX named RemainingQuantity ..1 and
    RemainingRangeDateEX named RemainingRangeDate ..1 and
    FreeTextEX named FreeText ..1
* extension[PrescriptionDeliveryType] 1..1 MS
* extension[PrescriptionDeliveryType] ^short = "Zustelltyp"
* extension[FreeText].value[x] 1..
* extension[FreeText].value[x] only string
* extension[FreeText] ^short = "Freitext"

* medication[x] 1..1 MS
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

* subject 1..1 MS
* subject only Reference($KBV_PR_FOR_Patient)
* subject.type 0..0
* subject.identifier only $KVID or $PKVID

* encounter 0..0

* requester only Reference($KBV_PR_FOR_Practitioner)
* requester.type 0..0

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
* id = "b04f58bc-bb37-4490-9561-2e6954764c4a"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* identifier.value = "S037462981"
* name.use = #official
* name.family = "Fürst"
* name.family.extension[+].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name.family.extension[=].valueString = "Fuerst"
* name.given = "Doreen"
* birthDate = "1965-04-10"
* address.type = #both
* address.line = "Pappelallee 89"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "89"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Pappelallee"
* address.city = "Rothenkirchen"
* address.postalCode = "08237"
* address.country = "D"

Instance: MedicationExamplePZN
InstanceOf: Medication
Usage: #inline
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
* id = "fe63895a-c5df-4598-ba4a-d2fee3477cb9"
* MetaInstance(GEM_PR_ERP_MEDREQ_MedicationRequest)
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
* id = "b3eb274e-195f-4ac3-a6e6-f1d113434693"
* MetaInstance(GEM_PR_ERP_MEDREQ_MedicationRequest)
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
* id = "12b8036c-0cc6-43cf-b9cc-c6ebccde0d58"
* MetaInstance(GEM_PR_ERP_MEDREQ_MedicationRequest)
* extension[+][PrescriptionDeliveryTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeEX"
* extension[=][PrescriptionDeliveryTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/StructureDefinition/PrescriptionDeliveryTypeCS#DispensingOrganisation "Belieferung der anfragenden Organisation durch Apotheke"
* medicationReference = Reference(MedicationExamplePZN)
* subject = Reference(KBV_PR_FOR_PatientExample)
* dosageInstruction.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_DosageFlag"
* dosageInstruction.extension.valueBoolean = true
* dosageInstruction.text = "3mal täglich dünn auftragen"
* dispenseRequest.quantity = 1 '{Package}'
* substitution.allowedBoolean = true