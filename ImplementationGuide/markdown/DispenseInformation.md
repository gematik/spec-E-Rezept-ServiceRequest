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

Nachdem die Apotheke die Abgabe vollzogen hat, übermittelt sie eine Nachricht vom Typ GEM PR ERP MEDREQ Dispense Information Bundle](<https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_dispenseinformationbundle>). Dabei werden die Attribute weitestgehend aus dem _Response Bundle_ übernommen und um die zusätzliche Information der [GEM_ERP_PR_MedicationDispense](https://simplifier.net/packages/de.gematik.erezept-workflow.r4/1.2.0/files/721016) erweitert, welche sich

## Senden eines Dispense Information Bundles

Die Übermittlung einer Diepensierinformationen wird in Form eines [GEM PR ERP MEDREQ Dispense Information Bundle](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_dispenseinformationbundle)
{{tree:<https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-dispense-information-bundle>}}

### MessageHeader

Jedes Bundle muss über einen [MessageHeader](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_messageheader) verfügen, in welchem neben de Klassifizierung der Nachricht unter dem `event`-Attribut.
Neben der verpflichtenden Angabe der `VorgangsID`, welche aus dem Header des `ResponseBundle` übernommen werden muss, ist auch eine verpflichtende Angabe zu der versendenden Organisation im `sender` notwendig.
Die Angaben zur `PatientID` sind aus dem `Header` des `ResponseBundle` zu übernehmen.
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
