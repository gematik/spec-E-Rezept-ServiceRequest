
Alias: $address-de-basis = http://fhir.de/StructureDefinition/address-de-basis
Profile: GEM_PR_ERP_MEDREQ_RequestingOrganization
Parent: Organization
Id: gem-pr-erp-medreq-requesting-organization
Title: "GEM PR ERP MEDREQ Requesting Organization"
Description: "Organization that is requesting the medication"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_RequestingOrganization)
* identifier ..2 MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #closed
* identifier contains
    Institutionskennzeichen 0..1 MS and
    Betriebsstaettennummer 0..1 MS and
    VKNR 0..0 and
    Telematik-ID 0..1 MS and
    Standortnummer 0..1 MS
* type from RequestingOrganizationVS
* address 1..1
* address only $address-de-basis
* address.extension ..0
* address.extension ^slicing.discriminator.type = #value
* address.extension ^slicing.discriminator.path = "url"
* address.extension ^slicing.rules = #closed
* address.use ..0
* address.type 1..
* address.type = #physical (exactly)
* address.text ..0
* address.line 1..1
* address.line.extension ^slicing.discriminator.type = #value
* address.line.extension ^slicing.discriminator.path = "url"
* address.line.extension ^slicing.rules = #closed
* address.line.extension[Strasse] ^sliceName = "Strasse"
* address.line.extension[Strasse].value[x] ^maxLength = 46
* address.line.extension[Hausnummer] ^sliceName = "Hausnummer"
* address.line.extension[Hausnummer].value[x] ^maxLength = 9
* address.line.extension[Adresszusatz] ^sliceName = "Adresszusatz"
* address.line.extension[Adresszusatz] ^min = 0
* address.line.extension[Adresszusatz] ^mustSupport = true
* address.line.extension[Adresszusatz].value[x] ^maxLength = 40
* address.city 1..
* address.city ^short = "Ortsname"
* address.city ^definition = "Ortsname der anfordernden Organisation"
* address.city ^maxLength = 40
* address.state ..0
* address.postalCode 1..
* address.postalCode ^maxLength = 10
* address.period ..0
* telecom 1..
* telecom only ContactPoint
* telecom.system 1..
* telecom.system = #url
* telecom.value 1..
* telecom.value ^short = "Source endpoint URI of sender. E.g. https://pflegeinrichtung.de/KIM"
