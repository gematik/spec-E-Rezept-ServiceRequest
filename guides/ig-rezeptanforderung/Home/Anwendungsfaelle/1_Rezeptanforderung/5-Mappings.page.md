## {{page-title}}

Im Feature Dokument zu diesem Projekt gemF_eRp_KIM, Kapitel 3 werden die Anwendungsfälle fachlich beschrieben. Aus den dort aufgeführten fachlichen Informationsobjekten kann hier das Mapping auf die FHIR-Ressourcen nachvollzogen werden.

### ERPServiceRequestPrescriptionRequest Mappings

@```

from StructureDefinition
where name = 'ERPServiceRequestPrescriptionRequest'
for differential.element
    select id, join mapping { Feld: map, Fachliche_Informationseinheit: identity }
    order by Fachliche_Informationseinheit

```

### ERPServiceRequestMedicationRequest Mappings

@```
from StructureDefinition
where name = 'ERPServiceRequestMedicationRequest'
for differential.element
    select id, join mapping { Feld: map, Fachliche_Informationseinheit: identity }
    order by Fachliche_Informationseinheit

```

### ERPServiceRequestDispenseRequest Mappings

@```

from StructureDefinition
where name = 'ERPServiceRequestDispenseRequest'
for differential.element
    select id, join mapping { Feld: map, Fachliche_Informationseinheit: identity }
    order by Fachliche_Informationseinheit

```
