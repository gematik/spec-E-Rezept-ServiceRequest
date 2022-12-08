# Inhalt

- [Inhalt](#inhalt)
  - [Übermittlung der Verschreibung](#Übermittlung-der-Verschreibung)
    - [Senden eines Response Bundles](#Senden-eines-Response-Bundles)
      - [ResponseHeader](#ResponseHeader)
      - [Prescription](#Prescription)
      - [Patient](Patient)
      - [RequestingOrganization](#RequestingOrganization)
      - [DispensingOrganization](#DispensingOrganization)

# Übermittlung der Verschreibung

Nachdem der Verschreibende eine `RequestBundle` erhalten hat, kann er die dem MedicationRequest enthalten Informationen verwenden, den weiteren Ablauf des Verordnung zu steuern. Durch Auswertung des  [_Zustelltyps_](https://simplifier.net/erezept-medicationrequest-communication/prescriptiondeliverytypecs) wird das `ResponseBundle` entweder
- an einen  _DispensingOrganization_  (Apotheke) oder
- an die im Request Bundle hinterlegte  _RequestingOrganisation_  (Pflegeeinrichtung) oder
- an eine autorisierte  _Person_  welche beim Arzt vorstellig wird (Selbstabholer)

weitergereicht.

## Senden eines Response Bundles

### ResponseHeader

Der ResponseHeader vom Typ [GEM PR ERP MEDREQ Response Header](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_responseheader)
{{tree:<https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-response-header>}} enthält neben einer verpflichtende Angabe zu der versendenden Organisation im `sender` vor, das die `PrescriptionID` und der `AccessCode` als Extension übergeben werden.
Dies soll eine Einlösung der Verschreibung gegenüber dem E-Rezept-Fachdienst ermöglichen.

### Prescription

Die Notwendigen Informationen um den [GEM PR ERP MEDREQ Medication Request](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_medicationrequest)  in eine [KBV_PR_ERP_Prescription](https://simplifier.net/erezept/kbvprerpprescription) zu überführen werden durch das PVS und den Verschreibenden ergänzt.

### Patient

Der _Patient_ muss vom aus dem `RequestBundle` übernommen werden.

### RequestingOrganization

Die _anfragende Organisation_ muss aus dem `RequestBundle` übernommen werden.

### DispensingOrganization

Falls vorhanden, muss die _abgebende Organisation_ aus dem `RequestBundle` übernommen werden.
