## {{page-title}}

Diese Seite zeigt das Mapping der fachlichen Informationen aus dem Logical Model der Abgabeanforderung: {{tree:GEM_ERP_SR_LOG_DispenseRequest}}

### MetaDaten zur Nachricht
Im folgenden werden die Mappings der Metainformationen einer Abgabeanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_DispenseRequest'
for differential.element where mapping.any(identity = 'Abgabeanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-dispense-request.MetaDaten')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-dispense-request.', '').replace('MetaDaten.', ''), 'FHIR-Profil': mapping.where(identity = 'Abgabeanforderung-Fachliches-Mapping').map
```

### Involvierte Parteien
Im folgenden werden die Mappings der involvierten Parteien einer Abgabeanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_DispenseRequest'
for differential.element where mapping.any(identity = 'Abgabeanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-dispense-request.involviertePartei')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-dispense-request.', '').replace('involviertePartei.', ''), 'FHIR-Profil': mapping.where(identity = 'Abgabeanforderung-Fachliches-Mapping').map
```

### Weitere Informationen
Im folgenden werden die Mappings weiterer Informationen einer Abgabeanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_DispenseRequest'
for differential.element where mapping.any(identity = 'Abgabeanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-dispense-request.Medikation.').not() and id.startsWith('gem-erp-sr-log-dispense-request.involvierteParteien.').not() and id.startsWith('gem-erp-sr-log-dispense-request.MetaDaten.').not()
select
	'Fachliche Information': id.replace('gem-erp-sr-log-dispense-request.', ''), 'FHIR-Profil': mapping.where(identity = 'Abgabeanforderung-Fachliches-Mapping').map
```