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

* dosageInstruction 0..0

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

* substitution 0..0