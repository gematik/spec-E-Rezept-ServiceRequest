Instance: UC1-HealthCareService-to-Practitioner-MessageHeader-Storno
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader-Storno"
Description: "Cancellation Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Prescription-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptanfrage_Storno

Instance: UC1-Practitioner-to-HealthCareService-MessageHeader-Storno
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader-Storno"
Description: "Cancellation Message Header from Practitioner to HealthCareService"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Prescription-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptanfrage_Storno

Instance: UC1-HealthCareService-to-Pharmacy-MessageHeader-Storno
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Pharmacy-MessageHeader-Storno"
Description: "Cancellation Message Header from HealthCareService to Pharmacy"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Dispense-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Abgabeanfrage_Storno

Instance: UC1-Pharmacy-to-HealthCareService-MessageHeader-Storno
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader-Storno"
Description: "Cancellation Message Header from Pharmacy to HealthCareService"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Dispense-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Abgabeanfrage_Storno


