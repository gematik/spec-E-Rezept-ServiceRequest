ValueSet: ServiceRequestStatusVS
Id: service-request-status-vs
Title: "Status des ServiceRequests"
Description: "Selection of codes to indicate the status of a ServiceRequest"
* insert MetaValueSet (service-request-status-vs)
* include codes from system RequestStatus
* exclude RequestStatus#draft
* exclude RequestStatus#on-hold
* exclude RequestStatus#unknown