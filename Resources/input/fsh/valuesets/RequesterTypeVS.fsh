ValueSet: RequesterTypeVS
Id: requester-type-vs
Title: "Requester Type (VS)"
Description: "Defines the allowed types of Requesters for a ServiceRequest"
* insert MetaValueSet(service-identifier-vs)

* include $IHEXDShealthcareFacilityTypeCode#APO "Apotheke"
* include $IHEXDShealthcareFacilityTypeCode#PFL "Pflegeheim"