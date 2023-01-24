Profile: GEM_PR_ERP_MEDREQ_ServiceRequest
Parent: ServiceRequest
Id: gem-pr-erp-medreq-service-request
Title: "GEM PR ERP MEDREQ Service Request"
Description: "ServiceRequest that is used for Rezeptanforderung via KIM"
* identifier only GEM_ERP_MEDREQ_PR_RequestIdentifier
* basedOn 1..1
  * ^comment = "Einem ServiceRequest ist genau ein MedicationRequest zugeordnet, sodass unabhängige Bearbeitungen möglich sind."
* basedOn only Reference(GEM_PR_ERP_MEDREQ_MedicationRequest or $KBV_PR_ERP_Prescription)

* category 1..1 MS
* category from PrescriptionDeliveryTypeVS (required)

// code könnte man noch finden "Medikationsanforderung" o.Ä. gibt es bestimmt schon

* subject only Reference(Patient)

* occurrence[x] 1..1 MS
* occurrence[x] only dateTime
  * ^comment = "Gibt den letzten Bearbeitungsstand der Ressource an (als lastupdated)"

* authoredOn 1..1 MS
  * ^comment = "Wird initial angelegt und dann nicht mehr verändert."

* requester 1..1 MS
* requester only Reference(KBV_PR_FOR_Practitioner or PractitionerRole or Organization)

* reasonCode MS //TODO CS finden
//TODO: Invariante bei Code XX dann GEM_PR_ERP_MEDREQ_RemainingMedication_Observation nutzen

* note MS
