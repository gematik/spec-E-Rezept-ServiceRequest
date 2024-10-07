Instance: UC3-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-Practitioner-MessageHeader"
Description: "Message Header from Pharmacy to Practitioner"
* insert Pharmacy-to-Practitioner(UC3-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage
* responsible = Reference(Example-Pharmacy-Organization)

Instance: UC3-Practitioner-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-Pharmacy-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Pharmacy-to-Practitioner(UC3-Response-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptbestaetigung
* responsible = Reference(Example-Practitioner-Organization)

Instance: UC3-Practitioner-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to HealthCareService"
* insert Practitioner-to-HealthCareService(UC3-2-Fullfilled-Prescription-Request)
* focus[0] = Reference(Bundle/UC3-2-Fullfilled-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;NachrichtKopie
* responsible = Reference(Example-Practitioner-Organization)

Instance: UC3-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader"
Description: "Message Header from Pharmacy to HealthCareService"
* insert Pharmacy-to-HealthCareService(UC3-1-Prescription-Request-To-Prescriber)
* focus[0] = Reference(Bundle/UC3-1-Prescription-Request-To-Prescriber)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;NachrichtKopie
* responsible = Reference(Example-Pharmacy-Organization)