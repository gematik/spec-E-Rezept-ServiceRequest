## {{page-title}}

Im Feature Dokument zu diesem Projekt ([gemF_eRp_KIM#3](//TODO)) werden die Anwendungsfälle fachlich beschrieben. Aus den dort aufgeführten fachlichen Informationsobjekten kann hier das Mapping auf die FHIR-Ressourcen nachvollzogen werden.

### ERPServiceRequestPrescriptionRequest Mappings

@```

from StructureDefinition
where name = 'ERPServiceRequestPrescriptionRequest'
for differential.element
    select id, join mapping { Feld: map, Fachliche_Informationseinheit: identity }
    order by Fachliche_Informationseinheit

```

### MedicationRequestPrescriptionRequest Mappings

@```
from StructureDefinition
where name = 'MedicationRequestPrescriptionRequest'
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
