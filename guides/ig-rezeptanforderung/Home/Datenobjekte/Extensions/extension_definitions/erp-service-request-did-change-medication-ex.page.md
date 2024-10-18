---
canonical: https://gematik.de/fhir/erp-servicerequest/StructureDefinition/changed-medication-ex
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

Diese Extension enthält einen Wahrheitswert darüber, ob der Verordnende ein anderes Arzneimittel verordnet hat als angefragt wurde.

Sollte der Arzt nach Prüfung der Rezeptanforderung etwas anderes verordnen, als der Anfragende angefragt hat, ist das Feld `valueBoolean` mit `true` zu setzen. So kann das System des Anfragenden den Nutzer explizit darauf hinweisen, dass die Antwort von der Anfrage abweicht. Die Extension kann automatisch vom PVS gesetzt werden, wenn der Verordnende eine Angabe in dem Rezept ändert.

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