Instance: UC3-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: MessageHeaderRequestHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC3-Initial-Prescription-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptanfrage

Instance: UC3-Practitioner-to-HealthCareService-MessageHeader
InstanceOf: MessageHeaderRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to HealthCareService"
* insert HealthCareService-to-Practitioner(UC3-Response-Prescription-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptbestaetigung
