Instance: UC1-MULTI-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-MULTI-Initial-Prescription-Request-1)
* focus[+] = Reference(UC1-MULTI-Initial-Prescription-Request-2)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC1-MULTI-Practitioner-to-HealthCareService-MessageHeader-1
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to HealthCareService"
* insert Practitioner-to-HealthCareService(UC1-MULTI-Response-Prescription-Request-1)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptbestaetigung
* responsible = Reference(Example-Practitioner-Organization)

Instance: UC1-MULTI-Practitioner-to-HealthCareService-MessageHeader-2
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to HealthCareService"
* insert Practitioner-to-HealthCareService(UC1-MULTI-Response-Prescription-Request-2)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage_Storno
* responsible = Reference(Example-Practitioner-Organization)

Instance: Komplex-MULTI-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-MULTI-Initial-Prescription-Request-1)
* focus[+] = Reference(UC1-MULTI-Initial-Prescription-Request-2)
* focus[+] = Reference(Komplex-MULTI-Initial-Prescription-Request-3)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage
* responsible = Reference(Example-HealthCareService-Organization)

