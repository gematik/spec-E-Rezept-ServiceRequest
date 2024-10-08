Instance: UC1-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #example
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage "Anfrage an einen Arzt ein Rezept auszustellen" 
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC1-Practitioner-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to HealthCareService"
* insert Practitioner-to-HealthCareService(UC1-Response-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptbestaetigung "Bestätigung und Übermittlung eines ausgestellten Rezeptes"
* responsible = Reference(Example-Practitioner-Organization)

Instance: UC1-HealthCareService-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Pharmacy-MessageHeader"
Description: "Message Header from HealthCareService to Pharmacy"
* insert HealthCareService-to-Pharmacy(UC1-Initial-Dispense-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Abgabeanfrage "Anfrage zur Erfüllung eines Rezeptes und Abgabe des Medikaments"
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC1-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader"
Description: "Message Header from Pharmacy to HealthCareService"
* insert Pharmacy-to-HealthCareService(UC1-Response-Dispense-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Abgabebestaetigung "Bestätigung der Erfüllung und Abgabe eines Medikamentes"
* responsible = Reference(Example-Pharmacy-Organization)

