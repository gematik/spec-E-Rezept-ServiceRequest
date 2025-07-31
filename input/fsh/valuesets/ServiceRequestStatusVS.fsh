ValueSet: ServiceRequestStatusVS
Id: service-request-status-vs
Title: "Status des ServiceRequests"
Description: "Auswahl von Codes zur Angabe des Status eines ServiceRequests"
* insert MetaValueSet (service-request-status-vs)
* include codes from system RequestStatus
* exclude RequestStatus#draft
* exclude RequestStatus#on-hold
* exclude RequestStatus#unknown