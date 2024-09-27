## {{page-title}}

Diese Seite zeigt das Mapping der fachlichen Informationen aus dem {{pagelink:Home/Datenobjekte/Logical-Models/gem-erp-sr-log-dispense-request.page.md}}: {{tree:GEM_ERP_SR_LOG_DispenseRequest}}

### MetaDaten zur Nachricht
Im folgenden werden die Mappings der Metainformationen einer Dispensieranforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_DispenseRequest'
for differential.element where mapping.any(identity = 'Dispensieranforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-dispense-request.MetaDaten')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-dispense-request.', '').replace('MetaDaten.', ''), 'FHIR-Profil': mapping.where(identity = 'Dispensieranforderung-Fachliches-Mapping').map
```

### Involvierte Parteien
Im folgenden werden die Mappings der involvierten Parteien einer Dispensieranforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_DispenseRequest'
for differential.element where mapping.any(identity = 'Dispensieranforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-dispense-request.involviertePartei')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-dispense-request.', '').replace('involviertePartei.', ''), 'FHIR-Profil': mapping.where(identity = 'Dispensieranforderung-Fachliches-Mapping').map
```

### Weitere Informationen
Im folgenden werden die Mappings weiterer Informationen einer Dispensieranforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_DispenseRequest'
for differential.element where mapping.any(identity = 'Dispensieranforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-dispense-request.Medikation.').not() and id.startsWith('gem-erp-sr-log-dispense-request.involvierteParteien.').not() and id.startsWith('gem-erp-sr-log-dispense-request.MetaDaten.').not()
select
	'Fachliche Information': id.replace('gem-erp-sr-log-dispense-request.', ''), 'FHIR-Profil': mapping.where(identity = 'Dispensieranforderung-Fachliches-Mapping').map
```