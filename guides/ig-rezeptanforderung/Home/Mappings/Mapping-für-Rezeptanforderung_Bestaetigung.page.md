## {{page-title}}

Diese Seite zeigt das Mapping der fachlichen Informationen aus dem Logical Model der Rezeptanforderung_Bestätigung: {{tree:GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation}}

### MetaDaten zur Nachricht
Im folgenden werden die Mappings der Metainformationen einer Rezeptanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request.MetaDaten')
select
	'Fachliche Infomration': id.replace('gem-erp-sr-log-prescription-request.', '').replace('MetaDaten.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Fachliches-Mapping').map
```

### Involvierte Parteien
Im folgenden werden die Mappings der involvierten Parteien einer Rezeptanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request.involviertePartei')
select
	'Fachliche Infomration': id.replace('gem-erp-sr-log-prescription-request.', '').replace('involviertePartei.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Fachliches-Mapping').map
```

### Angaben zur Medikation
Im folgenden werden die Mappings der Medikationsinformationen einer Rezeptanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request.Medikation.')
select
	'Fachliche Infomration': id.replace('gem-erp-sr-log-prescription-request.Medikation.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Fachliches-Mapping').map
```

### Weitere Informationen
Im folgenden werden die Mappings weiterer Informationen einer Rezeptanforderung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request.Medikation.').not() and id.startsWith('gem-erp-sr-log-prescription-request.involvierteParteien.').not() and id.startsWith('gem-erp-sr-log-prescription-request.MetaDaten.').not()
select
	'Fachliche Infomration': id.replace('gem-erp-sr-log-prescription-request.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Fachliches-Mapping').map
```