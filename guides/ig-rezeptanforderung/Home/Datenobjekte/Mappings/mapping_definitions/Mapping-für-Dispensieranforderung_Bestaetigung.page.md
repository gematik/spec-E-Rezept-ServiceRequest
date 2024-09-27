## {{page-title}}

Diese Seite zeigt das Mapping der fachlichen Informationen aus dem {{pagelink:Home/Datenobjekte/Logical-Models/gem-erp-sr-log-dispense-request-confirmation.page.md}}: {{tree:GEM_ERP_SR_LOG_DispenseRequest_Confirmation}}

### MetaDaten zur Nachricht
Im folgenden werden die Mappings der Metainformationen einer Dispensieranforderungs Bestätigung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_DispenseRequest_Confirmation'
for differential.element where mapping.any(identity = 'Dispensieranforderung-Bestaetigung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-dispense-request-confirmation.MetaDaten')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-dispense-request-confirmation.', '').replace('MetaDaten.', ''), 'FHIR-Profil': mapping.where(identity = 'Dispensieranforderung-Bestaetigung-Fachliches-Mapping').map
```

### Weitere Informationen
Im folgenden werden die Mappings weiterer Informationen einer Dispensieranforderungs Bestätigung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_DispenseRequest_Confirmation'
for differential.element where mapping.any(identity = 'Dispensieranforderung-Bestaetigung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-dispense-request-confirmation.Medikation.').not() and id.startsWith('gem-erp-sr-log-dispense-request-confirmation.involvierteParteien.').not() and id.startsWith('gem-erp-sr-log-dispense-request-confirmation.MetaDaten.').not()
select
	'Fachliche Information': id.replace('gem-erp-sr-log-dispense-request-confirmation.', ''), 'FHIR-Profil': mapping.where(identity = 'Dispensieranforderung-Bestaetigung-Fachliches-Mapping').map
```