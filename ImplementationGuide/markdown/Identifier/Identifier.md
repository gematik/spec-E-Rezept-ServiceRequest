# Identifier

In den folgenden Unterkapiteln werden die Identifer und deren Nutzung in den Profilen erläutert.

## ServiceRequest Identifer

Das Slicing in ServiceRequest.identifier wurde offen gelassen, sodass Systeme diesen mit eigenen Identifern füllen können.

Jedes System, welches einen ServiceRequest bearbeitet MUSS alle in .identifer enthaltenen Identifer unbearbeitet weitergeben und darf ausschließlich Identifier anhängen.

Um die Interoperabilität zu erhöhen werden sich auf folgende Identifier-Systeme geeinigt:

|Anwendungsfall|ServiceRequest.identifier.system|Bedeutung|
|---|---|---|
|Parenterale Zubereitung|https://gematik.de/fhir/erpmedreqcom/sid/fall-id|Gibt den jeweiligen Fall an in dem ein Patient behandelt wird|
|Parenterale Zubereitung|https://gematik.de/fhir/erpmedreqcom/sid/patienten-id|Gibt den in der Taxierungssoftware relevante Patienten ID an|