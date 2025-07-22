## Identifier Profile

Folgende Identifier wurden in diesem Projekt definiert:
{% sql select Title, Description from Resources where id LIKE '%-identifier%' %}

Darüber hinaus gibt es in ServiceRequest.identifier durch die offene Profilierung die Möglichkeit weitere Identifier einem Request anzuhängen. Diese können z.B. aus regionalen Kooperationen entstehen oder aus fachlichen Gründen definiert worden sein.

WICHTIG: Wenn ein Objekt (z.B. ein ServiceRequest) bearbeitet, modifiziert und dann weitergeleitet wird MÜSSEN alle Identifier, die unter `ServiceRequest.identifier` angegeben wurden verarbeitet und in einer Antwort angehangen werden.

### Anwendungsfall Rezeptanforderung für anwendungsfertige Zytostatikazubereitungen

In Abstimmung mit den Industriepartnern wurden für den Anwendungsfall [Rezeptanforderung für anwendungsfertige Zytostatika Zubereitungen](./usecase-4-zyto.html) folgende Identifier definiert:

|Fachliche Beschreibung|.identifier.system|
|---|---|
|Patienten-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/erp-servicerequest/sid/patient-id"|
|Fall-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/erp-servicerequest/sid/case-id"|
|Vorgangs-ID für die Verwendung in einer Taxierungssoftware, abweichend von .requisition|"https://gematik.de/fhir/erp-servicerequest/sid/process-id"|
