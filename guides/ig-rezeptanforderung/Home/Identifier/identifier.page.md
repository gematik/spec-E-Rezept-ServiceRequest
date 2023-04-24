# {{page-title}}

## Request Identifier

### Motivation

Dieser Identifier wird in `ServiceRequest.identifier[requestId]` verwendet, um einen einzelnen ServiceRequest zu identifizieren.

Dieses Vorgehen soll Systeme dabei unterstützen Informationen zu Vorgängen korrekt zu referenzieren.

### Profil

{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/erp-service-request-request-identifier, diff}}

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

Bspw. erstellt im Anwendungsfall {{pagelink:Home/Anwendungsfaelle/Rezeptanforderung-UC1}}, wenn `ServiceRequest.orderDetail.code = #send-to-pharmacy` gesetzt ist, das PVS die Belieferungsanfrage. Hier ist also die selbe Vorgangs-ID aus `ServiceRequest.requisition` aus der Verordnungsanfrage in die Belieferungsanfrage zu übernehmen.

### Profil

{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/identifier-procedure-identifier, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```

from StructureDefinition
where name = 'ERPServiceRequestProcedureIdentifier'
for differential.element
    where exists(comment | short)
    select id, short, comment

```


## PreDis Identifier

### Motivation

Dieser Identifier wird in `ServiceRequest.identifier[predisId]` verwendet, um eine Verknüpfung einer Verordungs- und Belieferungsanfrage zu der selben Medikation herzustellen.

Insbesondere wenn der Vorgang und die Erstellung der beiden Anfragen zeitversetzt erfolgt ist es für Systeme dann hilfreich diese Verknüpfung herzustellen und den Verlauf der Anfrage zu einem Medikament dann festzustellen.

Beispielsweise erstellt im Anwendungsfall {{pagelink:Home/Anwendungsfaelle/Rezeptanforderung-UC1}} das anfragende System zunächst nur die Verordnungsanfrage.
Nachdem der Verordnende das E-Rezept-Token übermittelt hat wird dann die Belieferungsanfrage zum gleichen Medikament gestellt. Diese erhält die gleiche predisId wie die Verordnungsanfrage. So kann bspw. der Status zur Anfrage eines Medikaments besser verfolgt werden.

### Profil

{{tree:https://gematik.de/fhir/erpmedreqcom/StructureDefinition/erp-service-request-pre-dis-identifier, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```

from StructureDefinition
where name = 'ERPServiceRequestPreDisIdentifier'
for differential.element
    where exists(comment | short)
    select id, short, comment

```
