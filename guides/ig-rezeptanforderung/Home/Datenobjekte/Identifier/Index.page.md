# {{page-title}}

Folgende Profile sind in diesem Implementation Guide definiert:

<fql output="table">
	from
		StructureDefinition
	where
    type = 'Identifier' and
    kind != 'logical'
	select
		Name: link('https://simplifier.net/guide/erp-servicerequest-implementation-guide/Home/Datenobjekte/Profile?version=current#Home/Datenobjekte/Profile/' + id, name),
		Description: description,
		Canonical_URL: url
</fql>