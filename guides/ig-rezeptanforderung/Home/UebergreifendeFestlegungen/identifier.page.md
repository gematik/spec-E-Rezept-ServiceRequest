# {{page-title}}

## Request Identifier

### Motivation

Dieser Identifier wird in `ServiceRequest.identifier[requestId]` verwendet, um einen einzelnen ServiceRequest zu identifizieren.

Dieses Vorgehen soll Systeme dabei unterstützen Informationen zu Vorgängen korrekt zu referenzieren.

### Profil

{{tree:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-identifier, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```

from StructureDefinition
where name = 'ERPServiceRequestRequestIdentifier'
for differential.element
    select id, short, comment

```

## Vorgangs Identifier

### Motivation

Dieser Identifier bildet eine Vorgangs-ID ab und wird unter `ServiceRequest.requisition` angegeben. Innerhalb eines Vorgangs können verschiedene Medikamente angefragt werden für die jeweils ein ServiceRequest erstellt wird. Diese Vorgangs-ID verknüpft nun alle ServiceRequests, die diesem Vorgang zugeordnet sind.

Diese Vorgangs-ID wird vom schreibenden System vergeben und ist von den anderen Sytemen, die den ServiceRequest bearbeiten nicht zu verändern!

Falls ein anderes System als das ursprünglich anfragende einen neuen ServiceRequest erstellt, ist die Vorgangs-ID von vorhandenen ServiceRequests zu übernehmen.

### Profil

{{tree:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/identifier-procedure-identifier, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```

from StructureDefinition
where name = 'ERPServiceRequestProcedureIdentifier'
for differential.element
    where exists(comment | short)
    select id, short, comment

```

## Festlegungen zu Identifiern

Generell sind die Identifier in den Profilen offen spezifiziert. Daher können beliebige Identifier vergeben werden.
WICHTIG: Wenn ein Objekt (z.B. ein ServiceRequest) bearbeitet, modifiziert und dann weitergeleitet wird sind alle Identifier, die unter `ServiceRequest.identifier` vergeben wurden zu kopieren und weiterzureichen.

### Anwendungsfall Parenterale Zubereitung

Im Anwendungsfall {{pagelink:Home/Anwendungsfaelle/2_Parenterale-Zubereitung}} sind folgende Identifier zu verwenden:

|Fachliche Beschreibung|.identifier.system|
|---|---|
|Patienten-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/erp-servicerequest/sid/patient-id"|
|Fall-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/erp-servicerequest/sid/case-id"|
|Vorgangs-ID für die Verwendung in einer Taxierungssoftware, abweichend von .requisition|"https://gematik.de/fhir/erp-servicerequest/sid/process-id"|
