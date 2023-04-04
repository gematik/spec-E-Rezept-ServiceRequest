## {{page-title}}

Generell sind die Identifier in den Profilen offen spezifiziert. Daher können beliebige Identifier vergeben werden.
WICHTIG: Wenn ein Objekt (z.B. ein ServiceRequest) bearbeitet, modifiziert und dann weitergeleitet wird sind alle Identifier, die unter `ServiceRequest.identifier` vergeben wurden zu kopieren und weiterzureichen.

### Anwendungsfall Parenterale Zubereitung

Im Anwendungsfall {{pagelink:Home/Anwendungsfaelle/Parenterale-Zubereitung}} sind folgende Identifier zu verwenden:

|Fachliche Beschreibung|.identifier.system|
|---|---|
|Patienten-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/medreq/sid/patient-id"|
|Fall-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/medreq/sid/case-id"|
|Vorgangs-ID für die Verwendung in einer Taxierungssoftware, abweichend von .requisition|"https://gematik.de/fhir/medreq/sid/process-id"|
