Instance: UC1-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #example
Title: "MessageHeader Pflegeeinrichtung an Verordnenden (UC1)"
Description: "Message Header für Rezeptanforderung der Pflegeeinrichtung an Verordnenden für Heimversorgung"
* insert HealthCareService-to-Practitioner(UC1-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage 
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC1-Practitioner-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Verordnender an Pflegeeinrichtung (UC1)"
Description: "Message Header für Bestätigung der E-Rezept-Erstellung vom Verordnenden an Pflegeeinrichtung"
* insert Practitioner-to-HealthCareService(UC1-Response-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptbestaetigung
* responsible = Reference(Example-Practitioner-Organization)

Instance: UC1-HealthCareService-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Pflegeeinrichtung an Apotheke (UC1)"
Description: "Message Header für Abgabeanforderung der Pflegeeinrichtung an Apotheke für Heimversorgung"
* insert HealthCareService-to-Pharmacy(UC1-Initial-Dispense-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Abgabeanfrage
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC1-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Apotheke an Pflegeeinrichtung (UC1)"
Description: "Message Header für Bestätigung der Belieferung von Apotheke an Pflegeeinrichtung"
* insert Pharmacy-to-HealthCareService(UC1-Response-Dispense-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Abgabebestaetigung
* responsible = Reference(Example-Pharmacy-Organization)

// Alternative Addresse
Instance: UC1-Alt-Delivery-HealthCareService-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Pflegeeinrichtung an Apotheke (UC1 alternative Lieferung)"
Description: "Message Header für Abgabeanforderung mit alternativer Lieferadresse von Pflegeeinrichtung an Apotheke"
* insert HealthCareService-to-Pharmacy(UC1-Alt-Delivery-Initial-Dispense-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Abgabeanfrage
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC1-Alt-Delivery-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Apotheke an Pflegeeinrichtung (UC1 alternative Lieferung)"
Description: "Message Header für Bestätigung der Belieferung mit alternativer Lieferadresse von Apotheke an Pflegeeinrichtung"
* insert Pharmacy-to-HealthCareService(UC1-Alt-Delivery-Response-Dispense-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Abgabebestaetigung
* responsible = Reference(Example-Pharmacy-Organization)

