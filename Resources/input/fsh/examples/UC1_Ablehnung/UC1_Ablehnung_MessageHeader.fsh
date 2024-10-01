Instance: UC1-HealthCareService-to-Practitioner-MessageHeader-Rejection
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader-Rejection"
Description: "Cancellation Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung
* source.name = "HealthCare-Source"
* source.software = "HealthCare-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@healthcare.email"
* source.endpoint = "http://healthcare.endpoint"
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC1-Practitioner-to-HealthCareService-MessageHeader-Rejection
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader-Rejection"
Description: "Cancellation Message Header from Practitioner to HealthCareService"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung
* source.name = "Practitioner-Source"
* source.software = "Practitioner-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@practitioner.email"
* source.endpoint = "http://practitioner.endpoint"
* responsible = Reference(Example-Practitioner-Organization)
