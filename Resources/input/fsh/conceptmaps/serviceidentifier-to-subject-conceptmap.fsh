Instance: ServiceIdentifierToSubjectConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Service Identifier To Subject Concept Map"
Description: "This Concept Map allows for the mapping of a Service Identifier to a Subject Header for a KIM-Message in the context of a Service Request."
* insert VersioningInst
* name = "Service Identifier To Subject Concept Map"
* purpose = "This Concept Map allows for the mapping of a Service Identifier to a Subject Header for a KIM-Message in the context of a Service Request."
* sourceCanonical = "https://gematik.de/fhir/erp-servicerequest/ValueSet/service-identifier-vs"
* targetUri = "subject-line-for-KIM-message"

* group.element[+].code = #message-copy
* group.element[=].display = "Nachrichtenkopie"
* group.element[=].target.display = "Kopie einer Rezeptanforderung"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Rezeptanfrage
* group.element[=].display = "Anfrage an einen Arzt ein Rezept auszustellen"
* group.element[=].target.display = "Anfrage zur Ausstellung eines Rezepts"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Rezeptanfrage_Storno
* group.element[=].display = "Stornierung der Rezeptanfrage"
* group.element[=].target.display = "Stornierung der Rezeptanfrage"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung
* group.element[=].display = "Ablehnung der Rezeptanfrage"
* group.element[=].target.display = "Ablehnung der Rezeptanfrage"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Rezeptbestaetigung
* group.element[=].display = "Bestätigung und Übermittlung eines ausgestellten Rezeptes"
* group.element[=].target.display = "Rezeptbestätigung und Übermittlung"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Abgabeanfrage
* group.element[=].display = "Anfrage zur Erfüllung eines Rezeptes und Abgabe des Medikaments"
* group.element[=].target.display = "Anfrage zur Abgabe eines Medikaments"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;Abgabebestaetigung
* group.element[=].display = "Bestätigung der Erfüllung und Abgabe eines Medikamentes"
* group.element[=].target.display = "Bestätigung der Medikamentenabgabe"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_Rezeptanforderung;NachrichtKopie
* group.element[=].display = "Kopie einer Nachricht innerhalb des Prozesses der Rezeptanforderung"
* group.element[=].target.display = "Prozessnachricht Kopie"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_ParenteraleZubereitung;Rezeptanfrage
* group.element[=].display = "Rezeptanfrage für eine anwendungsfertige Zytostatikazubereitung"
* group.element[=].target.display = "Anfrage für Zytostatikazubereitung"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_ParenteraleZubereitung;Rezeptanfrage_Storno
* group.element[=].display = "Abbruch der Rezeptanfrage für eine anwendungsfertige Zytostatikazubereitung"
* group.element[=].target.display = "Stornierung der Zytostatikazubereitungsanfrage"
* group.element[=].target.equivalence = #equal

* group.element[+].code = #eRezept_ParenteraleZubereitung;Rezeptbestaetigung
* group.element[=].display = "Bestätigung und Übermittlung eines ausgestellten Rezeptes für eine anwendungsfertige Zytostatikazubereitung"
* group.element[=].target.display = "Rezeptbestätigung für Zytostatikazubereitung"
* group.element[=].target.equivalence = #equal