Instance: UC2-1-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC2-Initial-Prescription-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptanfrage
* source.name = "HealthCare-Source"
* source.software = "HealthCare-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@healthcare.email"
* source.endpoint = "http://healthcare.endpoint"

Instance: UC2-2-Practitioner-to-Pharmacy-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Practitioner-to-Pharmacy-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Practitioner-to-Pharmacy(UC2-Forward-Dispense-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Abgabeanfrage
* source.name = "Practitioner-Source"
* source.software = "Practitioner-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@practitioner.email"
* source.endpoint = "http://practitioner.endpoint"

Instance: UC2-3-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Pharmacy-to-HealthCareService(UC2-Response-Dispense-Request)
* eventCoding = $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Abgabebestaetigung
* source.name = "Pharmacy-Source"
* source.software = "Pharmacy-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@pharmacy.email"
* source.endpoint = "http://pharmacy.endpoint"