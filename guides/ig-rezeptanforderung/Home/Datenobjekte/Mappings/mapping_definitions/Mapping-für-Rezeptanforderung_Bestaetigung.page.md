## {{page-title}}

Diese Seite zeigt das Mapping der fachlichen Informationen aus dem {{pagelink:Home/Datenobjekte/Logical-Models/gem-erp-sr-log-prescription-request-confirmation.page.md}}: {{tree:GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation}}

### MetaDaten zur Nachricht
Im folgenden werden die Mappings der Metainformationen einer Rezeptanforderungs Bestätigung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Bestaetigung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request-confirmation.MetaDaten')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request-confirmation.', '').replace('MetaDaten.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Bestaetigung-Fachliches-Mapping').map
```

### Weitere Informationen
Im folgenden werden die Mappings weiterer Informationen einer Rezeptanforderungs Bestätigung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Confirmation'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Bestaetigung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request-confirmation.Medikation.').not() and id.startsWith('gem-erp-sr-log-prescription-request-confirmation.involvierteParteien.').not() and id.startsWith('gem-erp-sr-log-prescription-request-confirmation.MetaDaten.').not()
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request-confirmation.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Bestaetigung-Fachliches-Mapping').map
```