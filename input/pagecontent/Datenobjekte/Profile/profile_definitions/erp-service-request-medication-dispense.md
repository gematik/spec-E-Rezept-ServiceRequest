---
canonical: https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-medication-dispense
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

Dieses Profil wird in den Anwendungsfällen genutzt, um die von der Apotheke gelieferten Arzneimittel anzugeben.

Die anzugebende Medication entspricht dabei den [Medication Profilen](https://simplifier.net/erezept/~resources?category=Profile&corebasetype=Medication&sortBy=RankScore_desc) aus dem eRezept Projekt der KBV.

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