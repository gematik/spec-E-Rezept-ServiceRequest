---
canonical: https://gematik.de/fhir/erp-servicerequest/StructureDefinition/request-mvo-ex
expand: 2
---

# {{page-title}}

## Übersicht Über die Extension

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
    IsModifier: differential.element[0].isModifier
</fql>

## Über die Extension

### Motivation

Diese Extension enthält einen Wahrheitswert darüber, ob der Anfragende die Ausstellung einer Mehrfachverordnung (MVO) wünscht. Das empfangende System sollte den Nutzer entsprechend darauf hinweisen und ggf. die Verordnung vorbereiten.

## Inhalt der Extension

Folgende Ansichten existieren die Extension:

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