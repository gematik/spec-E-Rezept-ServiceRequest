## {{page-title}}

### ServiceRequestPrescriptionRequest Mappings

@```
from StructureDefinition
where name = 'ServiceRequestPrescriptionRequest'
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
