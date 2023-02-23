
Instance: HealthCareService-to-Practitioner-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* focus[+] = Reference(ServiceRequest/UC1-Initial-Prescription-Request)
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* sender.identifier = Pflegeheim-Immergrün-Identifier
* sender.display = "Pflegeheim Immergrün"
* destination.receiver.identifier = Hans-Topp-Glücklich-Identifier
* destination.receiver.display = "Praxis Hans Topp-Glücklich"
* destination.endpoint = "klaus@test.de"
* source.endpoint = "http://test-pflegeheim.de"

Instance: Practitioner-to-HealthCareService-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to HealthCareService"
* focus[+] = Reference(ServiceRequest/UC1-Response-Prescription-Request)
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* sender.identifier = Hans-Topp-Glücklich-Identifier
* sender.display = "Praxis Hans Topp-Glücklich"
* source.endpoint = "http://test-practitioner.de"
* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* destination.endpoint = "http://test-pflegeheim.de"

Instance: HealthCareService-to-Pharmacy-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "HealthCareService-to-Pharmacy-MessageHeader"
Description: "Message Header from HealthCareService to Pharmacy"
* focus[+] = Reference(ServiceRequest/UC1-Initial-Dispense-Request)
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* sender.identifier = Pflegeheim-Immergrün-Identifier
* sender.display = "Pflegeheim Immergrün"
* source.endpoint = "http://test-pflegeheim.de"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke"
* destination.endpoint = "http://test-apotheke.de"

Instance: Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader"
Description: "Message Header from Pharmacy to HealthCareService"
* focus[+] = Reference(ServiceRequest/UC1-Initial-Prescription-Request)
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.endpoint = "http://test-apotheke.de"
* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* destination.endpoint = "http://test-pflegeheim.de"


Instance: Pharmacy-to-Practitioner-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Pharmacy-to-Practitioner-MessageHeader"
Description: "Message Header from Pharmacy to Practitioner"
* focus[+] = Reference(ServiceRequest/UC1-Initial-Prescription-Request)
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.endpoint = "http://test-apotheke.de"
* destination.receiver.identifier = Hans-Topp-Glücklich-Identifier
* destination.receiver.display = "Praxis Hans Topp-Glücklich"
* destination.endpoint = "klaus@test.de"

Instance: Practitioner-to-Pharmacy-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Practitioner-to-Pharmacy-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* focus[+] = Reference(ServiceRequest/UC1-Response-Prescription-Request)
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* sender.identifier = Hans-Topp-Glücklich-Identifier
* sender.display = "Praxis Hans Topp-Glücklich"
* source.endpoint = "http://test-practitioner.de"
* destination.receiver.identifier = Test-Apotheke-Identifier
* destination.receiver.display = "Test Apotheke"
* destination.endpoint = "http://test-apotheke.de"