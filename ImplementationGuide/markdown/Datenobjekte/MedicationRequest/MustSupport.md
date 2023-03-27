## Anmerkungen zu MustSupport Feldern

### `MedicationRequest.extension:PrescriptionIdEx`

Der MedicationRequest kann eine PrescriptionId eines bereits ausgestellten Rezepts enthalten.

Das schreibende System KANN bei Kenntnis einer vorherigen Rezept-Id diese im MedicationRequest angeben.

Das empfangende System MUSS bei vorliegen dieser ID in der Lage sein nach der vorherigen Verordnung zu suchen und dem Nutzer die Möglichkeit geben die Inhalte darzustellen und zu vergleichen.
