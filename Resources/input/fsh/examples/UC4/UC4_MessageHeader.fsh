Instance: UC4-1-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "TODO"
Description: "TODO"
* insert Pharmacy-to-Practitioner(UC4-Initial-Prescription-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_ParenteraleErnaehrung;Rezeptanfrage

Instance: UC4-2-Practitioner-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-Pharmacy-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Practitioner-to-Pharmacy(UC4-Response-Prescription-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_ParenteraleErnaehrung;Rezeptbestaetigung