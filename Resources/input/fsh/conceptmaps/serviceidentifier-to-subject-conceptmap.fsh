Instance: ServiceIdentifierToSubjectConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Service Identifier To Subject Concept Map"
Description: "This Concept Map allows for the mapping of a Service Identifier to a Subject Header for a KIM-Message in the context of a Service Request."
* insert VersioningInst
* name = "Service Identifier To Subject Concept Map"
* purpose = "This Concept Map allows for the mapping of a Service Identifier to a Subject Header for a KIM-Message in the context of a Service Request."
* sourceCanonical = "https://gematik.de/fhir/erp-servicerequest/ValueSet/service-identifier-vs"
* targetUri = "Betreffzeile_in_einer_KIM-Nachricht"

* group.element[+].code = #eRezept_Rezeptanforderung;Rezeptanfrage
* group.element[=].target.display = "Anfrage zur Ausstellung eines E-Rezepts"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Rezeptanfrage_Storno
* group.element[=].target.display = "Stornierung einer Rezeptanfrage"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung
* group.element[=].target.display = "Ablehnung einer Rezeptanfrage"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Rezeptbestaetigung
* group.element[=].target.display = "Rezeptbestätigung und Übermittlung"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Abgabeanfrage
* group.element[=].target.display = "Anfrage zur Abgabe eines Medikaments"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Abgabebestaetigung
* group.element[=].target.display = "Bestätigung der Medikamentenabgabe"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;NachrichtKopie
* group.element[=].target.display = "Kopie einer Rezeptanforderung"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_ParenteraleZubereitung;Rezeptanfrage
* group.element[=].target.display = "Anfrage zur Ausstellung eines E-Rezepts einer Zytostatikazubereitung"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_ParenteraleZubereitung;Rezeptanfrage_Storno
* group.element[=].target.display = "Stornierung einer Rezeptanfrage zur Zytostatikazubereitung"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_ParenteraleZubereitung;Rezeptbestaetigung
* group.element[=].target.display = "Rezeptbestätigung einer Rezeptanfrage zur Zytostatikazubereitung"
* group.element[=].target.equivalence = #equal