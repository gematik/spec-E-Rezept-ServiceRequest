Profile: GEM_PR_MEDREQ_MessageHeader
Parent: GEM_PR_KIM_MessageHeader
Id: GEM-PR-MEDREQ-MessageHeader
Title: "GEM PR MEDREQ MessageHeader"
Description: "Header for Messages Bundles used for Medication Request"
* insert Meta (GEM-PR-MEDREQ-MessageHeader)
* insert MetaProfile (GEM-PR-MEDREQ-MessageHeader)

* focus only Reference(GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest or GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest)

Instance: HealthCareService-to-Practitioner-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "HealthCareService to Practitioner Message Header"
Description: "Message Header for a PrescriptionRequest"
* focus[+] = Reference(Initial-Prescription-Request)
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
Title: "Prescription Response Message Header"
Description: "Message Header for a PrescriptionRequest"
* focus[+] = Reference(Response-Prescription-Request)
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
Title: "HealthCareService to Pharmacy Message Header"
Description: "Message Header for a PrescriptionRequest"
* focus[+] = Reference(Initial-Dispense-Request)
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
Title: "HealthCareService to Pharmacy Message Header"
Description: "Message Header for a PrescriptionRequest"
* focus[+] = Reference(Initial-Prescription-Request)
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* sender.identifier = Test-Apotheke-Identifier
* sender.display = "Test Apotheke"
* source.endpoint = "http://test-apotheke.de"

* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* destination.endpoint = "http://test-pflegeheim.de"
