ValueSet: ServiceRequestOrganizationTypeVS
Id: service-request-organization-type-vs
Title: "ServiceRequest Organization Type (VS)"
Description: "Defines Organizations in the context of a ServiceRequest"
* insert MetaValueSet(service-request-organization-type-vs)

* include $IHEXDShealthcareFacilityTypeCode#APO "Apotheke"
* include $IHEXDShealthcareFacilityTypeCode#PRA "Arztpraxis"
* include $IHEXDShealthcareFacilityTypeCode#PFL "Pflegeheim"