Instance: UC2-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #example
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC2-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage "Anfrage an einen Arzt ein Rezept auszustellen"
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC2-Practitioner-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to HealthCareService"
* insert Practitioner-to-HealthCareService(UC2-Response-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptbestaetigung "Bestätigung und Übermittlung eines ausgestellten Rezeptes"
* responsible = Reference(Example-Practitioner-Organization)


