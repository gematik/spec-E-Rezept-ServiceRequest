## Identifier Profile

Die in diesem Projekt profilierten Identifier sind hier einsehbar: {{pagelink:Home/Datenobjekte/Identifier}}.

Darüber hinaus gibt es in ServiceRequest.identifier durch die offene Profilierung die Möglichkeit weitere Identifier einem Request anzuhängen. Diese können z.B. aus regionalen Kooperationen entstehen oder aus fachlichen Gründen definiert worden sein.

WICHTIG: Wenn ein Objekt (z.B. ein ServiceRequest) bearbeitet, modifiziert und dann weitergeleitet wird MÜSSEN alle Identifier, die unter `ServiceRequest.identifier` angegeben wurden verarbeitet und in einer Antwort angehangen werden.

### Anwendungsfall Rezeptanforderung für anwendungsfertige Zytostatikazubereitungen

In Abstimmung mit den Industriepartnern wurden für den Anwendungsfall {{pagelink:Home/Anwendungsfaelle/4_Rezeptanforderung_Zyto}} folgende Identifier definiert:

|Fachliche Beschreibung|.identifier.system|
|---|---|
|Patienten-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/erp-servicerequest/sid/patient-id"|
|Fall-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/erp-servicerequest/sid/case-id"|
|Vorgangs-ID für die Verwendung in einer Taxierungssoftware, abweichend von .requisition|"https://gematik.de/fhir/erp-servicerequest/sid/process-id"|
