## {{page-title}}

Diese Seite zeigt das Mapping der fachlichen Informationen aus dem {{pagelink:Home/Datenobjekte/Logical-Models/gem-erp-sr-log-prescription-request.page.md}}: {{tree:GEM_ERP_SR_LOG_PrescriptionRequest}}

### MetaDaten zur Nachricht
Im folgenden werden die Mappings der Metainformationen einer Rezeptanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request.MetaDaten')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request.', '').replace('MetaDaten.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Fachliches-Mapping').map
```

### Involvierte Parteien
Im folgenden werden die Mappings der involvierten Parteien einer Rezeptanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request.involviertePartei')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request.', '').replace('involviertePartei.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Fachliches-Mapping').map
```

### Angaben zur Medikation
Im folgenden werden die Mappings der Medikationsinformationen einer Rezeptanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request.Medikation.')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request.Medikation.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Fachliches-Mapping').map
```

### Weitere Informationen
Im folgenden werden die Mappings weiterer Informationen einer Rezeptanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request.Medikation.').not() and id.startsWith('gem-erp-sr-log-prescription-request.involvierteParteien.').not() and id.startsWith('gem-erp-sr-log-prescription-request.MetaDaten.').not()
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Fachliches-Mapping').map
```