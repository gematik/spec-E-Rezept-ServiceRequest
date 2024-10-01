Instance: UC4-1-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "TODO"
Description: "TODO"
* insert Pharmacy-to-Practitioner(UC4-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_ParenteraleZubereitung;Rezeptanfrage
* responsible = Reference(Example-Pharmacy-Organization)

Instance: UC4-2-Practitioner-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-Pharmacy-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Practitioner-to-Pharmacy(UC4-Response-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_ParenteraleZubereitung;Rezeptbestaetigung
* responsible = Reference(Example-Practitioner-Organization)