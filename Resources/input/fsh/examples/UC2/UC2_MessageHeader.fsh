Instance: UC2-1-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader"
Description: "Message Header from Pharmacy to HealthCareService"
* insert Pharmacy-to-Practitioner(UC2-Initial-Prescription-Request) //Das ist korrekt, Pflegeeinrichtung ist Proxy
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptanfrage


Instance: UC2-2-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert Pharmacy-to-Practitioner(UC2-Initial-Prescription-Request) //Das ist korrekt, Pflegeeinrichtung ist Proxy
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptanfrage

Instance: UC2-3-Practitioner-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to HealthCareService"
* insert Practitioner-to-Pharmacy(UC2-Response-Prescription-Request) //Das ist korrekt, Pflegeeinrichtung ist Proxy
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptbestaetigung

Instance: UC2-4-HealthCareService-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Pharmacy-MessageHeader"
Description: "Message Header from HealthCareService to Pharmacy"
* insert Practitioner-to-Pharmacy(UC2-Response-Prescription-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptbestaetigung

Instance: UC2-5-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Pharmacy-to-HealthCareService(UC2-Response-Dispense-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Abgabebestaetigung