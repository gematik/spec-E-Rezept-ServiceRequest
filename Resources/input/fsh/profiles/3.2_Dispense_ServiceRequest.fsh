Profile: GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
Parent: ServiceRequest
Id: GEM-PR-ERP-MEDREQ-Dispense-ServiceRequest
Title: "Belieferungsanfrage"
Description: "ServiceRequest, der genutzt wird um ein Rezept zu beliefern"
* insert Meta (GEM-PR-ERP-MEDREQ-Dispense-ServiceRequest)

* extension MS
  * ^comment = "Hier kann der E-Rezept Token für die Belieferung der Apotheke bereit gestellt werden"
* extension contains
    GEM_EX_MEDREQ_EPrescriptionToken named EPrescriptionToken 0..1 MS and //muss 0..1 sein für den Fall, dass die Pflegeeinrichtung den DispenseRequest an den Arzt schickt, der es dann zur Apotheke weiterleitet
    GEM_EX_MEDREQ_Secret named Secret 0..1 MS

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Definiert Identifier, die in einem Vorgang genutzt werden sollen"

* identifier 1..* MS
* identifier contains requestId 1..1 and predisId 0..1
* identifier[requestId] only GEM_ERP_MEDREQ_PR_RequestIdentifier
* identifier[predisId] only GEM_ERP_MEDREQ_PR_PreDisIdentifier

* basedOn 0..1 MS
  * ^short = "KBV Prescription, die von der Apotheke beliefert werden soll"
  * ^comment = "Einem ServiceRequest ist genau ein MedicationRequest zugeordnet, sodass unabhängige Bearbeitungen möglich sind."
* basedOn only Reference($KBV_PR_ERP_Prescription)

* replaces 0..1 MS
* replaces only Reference(ServiceRequestPrescriptionRequest)
  * ^short = "Angabe welcher ServiceRequest ersetzt werden soll"
  * ^comment = "Nur vom Requester zu nutzen, um anzugeben welche Anfrage storniert wurde"

* requisition 1..1 MS
* requisition only GEM_ERP_MEDREQ_PR_RequestGroupIdentifier
  * ^short = "Identifier des Vorgangs. Alle ServiceRequests innerhalb eines Vorgangs erhalten die gleiche ID."
  * ^comment = "Ist als Fall- oder Vorgangs-ID zu verstehen, um nachverfolgen zu können zu welcher Anfrage der ServiceRequest gehört."

* status MS
* status from GEM_VS_MEDREQ_RequestStatus
  * ^short = "Gibt den Bearbeitungsstand eines ServiceRequests an"

* intent = #filler-order (exactly)

* code MS
  * ^short = "Gibt die Art des ServiceRequests an."
  * ^comment = "#dispense-request dient als ServiceRequest für eine Apotheke zur Belieferung eines Rezeptes"
* code.coding 1..1 MS
* code.coding.system 1..1
* code.coding.system = "https://gematik.de/fhir/erpmedreqcom/CodeSystem/GEM-CS-MEDREQ-ServiceRequest-Code" (exactly)
* code.coding.code 1..1
* code.coding.code = #dispense-request (exactly)

* subject MS
* subject only Reference($KBV_PR_FOR_Patient)
  * ^short = "Patient für den stellvertretend ein Rezept beliefert werden soll"

* occurrence[x] 1..1 MS
* occurrence[x] only dateTime
  * ^short = "Gibt das Datum an, an dem das Medikament ausgeliefert werden soll"

* authoredOn 1..1 MS
  * ^short = "Erstellungsdatum der Anfrage"
  * ^comment = "Wird initial angelegt und dann nicht mehr verändert."

* requester 1..1 MS
* requester only Reference(GEM_PR_MEDREQ_Organization or $KBV_PR_FOR_Practitioner)
  * ^short = "Anfragende Einrichtung oder Arzt"

* performer MS
* performer only Reference(GEM_PR_MEDREQ_Organization)
  * ^short = "Apotheke, die das Rezept beliefern soll"

* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Unterstützende Informationen zur Belieferung"

* supportingInfo MS
* supportingInfo contains AusstellenderArzt 1..1 MS and AbgabeDaten 0..1 MS
* supportingInfo[AusstellenderArzt] only Reference($KBV_PR_FOR_Practitioner)
* supportingInfo[AusstellenderArzt].type = "Practitioner" (exactly)
// TODO: wenn status = erfüllt dann Abgabedaten vorhanden
* supportingInfo[AbgabeDaten] only Reference($GEM_ERP_PR_MedicationDispense)
* supportingInfo[AbgabeDaten].type = "MedicationDispense" (exactly)

* note MS
  * ^short = "Weitere Angaben zur Belieferung"
  * ^comment = "Eventuell nicht spezifizierte Anwendungsfälle können hier im Freitext platziert werden"
