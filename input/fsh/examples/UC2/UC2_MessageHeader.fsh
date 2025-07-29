Instance: UC2-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #example
Title: "MessageHeader Pflegeeinrichtung an Verordnenden (UC2)"
Description: "Message Header für Rezeptanforderung zur Patienteneinlösung von Pflegeeinrichtung an Verordnenden"
* insert HealthCareService-to-Practitioner(UC2-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC2-Practitioner-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Verordnender an Pflegeeinrichtung (UC2)"
Description: "Message Header für Bestätigung der E-Rezept-Erstellung zur Patienteneinlösung vom Verordnenden an Pflegeeinrichtung"
* insert Practitioner-to-HealthCareService(UC2-Response-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptbestaetigung
* responsible = Reference(Example-Practitioner-Organization)


