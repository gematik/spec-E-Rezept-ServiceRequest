Instance: UC3-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Apotheke an Verordnenden (UC3)"
Description: "Message Header für Rezeptanforderung der heimversorgenden Apotheke an Verordnenden"
* insert Pharmacy-to-Practitioner(UC3-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage
* responsible = Reference(Example-Pharmacy-Organization)

Instance: UC3-Practitioner-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Verordnender an Apotheke (UC3)"
Description: "Message Header für Bestätigung der E-Rezept-Erstellung vom Verordnenden an Apotheke"
* insert Pharmacy-to-Practitioner(UC3-Response-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptbestaetigung
* responsible = Reference(Example-Practitioner-Organization)

Instance: UC3-Practitioner-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Verordnender an Pflegeeinrichtung (UC3 Kopie)"
Description: "Message Header für Nachrichtenkopie der Rezeptbestätigung vom Verordnenden an Pflegeeinrichtung"
* insert Practitioner-to-HealthCareService(UC3-2-Fullfilled-Prescription-Request)
* focus[0] = Reference(Bundle/UC3-2-Fullfilled-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;NachrichtKopie
* responsible = Reference(Example-Practitioner-Organization)

Instance: UC3-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Apotheke an Pflegeeinrichtung (UC3 Kopie)"
Description: "Message Header für Nachrichtenkopie der Rezeptanforderung von Apotheke an Pflegeeinrichtung"
* insert Pharmacy-to-HealthCareService(UC3-1-Prescription-Request-To-Prescriber)
* focus[0] = Reference(Bundle/UC3-1-Prescription-Request-To-Prescriber)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;NachrichtKopie
* responsible = Reference(Example-Pharmacy-Organization)