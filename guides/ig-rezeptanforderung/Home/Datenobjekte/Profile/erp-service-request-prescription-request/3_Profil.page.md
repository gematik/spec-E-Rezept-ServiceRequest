## {{page-title}}

Die folgende FHIR Ressource stellt eine Anfrage an eine verordnende LEI dar. Enthalten sein muss eine strukturelle angabe der angefragten Medikation.

{{tree:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-prescription-request, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```
from StructureDefinition
where name = 'ERPServiceRequestPrescriptionRequest'
for differential.element
    select id, short, comment
```

### Use-Case spezifische Anforderungen

* Für `based` MUSS das Profil [ERPServiceRequestMedicationRequest](https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-medication-request) oder [KBV_PR_ERP_Prescription](https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription) verwendet werden.
* Für `subject` MUSS das Profil [KBV_PR_FOR_Patient](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient) verwendet werden.
* Für `requester` MUSS das Profil [KBV_PR_FOR_Practitioner](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner) oder [ERPServiceRequestOrganization](https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-organization) verwendet werden.
* Für `performer` MUSS das Profil [KBV_PR_FOR_Practitioner](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner) verwendet werden.
