# Inhalt

- [Inhalt](#inhalt)
  - [Übermittlung der DispensierInformation](#Übermittlung-der-DispensierInformation)
    - [Senden eines Dispense Information Bundles](#Senden-eines-Dispense-Information-Bundles)
      - [MessageHeader](#MessageHeader)
      - [Prescription](#Prescription)
      - [Patient](Patient)
      - [RequestingOrganization](#RequestingOrganization)
      - [DispensingOrganization](#DispensingOrganization)
      - [DispenseInformation](#DispenseInformation)

# Übermittlung der DispensierInformation

Der Ablauf einer Rezeptanforderung und deren folgende Bearbeitung wird nach der initial auslösenden Institution klassifiziert. Es wird unterschieden nach:

1. Rezeptmanagement obliegt der _Pflegeeinrichtung_, sie initiiert die Rezeptanforderungen
2. Rezeptmanagement obliegt (Rahmenvertrags-)_Apotheke_, sie initiiert die Rezeptanforderungen

Der zweite Fall, das die initiale Rezeptanforderung von der Apotheke ausgelöst wird, kann als Spezialfall des ersten Falls gesehen werden und wird technisch aus so umgesetzt.

## Senden eines Dispense Information Bundles

Die Übermittlung einer Rezeptanforderung wird in Form eines  _[Request Bundles](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_requestbundle)_  an einen Verordnenden Leistungserbringer übertragen.
{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-request-bundle}}
Jedes Bundle erhält einen eindeutigen `identifier`  vom Type RFC3986, zur weiteren Identifikation. Dieser kann z.B. im Falle einer Stornierung der Anforderung verwendet werden, um das gewünschte Bundle zu identifizieren Details angegeben werden
Das Request Bundle verfügt über folgende mögliche Einträge.

### MessageHeader

Jedes Bundle muss über einen [RequestHeader](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_messageheader) beinhalten, in welchem neben de Klassifizierung der Nachricht unter dem `event`-Attribut.
Neben der verpflichtenden Angabe der _Vorgangs-ID_, welche aus dem Header des `RequestBundles` übernommen werden muss, ist auch eine verpflichtende Angabe zu der versendenden Organisation im `sender` notwendig.
{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-message-header}}

### Prescription

Die _Prescription_ muss vom aus dem `ResponseBundle` übernommen werden.

### Patient

Der _Patient_ muss vom aus dem `ResponseBundle` übernommen werden.

### RequestingOrganization

Die _abfragende Organisation_ muss aus dem `ResponseBundle` übernommen werden.

### DispensingOrganization

Der Abgebende Leistungserbringer muss seine Organisation vom Typ [GEM PR ERP MEDREQ Organization](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_organization) im Bundle angeben.
{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-organization}}

### DispenseInformation

Die Abgabe-Informationen sind vom Typ [GEM_ERP_PR_MedicationDispense](https://simplifier.net/packages/de.gematik.erezept-workflow.r4/1.2.0/files/721016) im Bundle anzugeben.
{{tree:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense}}
