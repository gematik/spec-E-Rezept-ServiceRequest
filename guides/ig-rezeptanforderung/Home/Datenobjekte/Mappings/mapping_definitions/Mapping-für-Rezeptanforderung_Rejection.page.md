## {{page-title}}

Diese Seite zeigt das Mapping der fachlichen Informationen aus dem {{pagelink:Home/Datenobjekte/Logical-Models/gem-erp-sr-log-prescription-request-rejection.page.md}}: {{tree:GEM_ERP_SR_LOG_PrescriptionRequest_Rejection}}

### MetaDaten zur Nachricht
Im folgenden werden die Mappings der Metainformationen einer Rezeptanforderungs Ablehnung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Rejection'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Ablehnung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request-rejection.MetaDaten')
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request-rejection.', '').replace('MetaDaten.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Ablehnung-Fachliches-Mapping').map
```

### Weitere Informationen
Im folgenden werden die Mappings weiterer Informationen einer Rezeptanforderungs Ablehnung zu den Profilen gelistet.
@```
from
	StructureDefinition
where
	name = 'GEM_ERP_SR_LOG_PrescriptionRequest_Rejection'
for differential.element where mapping.any(identity = 'Rezeptanforderung-Ablehnung-Fachliches-Mapping') and id.startsWith('gem-erp-sr-log-prescription-request-rejection.Medikation.').not() and id.startsWith('gem-erp-sr-log-prescription-request-rejection.involvierteParteien.').not() and id.startsWith('gem-erp-sr-log-prescription-request-rejection.MetaDaten.').not()
select
	'Fachliche Information': id.replace('gem-erp-sr-log-prescription-request-rejection.', ''), 'FHIR-Profil': mapping.where(identity = 'Rezeptanforderung-Ablehnung-Fachliches-Mapping').map
```