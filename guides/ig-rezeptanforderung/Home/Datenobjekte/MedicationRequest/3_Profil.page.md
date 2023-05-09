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
