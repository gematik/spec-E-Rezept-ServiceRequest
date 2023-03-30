Profile: ServiceRequestDispenseRequest
Parent: ServiceRequest
Id: service-request-dispense-request
Title: "Anfrage zum Beliefern einer Verordnung"
Description: "ServiceRequest, der genutzt wird um ein Rezept zu beliefern"
* insert Meta (service-request-dispense-request)

* extension MS
  * ^comment = "Hier kann der E-Rezept Token für die Belieferung der Apotheke bereit gestellt werden"
* extension contains
    EPrescriptionTokenEX named EPrescriptionToken 0..1 MS and //muss 0..1 sein für den Fall, dass die Pflegeeinrichtung den DispenseRequest an den Arzt schickt, der es dann zur Apotheke weiterleitet
    SecretEx named Secret 0..1 MS

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Definiert Identifier, die in einem Vorgang genutzt werden sollen"

* identifier 1..* MS
* identifier contains requestId 1..1 and predisId 0..1
* identifier[requestId] only IdentifierRequestIdentifier
* identifier[predisId] only IdentifierPreDisIdentifier

* basedOn 0..1 MS
  * ^short = "KBV Prescription, die von der Apotheke beliefert werden soll"
  * ^comment = "Einem ServiceRequest ist genau ein MedicationRequest zugeordnet, sodass unabhängige Bearbeitungen möglich sind."
* basedOn only Reference($KBV_PR_ERP_Prescription)

* requisition 1..1 MS
* requisition only IdentifierProcedureIdentifier
  * ^short = "Identifier des Vorgangs. Alle ServiceRequests innerhalb eines Vorgangs erhalten die gleiche ID."
  * ^comment = "Ist als Fall- oder Vorgangs-ID zu verstehen, um nachverfolgen zu können zu welcher Anfrage der ServiceRequest gehört."

* status MS
* status from ServiceRequestStatusVS
  * ^short = "Gibt den Bearbeitungsstand eines ServiceRequests an"

* intent = #filler-order (exactly)

* code MS
  * ^short = "Gibt die Art des ServiceRequests an."
  * ^comment = "#dispense-request dient als ServiceRequest für eine Apotheke zur Belieferung eines Rezeptes"
* code.coding 1..1 MS
* code.coding from ServiceRequestTypeVS
* code.coding.system 1..1
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
* requester only Reference(OrganizationWithKIMAdress or $KBV_PR_FOR_Practitioner)
  * ^short = "Anfragende Einrichtung oder Arzt"

* performer MS
* performer only Reference(OrganizationWithKIMAdress)
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
