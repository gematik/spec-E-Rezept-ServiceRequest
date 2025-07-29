Instance: UC4-1-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Apotheke an Verordnenden (UC4 Zytostatika)"
Description: "Message Header für Rezeptanforderung von Zytostatika-Zubereitungen von Apotheke an Verordnenden"
* insert Pharmacy-to-Practitioner(UC4-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_ParenteraleZubereitung;Rezeptanfrage
* responsible = Reference(Example-Pharmacy-Organization)

Instance: UC4-2-Practitioner-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "MessageHeader Verordnender an Apotheke (UC4 Zytostatika)"
Description: "Message Header für Bestätigung der Zytostatika-Rezepterstellung vom Verordnenden an Apotheke"
* insert Practitioner-to-Pharmacy(UC4-Response-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_ParenteraleZubereitung;Rezeptbestaetigung
* responsible = Reference(Example-Practitioner-Organization)