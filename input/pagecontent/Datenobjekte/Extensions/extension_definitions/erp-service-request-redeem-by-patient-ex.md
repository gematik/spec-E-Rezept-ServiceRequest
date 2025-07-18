---
canonical: https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex
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

Diese Extension enthält einen Wahrheitswert darüber, ob die Verordnung vom Patienten selbst einzulösen ist. Dies hat Auswirkungen auf den Flowtype der Verordnung und darüber, ob ein E-Rezept Token an den Anfragenden zurückgegeben wird.

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