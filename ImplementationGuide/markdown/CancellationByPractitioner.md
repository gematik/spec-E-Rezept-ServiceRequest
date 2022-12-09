
# Inhalt

- [Inhalt](#inhalt)
  - [Stornierung durch Verordnenden](#Stornierung-durch-Verordnenden)
    - [Senden eines Cancellation Bundles](#Senden-eines-Request-Bundles)
      - [CancellationHeader](#CancellationHeader)

# Stornierung durch Verordnenden

Der Verordnende kann die Rezeptanforderung ablehnen.

## Senden eines Cancellation Bundles

Zum stornieren einer Rezeptanforderung eines `RequestBundles` wird ein [CancellationBundle](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_cancellationbundle) an den ursprünglichen Versender der Anforderung gesendet.
{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-cancellation-bundle}}

### CancellationHeader

Der verpflichtende MessageHeader dieses Bundles vom Typ [GEM PR ERP MEDREQ CancellationHeader](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_cancellationheader) muss den Identifier des `RequestBundles`
in der extension `IdentifierForCancelation` übertragen.
{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/gem-pr-erp-medreq-cancellation-header}}
Neben der verpflichtenden Angabe der _Vorgangs-ID_, welche aus dem Header des `RequestBundles` übernommen werden muss, ist auch eine verpflichtende Angabe zu der versendenden Organisation im `sender` notwendig.
Optional kann

- ein Grund für Ablehnung vom Typ [CancellationReasonTypeCS](https://simplifier.net/erezept-medicationrequest-communication/cancellationreasontypecs) angegeben werden.
- ein Freitext mit weiteren Details

angegeben werden.
