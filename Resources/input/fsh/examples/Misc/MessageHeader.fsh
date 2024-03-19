
RuleSet: HealthCareService-to-Practitioner(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Pflegeheim-Immergrün-Identifier
* sender.display = "Pflegeheim Immergrün"
* destination.receiver.identifier = Hans-Topp-Glücklich-Identifier
* destination.receiver.display = "Praxis Hans Topp-Glücklich"
* destination.endpoint = "mailto:practitioner@test.kim.de"
* source.name = "HealthCare-Source"
* source.software = "HealthCare-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@hcs.email"
* source.endpoint = "mailto:healthcare-service@test.kim.de"

//TODO: MessageHeader ändern .identifier = telematik-id und endpoint = kim-adresse

RuleSet: Practitioner-to-HealthCareService(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Hans-Topp-Glücklich-Identifier
* sender.display = "Praxis Hans Topp-Glücklich"
* source.name = "Practitioner-Source"
* source.software = "Practitioner-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@pvs.email"
* source.endpoint = "mailto:practitioner@test.kim.de"
* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* destination.endpoint = "mailto:healthcare-service@test.kim.de"

RuleSet: HealthCareService-to-Pharmacy(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Pflegeheim-Immergrün-Identifier
* sender.display = "Pflegeheim Immergrün"
* source.name = "HealthCare-Source"
* source.software = "HealthCare-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@hcs.email"
* source.endpoint = "mailto:healthcare-service@test.kim.de"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke"
* destination.endpoint = "mailto:pharmacy@test.kim.de"

RuleSet: Pharmacy-to-HealthCareService(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.name = "Pharmacy-Source"
* source.software = "Pharmacy-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@avs.email"
* source.endpoint = "mailto:pharmacy@test.kim.de"
* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* destination.endpoint = "mailto:healthcare-service@test.kim.de"

RuleSet: Pharmacy-to-Practitioner(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.name = "Pharmacy-Source"
* source.software = "Pharmacy-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@avs.email"
* source.endpoint = "mailto:pharmacy@test.kim.de"
* destination.receiver.identifier = Hans-Topp-Glücklich-Identifier
* destination.receiver.display = "Praxis Hans Topp-Glücklich"
* destination.endpoint = "mailto:practitioner@test.kim.de"

RuleSet: Practitioner-to-Pharmacy(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Hans-Topp-Glücklich-Identifier
* sender.display = "Praxis Hans Topp-Glücklich"
* source.name = "Practitioner-Source"
* source.software = "Practitioner-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@pvs.email"
* source.endpoint = "mailto:practitioner@test.kim.de"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke"
* destination.endpoint = "mailto:pharmacy@test.kim.dee"

RuleSet: Pharmacy1-to-Pharmacy2(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.name = "Pharmacy-Source"
* source.software = "Pharmacy-Software"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@avs.email"
* source.endpoint = "mailto:pharmacy@test.kim.de"
* destination.receiver.identifier = Test-Apotheke2-Identifier
* destination.receiver.display = "Test Apotheke 2"
* destination.endpoint = "mailto:pharamacy_2@test.kim.de"

RuleSet: Pharmacy2-to-Pharmacy1(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke2-Identifier
* sender.display = "Test Apotheke 2"
* sender.display = "Test Apotheke"
* source.name = "Pharmacy-Source-2"
* source.software = "Pharmacy-Software-2"
* source.version = "1.0.0"
* source.contact.system = #email
* source.contact.value = "info@avs_2.email"
* source.endpoint = "mailto:pharmacy_2@test.kim.de"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke-2"
* destination.endpoint = "mailto:pharmacy@test.kim.de"

/*
Instance: UC4-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-Practitioner-MessageHeader"
Description: "Message Header from Pharmacy to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-Initial-Prescription-Request)
*/
