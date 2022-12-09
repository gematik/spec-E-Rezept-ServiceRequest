# Inhalt

- [Inhalt](#inhalt)
  - [Stornierung durch Anfordernden](#Stornierung-durch-Anfordernden)
    - [Senden eines Cancellation Bundles](#Senden-eines-Request-Bundles)
      - [CancellationHeader](#CancellationHeader)

# Stornierung durch Anfordernden

Die Pflegeeinrichtung oder die Apotheke kann die Rezeptanforderung stornieren, solange der Verordnende das E-Rezept noch nicht ausgestellt und weitergeleitet hat.
Eine Bestätigung ob die Stornierung rechtzeitig erfolgte ist zum jetzigen Zeitpunkt nicht vorgesehen, kann aber in Zukunft spezifiziert werden.

## Senden eines Cancellation Bundles

Zum stornieren eines bereits übermittelten `RequestBundles` wird ein [CancellationBundle](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_cancellationbundle) an das PVS übermittelt.
{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-cancellation-bundle}}

### CancellationHeader

Der verpflichtende MessageHeader dieses Bundles vom Typ [GEM PR ERP MEDREQ CancellationHeader](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_cancellationheader) muss den Identifier des `RequestBundles`
in der extension `IdentifierForCancelation` übertragen.
{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-cancellation-header}}
Neben der verpflichtenden Angabe der _Vorgangs-ID_, welche aus dem Header des `RequestBundles` übernommen werden muss, ist auch eine verpflichtende Angabe zu der versendenden Organisation im `sender` notwendig.

Optional kann
- ein Grund für die Stornierung vom Typ [CancellationReasonTypeCS](https://simplifier.net/erezept-medicationrequest-communication/cancellationreasontypecs) angegeben werden.
- ein Freitext mit weiteren Details

angegeben werden.
