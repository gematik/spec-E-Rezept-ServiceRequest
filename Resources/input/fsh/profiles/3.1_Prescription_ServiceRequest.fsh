Profile: ERPServiceRequestPrescriptionRequest
Parent: ServiceRequest
Id: erp-service-request-prescription-request
Title: "ERP Service Request Prescription Request"
Description: "ServiceRequest, der genutzt wird um ein Rezept anzufragen"
* insert Meta (erp-service-request-prescription-request)
* obeys sr-1 and sr-2

* extension MS
* extension contains
    EPrescriptionTokenEX named EPrescriptionToken 0..1 MS
* extension[EPrescriptionTokenEX]
  * ^short = "Hier kann der E-Rezept Token für die Verarbeitung in einer Apotheke bereit gestellt werden."
  * ^comment = "Der Token hat die Form '/Task/{PrescriptionID}/$accept?ac={AccessCode}. Siehe [gemSpec_DM_eRp](https://fachportal.gematik.de/fachportal-import/files/gemSpec_DM_eRp_V1.5.0.pdf)'."

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier 1..* MS
  * ^short = "Definiert Identifier, die in diesem Profil genutzt werden sollen."
* identifier contains requestId 1..1 and predisId 0..1
* identifier[requestId] only IdentifierRequestIdentifier
  * ^short = "Identifier, der eineindeutig einen ServiceRequest referenziert."
  * ^comment = "Zur Referenzierung und Zuordnung von ServiceRequest, bspw. wenn ein ServiceRequest einen anderen ersetzen soll, ist es wichtig diese Zuordnung mit dem Identifier treffen zu können. Kann beispielsweise über eine UUID abgebildet werden."
* identifier[predisId] only IdentifierPreDisIdentifier
  * ^short = "Identifier, der einen Prescription- und einen Dispenserequest verbindet."
  * ^comment = "Kann beispielsweise über eine UUID abgebildet werden."
  * ^definition = "In einigen Anwendungsfällen werden bedarf es der Information welche Verordnungsanfrage zu welcher Belieferungsanfrage gehört. Wenn bspw. ein Medikament angefragt wird möchte man verfolgen können welche die dazugehörige Belieferungsanfrage ist. Hierzu dient der predisIdentifier, der ein Paar von ServiceRequest**Prescription**Request und ServiceRequest**Dispense**Request zusammengehörig identifiziert.

Das implementierende System muss in der Lage sein diese Verknüpfung herzustellen als auch zu lesen."

* basedOn 1..1 MS
  * ^short = "Angefragter oder erfüllausgestellter MedicationRequest."
  * ^comment = "Einem ServiceRequest ist genau ein MedicationRequest zugeordnet, sodass unabhängige Bearbeitungen möglich sind."
  * ^definition = "Dieses Feld referenziert den zugrundeliegenden MedicationRequest, der die medizinischen Informationen zur Rezeptanfrage enthält. Wenn die Rezeptanfrage gestellt wird KANN das Profil MedicationRequestPrescriptionRequest genutzt werden.
Wenn die Verordnung erstellt wurde ist der entsprechende KBV_PR_ERP_Bundle-Verordnungsdatensatz zu referenzieren."
* basedOn only Reference(MedicationRequestPrescriptionRequest or $KBV_PR_ERP_Prescription)

* requisition 1..1 MS
* requisition only IdentifierProcedureIdentifier
  * ^short = "Identifier des Vorgangs. Alle ServiceRequests innerhalb eines Vorgangs erhalten die gleiche ID."
  * ^comment = "Ist als Fall oder VorgangsID zu verstehen (siehe Mapping), um nachverfolgen zu können zu welcher Anfrage der ServiceRequest gehört."

* status MS
* status obeys sr-1
* status from ServiceRequestStatusVS
  * ^short = "Gibt den Bearbeitungsstand eines ServiceRequests an."
  * ^comment = "Bei Statusänderung wird dieser Wert überschrieben."

* intent = #order (exactly)

* code MS
  * ^short = "Gibt die Art des ServiceRequests an."
* code.coding 1..1 MS
* code.coding from ServiceRequestTypeVS
* code.coding.system 1..1
* code.coding.code 1..1
* code.coding.code = #prescription-request (exactly)
  * ^comment = "#prescription-request definiert diesen ServiceRequest als Verordnungsanfrage eines Rezeptes an einen Arzt."

* subject MS
* subject only Reference($KBV_PR_FOR_Patient)
  * ^short = "Patient für den stellvertretend ein Rezept angefordert wird."

* orderDetail 1..1 MS
* orderDetail.coding 1..1 MS
* orderDetail.coding from PrescriptionFullfillmentTypeVS
  * ^short = "Gibt an wie die Rezeptanfrage erfüllt werden soll."
  * ^comment = "Wenn das Rezept an eine Apotheke geht, muss ein entsprechender ServiceRequest im Bundle enthalten sein."

* occurrence[x] 0..1 MS
* occurrence[x] only dateTime
  * ^short = "Gibt das Datum an, an dem das Rezept ausgestellt werden soll."
  * ^comment = "Kann von vom Anfragenden genutzt werden um die zeitliche Dringlichkeit deutlich zu machen."

* authoredOn 1..1 MS
  * ^short = "Erstellungsdatum der Anfrage."
  * ^comment = "Wird initial angelegt und dann nicht mehr verändert."


* requester 1..1 MS
* requester only Reference(OrganizationWithKIMAdress or $KBV_PR_FOR_Practitioner)
  * ^short = "Anfragende Einrichtung oder Practitioner."
  * ^comment = "Die KIM-Adresse ist bereits im MessageHeader hinterlegt. Daher ist die präferierte Angabe einen KBV_PR_FOR_Practitioner zu hinterlegen."

* performer MS
* performer only Reference($KBV_PR_FOR_Practitioner)
  * ^short = "Arzt, der das Rezept ausstellen soll."

* reasonCode MS
* reasonCode from RequestReasonVS
  * ^short = "Code, der angibt, warum eine Verordnung angefragt wird."
  * ^comment = "Wird auch genutzt, um bei einer Stornierung anzugeben, warum der Vorgang abgebrochen wurde."

* reasonReference only Reference(ObservationRemainingMedication)
  * ^short = "Verweis auf eine Observation Ressource, die angibt, wie lange die akutelle Medikation noch reicht."
  * ^comment = "Wenn eine Referenz zum Grund angegeben wird muss auch ein menschen lesbarer Eintrag in .note hinzugefügt werden, falls Systeme die referenzierte Observation nicht verarbeiten können."

* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Unterstützende Informationen zur Rezeptanforderung"

* supportingInfo MS
* supportingInfo contains
AuslieferndeApotheke 0..1 MS
* supportingInfo[AuslieferndeApotheke] only Reference(OrganizationWithKIMAdress)
* supportingInfo[AuslieferndeApotheke].type = "Organization"

* note MS
  * ^short = "Weitere Angaben zur Rezeptanforderung."
  * ^comment = "Eventuell nicht spezifizierte Anwendungsfälle können hier im Freitext platziert werden."

Invariant: sr-1
Description: "Wenn der Status auf 'completed' gesetzt ist, muss ein Token vorhanden sein"
Expression: "(status = 'completed') implies extension('https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-EX-MEDREQ-EPrescriptionToken').exists()"
Severity: #error

Invariant: sr-2
Description: "Wenn eine .reasonReference angegeben ist, dann muss auch eine .note existieren"
Expression: "reasonReference.exists() implies note.exists()"
Severity: #error