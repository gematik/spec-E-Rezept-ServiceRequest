ValueSet: GEM_VS_MEDREQ_RequestStatus
Id: GEM-VS-MEDREQ-RequestStatus
Title: "Status des ServiceRequests"
Description: "Auswahl an Codes um anzugeben welchen Status ein ServiceRequest hat"
* insert MetaValueSet (GEM-VS-MEDREQ-RequestStatus)
* include codes from system $Hl7_Request_Status
* exclude $Hl7_Request_Status#draft
* exclude $Hl7_Request_Status#on-hold
* exclude $Hl7_Request_Status#unknown