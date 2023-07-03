
RuleSet: HealthCareService-to-Practitioner(SR)
* meta.profile[atf-profile] = "https://gematik.de/fhir/atf/StructureDefinition/message-header-app-transport"
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Pflegeheim-Immergrün-Identifier
* sender.display = "Pflegeheim Immergrün"
* destination.receiver.identifier = Hans-Topp-Glücklich-Identifier
* destination.receiver.display = "Praxis Hans Topp-Glücklich"
* destination.endpoint = "klaus@test.de"
* source.name = "HealthCare-Source"
* source.software = "HealthCare-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@healthcare.email"
* source.endpoint = "http://healthcare.endpoint"

RuleSet: Practitioner-to-HealthCareService(SR)
* meta.profile[atf-profile] = "https://gematik.de/fhir/atf/StructureDefinition/message-header-app-transport"
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Hans-Topp-Glücklich-Identifier
* sender.display = "Praxis Hans Topp-Glücklich"
* source.name = "Practitioner-Source"
* source.software = "Practitioner-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@practitioner.email"
* source.endpoint = "http://practitioner.endpoint"
* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* destination.endpoint = "http://test-pflegeheim.de"

RuleSet: HealthCareService-to-Pharmacy(SR)
* meta.profile[atf-profile] = "https://gematik.de/fhir/atf/StructureDefinition/message-header-app-transport"
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Pflegeheim-Immergrün-Identifier
* sender.display = "Pflegeheim Immergrün"
* source.name = "HealthCare-Source"
* source.software = "HealthCare-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@healthcare.email"
* source.endpoint = "http://healthcare.endpoint"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke"
* destination.endpoint = "http://test-apotheke.de"

RuleSet: Pharmacy-to-HealthCareService(SR)
* meta.profile[atf-profile] = "https://gematik.de/fhir/atf/StructureDefinition/message-header-app-transport"
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.name = "Pharmacy-Source"
* source.software = "Pharmacy-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@pharmacy.email"
* source.endpoint = "http://pharmacy.endpoint"
* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* destination.endpoint = "http://test-pflegeheim.de"

RuleSet: Pharmacy-to-Practitioner(SR)
* meta.profile[atf-profile] = "https://gematik.de/fhir/atf/StructureDefinition/message-header-app-transport"
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.name = "Pharmacy-Source"
* source.software = "Pharmacy-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@pharmacy.email"
* source.endpoint = "http://pharmacy.endpoint"
* destination.receiver.identifier = Hans-Topp-Glücklich-Identifier
* destination.receiver.display = "Praxis Hans Topp-Glücklich"
* destination.endpoint = "klaus@test.de"

RuleSet: Practitioner-to-Pharmacy(SR)
* meta.profile[atf-profile] = "https://gematik.de/fhir/atf/StructureDefinition/message-header-app-transport"
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Hans-Topp-Glücklich-Identifier
* sender.display = "Praxis Hans Topp-Glücklich"
* source.name = "Practitioner-Source"
* source.software = "Practitioner-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@practitioner.email"
* source.endpoint = "http://practitioner.endpoint"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke"
* destination.endpoint = "http://test-apotheke.de"

RuleSet: Pharmacy1-to-Pharmacy2(SR)
* meta.profile[atf-profile] = "https://gematik.de/fhir/atf/StructureDefinition/message-header-app-transport"
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.name = "Pharmacy-Source"
* source.software = "Pharmacy-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@pharmacy.email"
* source.endpoint = "http://pharmacy.endpoint"
* destination.receiver.identifier = Test-Apotheke2-Identifier
* destination.receiver.display = "Test Apotheke 2"
* destination.endpoint = "http://test-apotheke-2.de"

RuleSet: Pharmacy2-to-Pharmacy1(SR)
* meta.profile[atf-profile] = "https://gematik.de/fhir/atf/StructureDefinition/message-header-app-transport"
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-request-header"
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke2-Identifier
* sender.display = "Test Apotheke 2"
* sender.display = "Test Apotheke"
* source.name = "Pharmacy-Source-2"
* source.software = "Pharmacy-Software-2"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@pharmacy-2.email"
* source.endpoint = "http://pharmacy-2.endpoint"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke-2"
* destination.endpoint = "http://test-apotheke-2.de"

/*
Instance: UC4-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-Practitioner-MessageHeader"
Description: "Message Header from Pharmacy to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-Initial-Prescription-Request)
*/
