Instance: ServiceIdentifierToSubjectConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Service Identifier To Subject Concept Map"
Description: "This Concept Map allows for the mapping of a Service Identifier to a Subject Header for a KIM-Message in the context of a Service Request."
* insert VersioningInst
// TODO: ConceptMap.group[0] | No Source Code System, so the source codes cannot be checked {CONCEPTMAP_GROUP_SOURCE_MISSING}
* name = "Service Identifier To Subject Concept Map"
* purpose = "This Concept Map allows for the mapping of a Service Identifier to a Subject Header for a KIM-Message in the context of a Service Request."
* sourceCanonical = "https://gematik.de/fhir/erp-servicerequest/ValueSet/service-identifier-vs"
* targetUri = "Betreffzeile_in_einer_KIM-Nachricht"

* group
  * source = Canonical(ServiceIdentifierCS)
  * element[+].code = #eRezept_Rezeptanforderung;Rezeptanfrage
  * element[=].target.display = "Anfrage zur Ausstellung eines E-Rezepts"
  * element[=].target.equivalence = #equal

  * element[+].code = #eRezept_Rezeptanforderung;Rezeptanfrage_Storno
  * element[=].target.display = "Stornierung einer Rezeptanfrage"
  * element[=].target.equivalence = #equal

  * element[+].code = #eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung
  * element[=].target.display = "Ablehnung einer Rezeptanfrage"
  * element[=].target.equivalence = #equal

  * element[+].code = #eRezept_Rezeptanforderung;Rezeptbestaetigung
  * element[=].target.display = "Rezeptbestätigung und Übermittlung"
  * element[=].target.equivalence = #equal

  * element[+].code = #eRezept_Rezeptanforderung;Abgabeanfrage
  * element[=].target.display = "Anfrage zur Abgabe eines Medikaments"
  * element[=].target.equivalence = #equal

  * element[+].code = #eRezept_Rezeptanforderung;Abgabebestaetigung
  * element[=].target.display = "Bestätigung der Medikamentenabgabe"
  * element[=].target.equivalence = #equal

  * element[+].code = #eRezept_Rezeptanforderung;NachrichtKopie
  * element[=].target.display = "Kopie einer Rezeptanforderung"
  * element[=].target.equivalence = #equal

  * element[+].code = #eRezept_ParenteraleZubereitung;Rezeptanfrage
  * element[=].target.display = "Anfrage zur Ausstellung eines E-Rezepts einer Zytostatikazubereitung"
  * element[=].target.equivalence = #equal

  * element[+].code = #eRezept_ParenteraleZubereitung;Rezeptanfrage_Storno
  * element[=].target.display = "Stornierung einer Rezeptanfrage zur Zytostatikazubereitung"
  * element[=].target.equivalence = #equal

  * element[+].code = #eRezept_ParenteraleZubereitung;Rezeptbestaetigung
  * element[=].target.display = "Rezeptbestätigung einer Rezeptanfrage zur Zytostatikazubereitung"
  * element[=].target.equivalence = #equal