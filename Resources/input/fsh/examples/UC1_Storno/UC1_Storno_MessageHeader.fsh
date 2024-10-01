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

Instance: UC1-Practitioner-to-HealthCareService-MessageHeader-Storno
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader-Storno"
Description: "Cancellation Message Header from Practitioner to HealthCareService"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Prescription-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Rezeptanfrage_Storno
* source.name = "Practitioner-Source"
* source.software = "Practitioner-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@practitioner.email"
* source.endpoint = "http://practitioner.endpoint"
* responsible = Reference(Example-Practitioner-Organization)

Instance: UC1-HealthCareService-to-Pharmacy-MessageHeader-Storno
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Pharmacy-MessageHeader-Storno"
Description: "Cancellation Message Header from HealthCareService to Pharmacy"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Dispense-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Abgabeanfrage_Storno
* source.name = "HealthCare-Source"
* source.software = "HealthCare-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@healthcare.email"
* source.endpoint = "http://healthcare.endpoint"
* responsible = Reference(Example-HealthCareService-Organization)

Instance: UC1-Pharmacy-to-HealthCareService-MessageHeader-Storno
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader-Storno"
Description: "Cancellation Message Header from Pharmacy to HealthCareService"
* insert HealthCareService-to-Practitioner(UC1-Cancelled-Dispense-Request)
* eventCoding = ServiceIdentifierCS#eRezept_Rezeptanforderung;Abgabeanfrage_Storno
* source.name = "Pharmacy-Source"
* source.software = "Pharmacy-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@pharmacy.email"
* source.endpoint = "http://pharmacy.endpoint"
* responsible = Reference(Example-Pharmacy-Organization)


