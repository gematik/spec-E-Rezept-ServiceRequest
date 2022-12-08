# Inhalt

- [Inhalt](#inhalt)
  - [Einführung](#Einführung)
  - [Ablauf](#Ablauf)

# Einführung

Mit dem Konzept  _**Rezeptanforderung**_  soll eine Möglichkeit aufgezeigt werden, wie Nachrichten im Kontext des E-Rezepts dezentral zwischen den Beteiligten versendet und empfangen werden. Die Nachrichten werden dabei stark strukturiert und in FHIR-Bundles aufbereitet. Als sicheres Verfahren zur Übermittlung ist die TI-Anwendung Kommunikation im Medizinwesen (KIM) vorgesehen. Grundsätzlich sind auch andere Verfahren, bspw. zukünftig der TI-Messenger, denkbar.

Im Prozess der Rezeptanforderung wird in einer initialen Nachricht eines Rezeptanforderungs-Bundle sowie allen nachfolgenden Nachrichten genau ein E-Rezept adressiert. Die Nachrichten können über die jeweils enthaltene Vorgangs-ID durch die verarbeitenden System in Verbindung gebracht werden.

# Ablauf

Der Ablauf einer Rezeptanforderung wird nach der initial auslösenden Institution klassifiziert. Es wird unterschieden nach:

1. Rezeptanforderung wurde von _Pflegeeinrichtung_ initiiert
2. Rezeptmanagement obliegt (Rahmenvertrags-)_Apotheke_, sie initiiert die Rezeptanforderungen

Der zweite Fall, das die initiale Rezeptanforderung von der Apotheke ausgelöst wird, kann als Spezialfall des ersten Falls gesehen werden und wird technisch aus so umgesetzt.

Der eigentliche Ablauf einer Rezeptanforderung und deren Bearbeitung wird durch folgende Nachrichten-Bundles abgebildet und strukturiert:

1. Übermittlung einer Rezeptanforderung in Form eines  _[Request Bundles](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_requestbundle)_  an einen Verordnenden Leistungserbringer
2. (mögliche) Stornierung der initialen Rezeptanforderung durch den initialen Versender in Form eines  _[Cancellation Bundles](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_cancellationbundle)_
3. Übermittlung einer Verschreibung durch den Verordnenden Leistungserbringer erfolgt in Form eines  [_Response Bundles_](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_responsebundle)  durch Auswertung des  [_Zustelltyps_](https://simplifier.net/erezept-medicationrequest-communication/prescriptiondeliverytypecs)  des RequestBundles entweder
    - an einen  _DispensingOrganization_  (Apotheke) oder
    - an die im Request Bundle hinterlegte  _RequestingOrganisation_  (Pflegeeinrichtung) oder
    - an eine autorisierte  _Person_  welche beim Arzt vorstellig wird (Selbstabholer)
4. (mögliche) Stornierung der initialen Rezeptanforderung durch den Verordnenden Leistungserbringer als Alternative zu Punkt 3. in Form eines  _[Cancellation Bundles](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_cancellationbundle)_
5. Falls die Verschreibung in Punkt 3 an die  _RequestingOrganisation_  übermittelt wurde, kann Sie nun and die Apotheke in Form des  [_Response Bundles_](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_responsebundle)  weitergereicht werden
6. Die Apotheke kümmert sich um die Belieferung der  _RequestingOrganisation_  und verschickt die Abgabeinformation in Form eines  [_Dispense Information Bundle_](https://simplifier.net/erezept-medicationrequest-communication/gem_pr_erp_medreq_dispenseinformationbundle)  an die  _RequestingOrganisation_.

Jeder dieser Schritte wird noch einmal detaillierter in diesem Implementation-Guide aufgegriffen und erläutert.
