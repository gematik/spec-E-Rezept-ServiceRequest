# {{page-title}}

In dieser Spezifikation wurden die folgenden ValueSets definiert:

<fql output="table">
from ValueSet
select
    Name: link(url, name),
    Description: description
</fql>

Diese ValueSets werden in folgenden Profilen eingesetzt:

<fql output="table">
from StructureDefinition
select Name: name,
join for differential.element where binding.exists()
    select
        'Feld': id,
        join for binding select { ValueSet: link(valueSet, valueSet.replace('https://gematik.de/fhir/erp-servicerequest/ValueSet/', '')) }
</fql>