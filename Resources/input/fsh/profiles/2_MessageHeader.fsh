Profile: GEM_PR_MEDREQ_MessageHeader
Parent: GEM_PR_KIM_MessageHeader
Id: GEM-PR-MEDREQ-MessageHeader
Title: "GEM PR MEDREQ MessageHeader"
Description: "Header for Messages Bundles used for Medication Request"
* insert Meta (GEM-PR-ERP-MEDREQ-MessageHeader)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-MessageHeader)

* focus only Reference(GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest or GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest)

Instance: Prescription-Request-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Prescription Request Message Header"
Description: "Message Header for a PrescriptionRequest"
* focus.reference = "Initial-Prescription-Request"
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* sender.identifier = Pflegeheim-Immergrün-Identifier
* sender.display = "Pflegeheim Immergrün"
* destination.receiver.identifier = Hans-Topp-Glücklich-Identifier
* destination.receiver.display = "Praxis Hans Topp-Glücklich"
* destination.endpoint = "klaus@test.de"
* source.endpoint = "http://test-pflegeheim.de"

Instance: Prescription-Response-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Prescription Response Message Header"
Description: "Message Header for a PrescriptionRequest"
* focus.reference = "Initial-Prescription-Request"
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* destination.receiver.identifier = Pflegeheim-Immergrün-Identifier
* destination.receiver.display = "Pflegeheim Immergrün"
* sender.identifier = Hans-Topp-Glücklich-Identifier
* sender.display = "Praxis Hans Topp-Glücklich"
* source.endpoint = "http://test-practitioner.de"
* destination.endpoint = "http://test-pflegeheim.de"