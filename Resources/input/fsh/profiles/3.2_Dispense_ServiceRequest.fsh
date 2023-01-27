Profile: GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
Parent: ServiceRequest
Id: gem-pr-erp-medreq-dispense-service-request
Title: "GEM PR ERP MEDREQ Dispense Service Request"
Description: "ServiceRequest that is used to initiate a dispense request for a pharmacy"
* identifier only GEM_ERP_MEDREQ_PR_RequestIdentifier
* basedOn 1..1
  * ^comment = "Einem ServiceRequest ist genau ein MedicationRequest zugeordnet, sodass unabhängige Bearbeitungen möglich sind."
* basedOn only Reference(GEM_PR_ERP_MEDREQ_MedicationRequest)

* orderDetail 1..1 MS
// orderDetail from PrescriptionDeliveryTypeVS (required)

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
* reasonReference only Reference(GEM_PR_ERP_MEDREQ_RemainingMedication_Observation)

* note MS
