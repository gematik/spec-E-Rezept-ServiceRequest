## Anmerkungen zu MustSupport Feldern

### `ServiceRequest.extension:EPrescriptionTokenEX`

Das schreibende System MUSS dieses Feld korrekt befüllen können, um den Token für den Empfänger nutzbar zu machen.

Ein empfangendes System MUSS dieses Token lesen, verarbeiten und dem Nutzer darstellen können. Weiterhin MUSS es in der Lage sein das Token für einen folgenden Dispense_ServiceRequest einzubetten, um eine Belieferung anzufragen.