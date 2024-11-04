Instance: UC1-HealthCareService-to-Practitioner-MessageHeader-Storno
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader-Storno"
Description: "Cancellation Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage_Storno
* source.name = "HealthCare-Source"
* source.software = "HealthCare-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@healthcare.email"
* source.endpoint = "http://healthcare.endpoint"
* responsible = Reference(Example-HealthCareService-Organization)