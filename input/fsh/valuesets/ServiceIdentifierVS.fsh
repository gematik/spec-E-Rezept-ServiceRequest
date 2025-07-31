ValueSet: ServiceIdentifierVS
Id: service-identifier-vs
Title: "Identifikator des Anwendungsfalls"
Description: "Identifikatoren zur Spezifikation einer Anwendung der E-Rezept-Kommunikation"
* insert MetaValueSet(service-identifier-vs)
// Rezeptanforderung
* include codes from system ServiceIdentifierCS where concept is-a #eRezept_Rezeptanforderung

// Anwendungsfertige Zytostatikazubereitungen
* include codes from system ServiceIdentifierCS where concept is-a #eRezept_ParenteraleZubereitung