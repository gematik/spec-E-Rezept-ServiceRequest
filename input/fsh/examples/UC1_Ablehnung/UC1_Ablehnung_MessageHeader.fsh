Instance: UC1-Practitioner-to-HealthCareService-MessageHeader-Rejection
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader-Rejection"
Description: "Ablehnungs-Message Header von Leistungserbringer an Pflegedienst"
* insert HealthCareService-to-Practitioner(UC1-Rejection-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung
* source.name = "Practitioner-Source"
* source.software = "Practitioner-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@practitioner.email"
* source.endpoint = "http://practitioner.endpoint"
* responsible = Reference(Example-Practitioner-Organization)

