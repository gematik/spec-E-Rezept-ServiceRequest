CodeSystem: IssuingTypeCS
Id: IssuingTypeCS
Title: "Issuing Type"
Description: "This type defines how the prescription will be issued by the prescribing practitioner"
* insert Meta
* ^version = "1.0"
* ^caseSensitive = true
* ^content = #complete

* #patient "Ausstellung an Patient"
* #pharmacy "Aussttellung an Apotheke"
* #requester "Ausstellung an Anfragendenden"