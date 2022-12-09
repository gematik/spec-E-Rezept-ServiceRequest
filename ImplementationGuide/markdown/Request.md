# Inhalt

- [Inhalt](#inhalt)
  - [Übermittlung der Rezeptanforderung](#Übermittlung-der-Rezeptanforderung)
    - [Senden eines Request Bundles](#Senden-eines-Request-Bundles)
      - [Header](#Header)
      - [MedicationRequest](#MedicationRequest)
      - [Patient](Patient)
      - [RequestingOrganization](#RequestingOrganization)
      - [DispensingOrganization](#DispensingOrganization)

# Übermittlung der Rezeptanforderung

Der Ablauf einer Rezeptanforderung und deren folgende Bearbeitung wird nach der initial auslösenden Institution klassifiziert. Es wird unterschieden nach:

1. Rezeptmanagement obliegt der _Pflegeeinrichtung_, sie initiiert die Rezeptanforderungen
2. Rezeptmanagement obliegt (Rahmenvertrags-)_Apotheke_, sie initiiert die Rezeptanforderungen

Der zweite Fall, das die initiale Rezeptanforderung von der Apotheke ausgelöst wird, kann als Spezialfall des ersten Falls gesehen werden und wird technisch aus so umgesetzt.

## Senden eines Request Bundles

Die Übermittlung einer Rezeptanforderung wird in Form eines  _[Request Bundles](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_requestbundle)_  an einen Verordnenden Leistungserbringer übertragen.
{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-request-bundle}}
Jedes Bundle erhält einen eindeutigen `identifier`  vom Type RFC3986, zur weiteren Identifikation. Dieser kann z.B. im Falle einer Stornierung der Anforderung verwendet werden, um das gewünschte Bundle zu identifizieren Details angegeben werden
Das Request Bundle verfügt über folgende mögliche Einträge.

### Header

Jedes Bundle muss über einen [RequestHeader](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_messageheader) verfügen, in welchem neben de Klassifizierung der Nachricht unter dem `event`-Attribut, verpflichtende Angaben zu der versendenden Organisation festgehalten im `sender` werden.
{{tree:<https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-message-header>}}
Das setzen einer eindeutigen `VorgangsID` im Header ist verpflichtend. Die nachfolgenden Nachrichten können über die jeweils enthaltene Vorgangs-ID durch die verarbeitenden System in Verbindung gebracht werden.
Ebenfalls muss eine eindeutige `PatientID` gesetzt werden. Sie dient dem "anfragendem" System, als eindeutiges Zuordnungsmerkmal des Patienten.

### MedicationRequest

Die hauptsächliche Information muss sich der Übermittlung des [GEM PR ERP MEDREQ Medication Request](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_medicationrequest)  befinden.
{{tree:<https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-medication-request>}}
Dieser bietet im Vergleich zur eigentlichen Verordnung welche im folgenden durch den Leistungserbringer in Form einer [KBV_PR_ERP_Prescription](https://simplifier.net/erezept/kbvprerpprescription) weitreichende obligatorische Felder, welche zur Zeit der Erstellung der Rezeptanforderung noch nicht bekannt sein müssen, ist aber inhaltlich darauf ausgelegt einfach in eine `KBV_PR_ERP_Prescription` durch Ergänzung umgewandelt werden zu können.
Verpflichtend ist die Angabe des `PrescriptionDeliveryType`, des  Zustelltyps, dieser definiert den Weitereichung der durch der `KBV_PR_ERP_Prescription` durch den Verordnenden Leistungserbringer.
Erwähnenswerte optionale Angaben sind die Möglichkeit

- nur die `PriorPrescriptionID` einer vorausgegangene Verordnung angeben zu können.
- eine vorausgegangene Verordnung (z.B. vom Typ [KBV_PR_ERP_Prescription](https://simplifier.net/erezept/kbvprerpprescription)) unter `priorPrescription` angeben zu können
- Auskunft über die Restreichweite der aktuellen Medikation mit Hilfe der Attribute `RemainingQuantity` und `RemainingRangeDate` geben zu können
- zusätzliche Informationen in Form eines Freitext-Feldes an den Verordnenden übermitteln zu können.

### Patient

Der im `MedicationRequest` verpflichtend anzugebene Patient vom Typ [KBV_PR_FOR_Patient](https://simplifier.net/packages/kbv.ita.for/1.1.0/files/720094) muss im Bundle mit angegeben werden und wird vom PVS des Verordnenden Leistungserbringer in die Verordnung übernommen.

### RequestingOrganization

Die anfordernde Organisation beispielsweise eine Pflegeeinrichtung muss im `Request Bundle`vom Typ
[GEM PR ERP MEDREQ Organization](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_organization) hinterlegt werden.
{{tree:<https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-organization>}}
Die Angabe der 'Telematik-ID' ist optional. Die Angabe einer Adresse und einer 'KIM-Adresse' ist verpflichtend. Die verordnende Leistungserbringerinstitution nutzt die KIM-Adresse, um Folgenachrichten, bspw. mit den Informationen zum ausgestellten E-Rezept oder eine Ablehnung, an die 'RequestingOrganization' zu senden.
Der Typ der Organisation wird in Form der im [RequestingOrganizationTypeVS](https://simplifier.net/erezept-medicationrequest-communication/requestingorganizationtypevs) hinterlegten CodeSystems festgehalten.

### DispensingOrganization

Der Abgebende Leistungserbringer kann optional im Bundle angegeben werden. Für den Fall das im `Zustelltyp` des `MedicationRequest` die Wahl auf `DispensingOrganisation` **"Belieferung der anfragenden Organisation durch Apotheke"** ist die `DispensingOrganization` zwingend anzugeben um sicherzustellen, das das PVS die Verordnung an die Apotheke weiterleiten kann.
Je nachdem ob das Rezeptmanagement der Pflegeeinrichtung oder der Apotheke obliegt, wird diese durch die `DispensingOrganization` Pflegeeinrichtung oder durch die Apotheke selber befüllt.
