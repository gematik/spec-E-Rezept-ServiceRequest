---
canonical: https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-dispense-prescription-request
expand: 2
---

# {{page-title}}

## Übersicht über das Profil

<fql output="table">
	from
		StructureDefinition
	where
		url = %canonical
	select
		Name: name,
		Description: description,
		Canonical_URL: url,
		Status: status,
		Version: version,
    'Basiert auf': baseDefinition
</fql>

## Über das Profil

### Motivation

Als zentrales Element in einer Anfrage gelten in dieser Spezifikation ServiceRequests. Diese Bündeln die Informationen für eine konkrete Anfrage an einen anderen Leistungserbringer. Folgende Begriffe werden in diesem IG für diesen ServiceRequests genutzt:

* ServiceRequest meint den Request als Basisprofil von HL7
* ERPServiceRequestDispenseRequest meint konkret dieses Profil in diesem Projekt
* Dispensieranfrage ist der fachliche Begriff für dieses Profil

Der ERPServiceRequestDispenseRequest ist eine Anfrage zur Belieferung eines Präparates an eine ausliefernde Apotheke. Alle für die Apotheke relevanten Informationen sind in diesem ServiceRequest vorzuhalten, bzw. zu referenzieren.

Dieses Profil wird auch genutzt, um eine Pflegeeinrichtung über die Dispensierung einer Verordnung zu informieren.

Die Identifikation als ERPServiceRequestDispenseRequest (Belieferungsanfrage) wird über .code.coding.code = #dispense-request angegeben.

## Inhalt des Profils

Folgende Ansichten existieren auf das Profil:

<tabs>
<tab title="Overview">
	{{tree, buttons}}
</tab>
<tab title="Detailed view">
	{{dict}}
</tab>
<tab title="XML">
	{{xml}}
</tab>
<tab title="JSON">	
	{{json}}
</tab>
<tab title="Link">
	{{link}}
</tab>
</tabs>

## Terminologie Bindings

Folgende Bindings sind für diese Ressource spezifiziert:

<fql>
	from
    	StructureDefinition
	where
    	url = %canonical
	select
    	join for differential.element
      		select {
				Path: id,
				join
				for binding
				where valueSet.exists()
				select {
					Conformance: strength,
					ValueSet: valueSet}
        	}
</fql>

## Constraints

Folgende Constraints sind für diese Ressource spezifiziert:

<fql>
    from
		StructureDefinition
    where
		url = %canonical
    for differential.element where constraint.exists()
    select
    Pfad: id,
    join for constraint
        select {
				Id: key,
				Grade: severity,
				Details: human,
				Expression: expression
				}
</fql>