ValueSet: ServiceIdentifierVS
Id: service-identifier-vs
Title: "Identifier of the use case"
Description: "Identifiers for specifying an application of e-prescription communication"
* insert MetaValueSet(service-identifier-vs)
// Rezeptanforderung
* include codes from system $GEM_CS_ATF_ServiceIdentifier where concept is-a #eRezept_Rezeptanforderung

// Anwendungsfertige Zytostatikazubereitungen
* include codes from system $GEM_CS_ATF_ServiceIdentifier where concept is-a #eRezept_ParenteraleZubereitung