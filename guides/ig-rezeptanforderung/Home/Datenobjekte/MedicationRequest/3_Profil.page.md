## {{page-title}}

Die folgende FHIR Ressource stellt eine Ressource bereit, die als Trägerobjekt für medizinische Informationen dient. Sie ist an die [KBV_PR_ERP_Prescription](https://simplifier.net/erezept/kbvprerpprescription) Profilierung angelehnt, um Informationen so einfach wie möglich in die Verordnung zu übernehmen.

Die Profilierung ist allerdings nicht so eng, da in der anfragenden Pflegeeinrichtung möglicherweise nicht alle Informationen vorliegen.

Das schreibende System übermittelt mit dieser Medikationsanfrage dem Verordnenden die Informationen zur gewünschten Medikation.

{{tree:https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-medication-request, diff}}

Folgende Felder sind entsprechend zu befüllen, bzw. können befüllt werden:

@```
from StructureDefinition
where name = 'ERPServiceRequestMedicationRequest'
for differential.element
    select id, short, comment
```

### Use-Case spezifische Anforderungen

* Für `medicationReference` MUSS das Profil [KBV_PR_ERP_Medication_FreeText](https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText), [KBV_PR_ERP_Medication_Compounding](https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding), [KBV_PR_ERP_Medication_PZN](https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN) oder [KBV_PR_ERP_Medication_Ingredient](https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient) verwendet werden.
* Für `subject` MUSS das Profil [KBV_PR_FOR_Patient](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient) verwendet werden.
* Für `requester` MUSS das Profil [KBV_PR_FOR_Practitioner](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner) oder [ERPServiceRequestOrganization](https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-organization) verwendet werden.
* Für `insurance` MUSS das Profil [KBV_PR_FOR_Coverage](https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Coverage) verwendet werden.
