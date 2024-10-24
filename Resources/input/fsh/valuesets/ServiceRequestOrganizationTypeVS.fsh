ValueSet: ServiceRequestOrganizationTypeVS
Id: service-request-organization-type-vs
Title: "ServiceRequest Organization Type (VS)"
Description: "Defines Organizations in the context of a ServiceRequest"
* insert MetaValueSet(service-request-organization-type-vs)

* include $CSIHEPatientBezogenenGesundheitsversorgung#APO "Apotheke"
* include $CSIHEPatientBezogenenGesundheitsversorgung#PRA "Arztpraxis"
* include $CSIHEPatientBezogenenGesundheitsversorgung#PFL "Pflegeheim"