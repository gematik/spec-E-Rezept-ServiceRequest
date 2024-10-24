---
canonical: https://gematik.de/fhir/erp-servicerequest/StructureDefinition/alternative-delivery-address-ex
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

Diese Extension enthält eine alternative Lieferadresse nach deutschem Basisprofil. Es wird benötigt, wenn die Belieferung einer Verordnung an eine alternative Lieferadresse versendet werden soll.

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