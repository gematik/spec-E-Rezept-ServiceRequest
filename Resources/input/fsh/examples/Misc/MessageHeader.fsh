
RuleSet: HealthCareService-to-Practitioner(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Pflegeheim-Immergrün-Identifier
* sender.display = "Pflegeheim Immergrün"
* destination.receiver.identifier = Hans-Topp-Glücklich-Identifier
* destination.receiver.display = "Praxis Hans Topp-Glücklich"
* destination.endpoint = "klaus@test.de"
* source.endpoint = "http://test-pflegeheim.de"

RuleSet: Practitioner-to-HealthCareService(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Hans-Topp-Glücklich-Identifier
* sender.display = "Praxis Hans Topp-Glücklich"
* source.endpoint = "http://test-practitioner.de"
* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* destination.endpoint = "http://test-pflegeheim.de"

RuleSet: HealthCareService-to-Pharmacy(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Pflegeheim-Immergrün-Identifier
* sender.display = "Pflegeheim Immergrün"
* source.endpoint = "http://test-pflegeheim.de"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke"
* destination.endpoint = "http://test-apotheke.de"

RuleSet: Pharmacy-to-HealthCareService(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.endpoint = "http://test-apotheke.de"
* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* destination.endpoint = "http://test-pflegeheim.de"

RuleSet: Pharmacy-to-Practitioner(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.endpoint = "http://test-apotheke.de"
* destination.receiver.identifier = Hans-Topp-Glücklich-Identifier
* destination.receiver.display = "Praxis Hans Topp-Glücklich"
* destination.endpoint = "klaus@test.de"

RuleSet: Practitioner-to-Pharmacy(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Hans-Topp-Glücklich-Identifier
* sender.display = "Praxis Hans Topp-Glücklich"
* source.endpoint = "http://test-practitioner.de"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke"
* destination.endpoint = "http://test-apotheke.de"

RuleSet: Pharmacy1-to-Pharmacy2(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.endpoint = "http://test-apotheke.de"
* destination.receiver.identifier = Test-Apotheke2-Identifier
* destination.receiver.display = "Test Apotheke 2"
* destination.endpoint = "http://test-apotheke-2.de"

RuleSet: Pharmacy2-to-Pharmacy1(SR)
* focus[+] = Reference(ServiceRequest/{SR})
* sender.identifier = Test-Apotheke2-Identifier
* sender.display = "Test Apotheke 2"
* source.endpoint = "http://test-apotheke-2.de"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke"
* destination.endpoint = "http://test-apotheke.de"

/*
Instance: UC4-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: ERPServiceRequestRequestHeader
Usage: #inline
Title: "Pharmacy-to-Practitioner-MessageHeader"
Description: "Message Header from Pharmacy to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-Initial-Prescription-Request)
*/
