Instance: INVALID-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #example
Title: "Invalider MessageHeader"
Description: "Dieses Beispiel ist invalide und dient nur der Sicherstellung der Validierung."
* insert HealthCareService-to-Practitioner(UC1-Initial-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;RezeptanfrageFalsch
* responsible = Reference(Example-HealthCareService-Organization)