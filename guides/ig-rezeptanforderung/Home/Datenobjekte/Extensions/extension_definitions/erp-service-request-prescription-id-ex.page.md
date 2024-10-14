---
canonical: https://gematik.de/fhir/erp-servicerequest/StructureDefinition/prescription-id-ex
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

Diese Extension enthält eine Rezept-ID eines E-Rezeptes. Diese hat die Form `aaa.bbb.bbb.bbb.bbb.cc`, wobei aaa der Flowtype des E-Rezeptes, `cc` die Prüfnummer und `bbb.bbb.bbb.bbb` die fortlaufende Rezeptnummer abbildet (siehe [gemSpec_DM_eRp](https://gemspec.gematik.de/docs/gemSpec/gemSpec_DM_eRp/gemSpec_DM_eRp_V1.10.0/#A_19217-01)).

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