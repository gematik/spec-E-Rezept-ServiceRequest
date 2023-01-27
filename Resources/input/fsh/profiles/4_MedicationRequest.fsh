Profile: GEM_PR_ERP_MEDREQ_MedicationRequest
Parent: MedicationRequest
Id: GEM-PR-ERP-MEDREQ-MedicationRequest
Title: "GEM PR ERP MEDREQ Medication Request"
Description: "Profile on the Medication Request that is to be sent"
* insert Meta (GEM-PR-ERP-MEDREQ-MedicationRequest)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-MedicationRequest)

* extension contains
    PrescriptionIdEX named PriorPrescriptionID 0..1

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

* subject only Reference($KBV_PR_FOR_Patient)
* subject.type 0..0
* subject.identifier 0..0
* subject.reference 1..1

* encounter 0..0

* requester only Reference($KBV_PR_FOR_Practitioner)
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
