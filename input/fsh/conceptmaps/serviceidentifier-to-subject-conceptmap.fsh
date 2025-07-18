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

* group[+]
  * source = Canonical(ServiceIdentifierCS)
  * element[+]
    * code = #eRezept_Rezeptanforderung;Rezeptanfrage
    * display = "Anfrage an einen Arzt ein Rezept auszustellen"
    * target
      * code = #eRezept_Rezeptanforderung;Rezeptanfrage
      * display = "Anfrage zur Ausstellung eines E-Rezepts"
      * equivalence = #equal

  * element[+]
    * code = #eRezept_Rezeptanforderung;Rezeptanfrage_Storno
    * display = "Stornierung der Rezeptanfrage"
    * target
      * code = #eRezept_Rezeptanforderung;Rezeptanfrage_Storno
      * display = "Stornierung einer Rezeptanfrage"
      * equivalence = #equal

  * element[+]
    * code = #eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung
    * display = "Ablehnung der Rezeptanfrage"
    * target
      * code = #eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung
      * display = "Ablehnung einer Rezeptanfrage"
      * equivalence = #equal

  * element[+]
    * code = #eRezept_Rezeptanforderung;Rezeptbestaetigung
    * display = "Bestätigung und Übermittlung eines ausgestellten Rezeptes"
    * target
      * code = #eRezept_Rezeptanforderung;Rezeptbestaetigung
      * display = "Rezeptbestätigung und Übermittlung"
      * equivalence = #equal

  * element[+]
    * code = #eRezept_Rezeptanforderung;Abgabeanfrage
    * display = "Anfrage zur Erfüllung eines Rezeptes und Abgabe des Medikaments"
    * target
      * code = #eRezept_Rezeptanforderung;Abgabeanfrage
      * display = "Anfrage zur Abgabe eines Medikaments"
      * equivalence = #equal

  * element[+]
    * code = #eRezept_Rezeptanforderung;Abgabebestaetigung
    * display = "Bestätigung der Erfüllung und Abgabe eines Medikamentes"
    * target
      * code = #eRezept_Rezeptanforderung;Abgabebestaetigung
      * display = "Bestätigung der Medikamentenabgabe"
      * equivalence = #equal

  * element[+]
    * code = #eRezept_Rezeptanforderung;NachrichtKopie
    * display = "Kopie einer Nachricht innerhalb des Prozesses der Rezeptanforderung"
    * target
      * code = #eRezept_Rezeptanforderung;NachrichtKopie
      * display = "Kopie einer Rezeptanforderung"
      * equivalence = #equal

  * element[+]
    * code = #eRezept_ParenteraleZubereitung;Rezeptanfrage
    * display = "Rezeptanfrage für eine anwendungsfertige Zytostatikazubereitung"
    * target
      * code = #eRezept_ParenteraleZubereitung;Rezeptanfrage
      * display = "Anfrage zur Ausstellung eines E-Rezepts einer Zytostatikazubereitung"
      * equivalence = #equal

  * element[+]
    * code = #eRezept_ParenteraleZubereitung;Rezeptanfrage_Storno
    * display = "Abbruch der Rezeptanfrage für eine anwendungsfertige Zytostatikazubereitung"
    * target
      * code = #eRezept_ParenteraleZubereitung;Rezeptanfrage_Storno
      * display = "Stornierung einer Rezeptanfrage zur Zytostatikazubereitung"
      * equivalence = #equal

  * element[+]
    * code = #eRezept_ParenteraleZubereitung;Rezeptbestaetigung
    * display = "Bestätigung und Übermittlung eines ausgestellten Rezeptes für eine anwendungsfertige Zytostatikazubereitung"
    * target
      * code = #eRezept_ParenteraleZubereitung;Rezeptbestaetigung
      * display = "Rezeptbestätigung einer Rezeptanfrage zur Zytostatikazubereitung"
      * equivalence = #equal