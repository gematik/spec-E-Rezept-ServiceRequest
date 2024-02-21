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
### Weitere Informationen

`based` erlaubt Referenzen zu _MedicationRequest_, jedoch sollte hier [ERPServiceRequestMedicationRequest](https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-medication-request) oder [KBV_PR_ERP_Prescription](https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription) verwendet werden.

`subject` ist nicht eingeschränkt, jedoch sollte hier [KBV_PR_FOR_Patient](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient) verwendet werden.

`requester` erlaubt Referenzen zu _Practitioner_ und _ Organization_, jedoch sollte hier entweder [KBV_PR_FOR_Practitioner](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner) oder [ERPServiceRequestOrganization](https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-organization) verwendet werden.

`performer` erlaubt Referenzen zu  _Pracitioner_, jedoch sollte hier [KBV_PR_FOR_Practitioner](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner) verwendet werden.
