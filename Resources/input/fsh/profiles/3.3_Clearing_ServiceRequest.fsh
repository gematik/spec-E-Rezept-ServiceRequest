Profile: ServiceRequestClearingRequest
Parent: ServiceRequest
Id: service-request-clearing-request
Title: "Anfrage zum Ausstellen einer Verordnung"
Description: "ServiceRequest, der genutzt wird um ein Rezept anzufragen"
* insert Meta (service-request-clearing-request)

* extension MS
* extension contains
    EPrescriptionTokenEX named EPrescriptionToken 0..1 MS
* extension[EPrescriptionTokenEX]
  * ^short = "Für den Fall, dass die Klärung zu einer neuen Verordnung führt, kann das neue E-Rezept-Token hier angegeben werden."
  * ^comment = "Der Token hat die Form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. Siehe [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier 1..* MS
  * ^short = "Definiert Identifier, die in diesem Profil genutzt werden sollen."
* identifier contains requestId 1..1
* identifier[requestId] only IdentifierRequestIdentifier
  * ^short = "Identifier, der eineindeutig einen ServiceRequest referenziert."
  * ^comment = "Kann beispielsweise über eine UUID abgebildet werden."

* basedOn 1..1 MS
  * ^short = "Verordnung über die eine Klärung hergestellt werden soll"
  * ^comment = "Einem ServiceRequest ist genau eine Verordnung zugeordnet, sodass unabhängige Bearbeitungen möglich sind."
* basedOn only Reference($KBV_PR_ERP_Prescription)

* requisition 0..1 MS
* requisition only IdentifierProcedureIdentifier
  * ^short = "Identifier des Vorgangs. Alle ServiceRequests innerhalb eines Vorgangs erhalten die gleiche ID."
  * ^definition = "Zu einem Klärfall können mehrere Medikamente gehören, wenn es z.B. um Wechselwirkungen geht. Daher kann dieses Feld genutzt werden, um mehere Clearing_ServiceRequests zu bündeln."

* status MS
* status from ServiceRequestStatusVS
  * ^short = "Gibt den Bearbeitungsstand eines ServiceRequests an."
  * ^comment = "Bei Statusänderung wird dieser Wert überschrieben."

* intent = #proposal (exactly)

* code MS
  * ^short = "Gibt die Art des ServiceRequests an."
* code.coding 1..1 MS
* code.coding from ServiceRequestTypeVS
* code.coding.system 1..1
* code.coding.code 1..1
* code.coding.code = #clearing-request (exactly)
  * ^comment = "#clearing-request definiert diesen ServiceRequest als Klärfall eines Rezeptes an einen Arzt."

* subject MS
* subject only Reference($KBV_PR_FOR_Patient)
  * ^short = "Patient den das zu klärende Rezept betrifft."

* authoredOn 1..1 MS
  * ^short = "Erstellungsdatum der Anfrage."
  * ^comment = "Wird initial angelegt und dann nicht mehr verändert."

* requester 1..1 MS
* requester only Reference(OrganizationWithKIMAdress or $KBV_PR_FOR_Practitioner)
  * ^short = "Anfragende Apotheke oder Practitioner."
  * ^comment = "Die KIM-Adresse ist bereits im MessageHeader hinterlegt. Daher ist die präferierte Angabe einen KBV_PR_FOR_Practitioner zu hinterlegen."

* performer MS
* performer only Reference($KBV_PR_FOR_Practitioner)
  * ^short = "Arzt, der das Rezept ausgestellt hat und zur Klärung konsultiert werden soll."

* reasonCode 1..1 MS
* reasonCode from ClearingReasonVS
  * ^short = "Code, der angibt, warum eine Klärung angefragt wird."

* note 1..* MS
* note only AnnotationClearing
  * ^short = "Angaben zum Klärfall"
  * ^comment = "Eventuell nicht spezifizierte Anwendungsfälle können hier im Freitext platziert werden."