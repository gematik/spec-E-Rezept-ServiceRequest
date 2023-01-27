Profile: GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
Parent: ServiceRequest
Id: gem-pr-erp-medreq-dispense-service-request
Title: "GEM PR ERP MEDREQ Dispense Service Request"
Description: "ServiceRequest that is used to initiate a dispense request for a pharmacy"

* extension contains
    GEM_EX_MEDREQ_EPrescriptionToken named EPrescriptionToken 1..1

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Defines identifiers that can be used for this context"

* identifier 1..* MS
* identifier contains requestId 1..1
* identifier[requestId] only GEM_ERP_MEDREQ_PR_RequestIdentifier

* basedOn 0..1 MS
  * ^short = "MedicationRequest, der von der Pflegeeinrichtung gewünscht wird oder vom Arzt erfüllt wurde."
  * ^comment = "Einem ServiceRequest ist genau ein MedicationRequest zugeordnet, sodass unabhängige Bearbeitungen möglich sind."
* basedOn only Reference($KBV_PR_ERP_Prescription)

* requisition 1..1 MS
* requisition only GEM_ERP_MEDREQ_PR_RequestGroupIdentifier
  * ^short = "Identifier des Vorgangs. Alle ServiceRequests innerhalb eines Vorgangs erhalten die gleiche ID."
  * ^comment = "Ist als Fall oder VorgangsID zu verstehen, um nachverfolgen zu können zu welcher Anfrage der ServiceRequest gehört."

* status MS
* status from GEM_VS_MEDREQ_RequestStatus
  * ^short = "Gibt den Bearbeitungsstand eines ServiceRequests an"

* intent = #filler-order

* code 1..1 MS
* code from GEM_VS_MEDREQ_ServiceRequestCode
  * ^short = "Gibt die Art des ServiceRequests an."
  * ^comment = "#prescription-request dient der Anfrage eines Rezeptes an einen Arzt. #pharmacy-delivery-request dient als ServiceRequest für eine Apotheke zur Belieferung"

* subject MS
* subject only Reference($KBV_PR_FOR_Patient)

* orderDetail 1..1 MS
* orderDetail from PrescriptionFullfillmentTypeVS (required)
  * ^short = "Gibt an wie die Rezeptanfrage erfüllt werden soll."
  * ^comment = "Wenn das Rezept an eine Apotheke geht, muss ein entsprechender ServiceRequest im Bundle enthalten sein."

* occurrence[x] 1..1 MS
* occurrence[x] only dateTime
  * ^short = "Gibt das Datum an, an dem das Rezept ausgestellt werden soll"

* authoredOn 1..1 MS
  * ^short = "Datum der Erstellung des Requests"
  * ^comment = "Wird initial angelegt und dann nicht mehr verändert."


* requester 1..1 MS
* requester only Reference(KBV_PR_FOR_Practitioner or $KBV_PR_FOR_PractitionerRole or $KBV_PR_FOR_Organization)

//TODO geht das hier schöner: ?
* performerType 1..1 MS
  * ^short = "Gibt an, wer den ServiceRequest erfüllen soll"
  * ^comment = "Dient als Unterscheidungsmerkmal für die ServiceRequests."
* performerType.coding 1..1
* performerType.coding.system = "https://gematik.de/fhir/erpmedreqcom/GEM_VS_MEDREQ_PerformerType"
* performerType.coding.code = #ausstellender-arzt

* performer only Reference($KBV_PR_FOR_Practitioner or $KBV_PR_FOR_Organization or $KBV_PR_FOR_PractitionerRole)

* reasonCode MS //TODO CS finden
//TODO: Invariante bei Code XX dann GEM_PR_ERP_MEDREQ_RemainingMedication_Observation nutzen
* reasonReference only Reference(GEM_PR_ERP_MEDREQ_RemainingMedication_Observation)

* note MS
  * ^short = "Weitere Angaben zur Rezeptanforderung"
  * ^comment = "Eventuell nicht spezifizierte Anwendungsfälle können hier im Freitext platziert werden"
