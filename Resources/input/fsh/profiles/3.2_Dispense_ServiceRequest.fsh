Profile: GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
Parent: ServiceRequest
Id: GEM-PR-ERP-MEDREQ-Dispense-ServiceRequest
Title: "GEM PR ERP MEDREQ Dispense Service Request"
Description: "ServiceRequest that is used to initiate a dispense request for a pharmacy"
* insert Meta (GEM-PR-ERP-MEDREQ-Dispense-ServiceRequest)

* extension contains
    GEM_EX_MEDREQ_EPrescriptionToken named EPrescriptionToken 0..1 MS

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
* basedOn only Reference($KBV_PR_ERP_Prescription) //referenzierte Objekte im Bundle einfügen

* requisition 1..1 MS
* requisition only GEM_ERP_MEDREQ_PR_RequestGroupIdentifier
  * ^short = "Identifier des Vorgangs. Alle ServiceRequests innerhalb eines Vorgangs erhalten die gleiche ID."
  * ^comment = "Ist als Fall oder VorgangsID zu verstehen, um nachverfolgen zu können zu welcher Anfrage der ServiceRequest gehört."

* status MS
* status from GEM_VS_MEDREQ_RequestStatus
  * ^short = "Gibt den Bearbeitungsstand eines ServiceRequests an"

* intent = #filler-order (exactly)

* code 1..1 MS
* code from GEM_VS_MEDREQ_Service_Request_Code
  * ^short = "Gibt die Art des ServiceRequests an."
  * ^comment = "#prescription-request dient der Anfrage eines Rezeptes an einen Arzt. #pharmacy-delivery-request dient als ServiceRequest für eine Apotheke zur Belieferung"

* subject MS
* subject only Reference($KBV_PR_FOR_Patient)

* occurrence[x] 1..1 MS
* occurrence[x] only dateTime
  * ^short = "Gibt das Datum an, an dem das Medikament ausgeliefert werden soll"

* authoredOn 1..1 MS
  * ^short = "Datum der Erstellung des Anfrage"
  * ^comment = "Wird initial angelegt und dann nicht mehr verändert."

* requester 1..1 MS
* requester only Reference(GEM_PR_MEDREQ_Organization)

* performer only Reference(GEM_PR_MEDREQ_Organization)

* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Unterstützende Informationen zur Rezeptanforderung"
* supportingInfo contains AusstellenderArzt 1..1 MS and AbgabeDaten 0..1 MS
* supportingInfo[AusstellenderArzt] only Reference($KBV_PR_FOR_Practitioner)
* supportingInfo[AusstellenderArzt].type = "Practitioner" (exactly)
// TODO: wenn status = erfüllt dann Abgabedaten vorhanden
* supportingInfo[AbgabeDaten] only Reference($GEM_ERP_PR_MedicationDispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)

* note MS
  * ^short = "Weitere Angaben zur Rezeptanforderung"
  * ^comment = "Eventuell nicht spezifizierte Anwendungsfälle können hier im Freitext platziert werden"

Instance: Initial-Dispense-Request
InstanceOf: GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
Usage: #inline
Title: "Initial Dispense Request"
Description: "This ServiceRequest is sent initially to the dispensing pharmacy"
* extension[EPrescriptionToken].valueIdentifier.system = "https://gematik.de/fhir/erp/sid/GEM_NS_EPrescriptionToken"
* extension[EPrescriptionToken].valueIdentifier.value = "Task/160.100.000.000.002.36/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* identifier[0]
  * system = "https://gematik.de/GEM_NS_MEDREQ_RequestId"
  * value = "012345"
* basedOn = Reference(Example-Response-KBV-Prescription)
* requisition[0].system = "https://gematik.de/GEM_NS_MEDREQ_RequestGroupId"
* requisition[=].value = "GroupID-2"
* status = #active
* intent = #filler-order
* code = #dispense-request
* subject = Reference(Example-Patient)
* occurrenceDateTime = "2023-02-01"
* authoredOn = "2023-02-01"
* requester = Reference(Example-HealthCareService-Organization)
* performer.identifier = Test-Apotheke-Identifier
* supportingInfo[AusstellenderArzt] = Reference(Example-Practitioner)
* supportingInfo[AusstellenderArzt].type = "Practitioner"

//TODO Example for Dispense Fullfillment