---
canonical: https://gematik.de/fhir/erp-servicerequest/StructureDefinition/remaining-supply-ex
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

Diese Extension gibt strukturiert darüber Auskunft, wie lange die Reichweite der Medikation noch dauert. Angabe erfolgt mit Wert und Einheit, die per Freitext unter `.unit` angegeben wird. Bsp: 7 Stück.

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