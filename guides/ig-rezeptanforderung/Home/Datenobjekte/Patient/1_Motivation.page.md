## {{page-title}}

Zur Angabe eines Versicherten werden im Rahmen der Rezeptanforderung folgende Informationen übertragen:


<fql output="table">
	from
		StructureDefinition
	where
		name = 'GEM_ERP_SR_LOG_PrescriptionRequest'
    for differential.element where id.startsWith('gem-erp-sr-log-prescription-request.involvierteParteien.PatientenInformationen.')
	select
        Id: id.replace('gem-erp-sr-log-prescription-request.involvierteParteien.PatientenInformationen.', ''),
		Name: short,
        Definition: definition
</fql>