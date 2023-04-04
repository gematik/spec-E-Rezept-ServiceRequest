## {{page-title}}

@```
from StructureDefinition
for differential.element
    group by mapping.identity
    select id, join mapping { Fachliche_Informationseinheit: map  }
```

  {
            "identity": "dispense-request-mapping",
            "map": "ServiceRequest"
          },
          {
            "identity": "dispense-request-mapping-storno",
            "map": "ServiceRequest"
          },
          {
            "identity": "dispense-request-mapping-reject",
            "map": "ServiceRequest"
          }