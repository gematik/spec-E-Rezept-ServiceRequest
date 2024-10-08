Instance: UC4-1-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-Practitioner-MessageHeader"
Description: "Message Header from Pharmacy to Practitioner"
* insert Pharmacy-to-Practitioner(UC4-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_ParenteraleZubereitung;Rezeptanfrage "Rezeptanfrage für eine parenterale Zubereitung"
* responsible = Reference(Example-Pharmacy-Organization)

Instance: UC4-2-Practitioner-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-Pharmacy-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Practitioner-to-Pharmacy(UC4-Response-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_ParenteraleZubereitung;Rezeptbestaetigung "Bestätigung und Übermittlung eines ausgestellten Rezeptes für eine parenterale Zubereitung"
* responsible = Reference(Example-Practitioner-Organization)