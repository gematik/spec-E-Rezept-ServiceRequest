ValueSet: ServiceRequestStatusVS
Id: service-request-status-vs
Title: "Status des ServiceRequests"
Description: "Auswahl an Codes um anzugeben welchen Status ein ServiceRequest hat"
* insert MetaValueSet (service-request-status-vs)
* include codes from system $Hl7_Request_Status
* exclude $Hl7_Request_Status#draft
* exclude $Hl7_Request_Status#on-hold
* exclude $Hl7_Request_Status#unknown