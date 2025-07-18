---
canonical: https://gematik.de/fhir/erp-servicerequest/CodeSystem/delivery-type-cs
expand: 2
---

# {{page-title}}

## Metadata

These are the details for this resource:

<fql output="table">
    from
        CodeSystem
    where
        url = %canonical
    select
        Name: name,
        Description: description,
        Canonical_URL: url,
        Status: status,
        Version: version
</fql>

## Resource content

These are different views on this resource:

<tabs>
    <tab title="Overview">      
        {{render}}
    </tab>
    <tab title="XML">      
        {{xml}}
    </tab>
    <tab title="JSON">
        {{json}}
    </tab>
    <tab title="Link">
        {{link}}
    </tab>
</tabs>
