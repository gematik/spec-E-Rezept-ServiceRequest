## {{page-title}}

Diese Seite zeigt das Mapping der fachlichen Informationen aus dem Logical Model der Rezeptanforderung_Stornierung: {{tree:GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation}}

### MetaDaten zur Nachricht
Im folgenden werden die Mappings der Metainformationen einer Rezeptanforderungs Bestätigung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Stornierung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request-cancellation.MetaDaten')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request-cancellation.', '').replace('MetaDaten.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Stornierung-Fachliches-Mapping').map
```

### Weitere Informationen
Im folgenden werden die Mappings weiterer Informationen einer Rezeptanforderungs Bestätigung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Cancellation'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Stornierung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request-cancellation.Medikation.').not() and id.startsWith('gem-erp-sr-log-prescription-request-cancellation.involvierteParteien.').not() and id.startsWith('gem-erp-sr-log-prescription-request-cancellation.MetaDaten.').not()
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request-cancellation.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Stornierung-Fachliches-Mapping').map
```