Profile: GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest
Parent: ServiceRequest
Id: GEM-PR-ERP-MEDREQ-Prescription-ServiceRequest
Title: "GEM PR ERP MEDREQ Prescription Service Request"
Description: "ServiceRequest that is used to request a prescription from a practitioner"
* insert Meta (GEM-PR-ERP-MEDREQ-Prescription-ServiceRequest)

* extension contains
    GEM_EX_MEDREQ_EPrescriptionToken named EPrescriptionToken 0..1 MS

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Defines identifiers that can be used for this context"

* identifier 1..* MS
* identifier contains requestId 1..1
* identifier[requestId] only GEM_ERP_MEDREQ_PR_RequestIdentifier

* basedOn 1..1 MS
  * ^short = "MedicationRequest, der von der Pflegeeinrichtung gewünscht wird oder vom Arzt erfüllt wurde."
  * ^comment = "Einem ServiceRequest ist genau ein MedicationRequest zugeordnet, sodass unabhängige Bearbeitungen möglich sind."
* basedOn only Reference(GEM_PR_ERP_MEDREQ_MedicationRequest or $KBV_PR_ERP_Prescription)

* replaces 0..1 MS
* replaces only Reference(GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest)
  * ^short = "Wenn eine Pflegeeinrichtung ihre alte Anfrage stornieren möchte und eine neue Stellt, kann hier das zu stornierende ServiceRequest angegeben werden."
  * ^comment = "Nur vom Requester zu nutzen, um eine alte Anfrage zu stornieren"

* requisition 1..1 MS
* requisition only GEM_ERP_MEDREQ_PR_RequestGroupIdentifier
  * ^short = "Identifier des Vorgangs. Alle ServiceRequests innerhalb eines Vorgangs erhalten die gleiche ID."
  * ^comment = "Ist als Fall oder VorgangsID zu verstehen, um nachverfolgen zu können zu welcher Anfrage der ServiceRequest gehört."

* status MS
//* status obeys sr-1
* status from GEM_VS_MEDREQ_RequestStatus
  * ^short = "Gibt den Bearbeitungsstand eines ServiceRequests an"

* intent = #order (exactly)

* code MS
  * ^short = "Gibt die Art des ServiceRequests an."
  * ^comment = "#prescription-request dient der Anfrage eines Rezeptes an einen Arzt. #pharmacy-delivery-request dient als ServiceRequest für eine Apotheke zur Belieferung"
* code.coding 1..1 MS
* code.coding.system 1..1
* code.coding.system = "https://gematik.de/fhir/erpmedreqcom/CodeSystem/GEM-CS-MEDREQ-ServiceRequest-Code" (exactly)
* code.coding.code 1..1
* code.coding.code = #prescription-request (exactly)

* subject MS
* subject only Reference($KBV_PR_FOR_Patient)

* orderDetail 1..1 MS
* orderDetail.coding 1..1 MS
* orderDetail.coding from GEM_VS_MEDREQ_Prescription_Fullfillment_Type
  * ^short = "Gibt an wie die Rezeptanfrage erfüllt werden soll."
  * ^comment = "Wenn das Rezept an eine Apotheke geht, muss ein entsprechender ServiceRequest im Bundle enthalten sein."

* occurrence[x] 1..1 MS
* occurrence[x] only dateTime
  * ^short = "Gibt das Datum an, an dem das Rezept ausgestellt werden soll"

* authoredOn 1..1 MS
  * ^short = "Datum der Erstellung des Anfrage"
  * ^comment = "Wird initial angelegt und dann nicht mehr verändert."


* requester 1..1 MS
* requester only Reference(GEM_PR_MEDREQ_Organization)

* performer MS
* performer only Reference($KBV_PR_FOR_Practitioner)

// TODO: Wenn reasonCode dann auch .note
* reasonCode from GEM_VS_MEDREQ_MedicationRequest_Reason

* reasonReference only Reference(GEM_PR_ERP_MEDREQ_RemainingMedication)

* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Unterstützende Informationen zur Rezeptanforderung"
* supportingInfo contains
AuslieferndeApotheke 0..1 MS
* supportingInfo[AuslieferndeApotheke] only Reference(GEM_PR_MEDREQ_Organization)
* supportingInfo[AuslieferndeApotheke].type = "Organization"

* note MS
  * ^short = "Weitere Angaben zur Rezeptanforderung"
  * ^comment = "Eventuell nicht spezifizierte Anwendungsfälle können hier im Freitext platziert werden"

Invariant: sr-1
Description: "Wenn der Status auf 'completed' gesetzt ist, muss ein Token vorhanden sein"
Expression: "(status = 'completed') implies exist(extension.where(system='https://gematik.de/fhir/erp/NamingSystem/GEM_NS_EPrescriptionToken'))"
Severity: #error

