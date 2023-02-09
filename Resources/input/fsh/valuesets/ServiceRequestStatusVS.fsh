ValueSet: GEM_VS_MEDREQ_RequestStatus
Id: GEM-VS-MEDREQ-RequestStatus
Title: "GEM VS MEDREQ Request Status"
Description: "ValueSet to define the status of a request"
* insert MetaValueSet (GEM-VS-MEDREQ-RequestStatus)
* include codes from valueset $Hl7_Request_Status_VS
* exclude $Hl7_Request_Status_VS#draft
* exclude $Hl7_Request_Status_VS#on-hold
* exclude $Hl7_Request_Status_VS#unknown