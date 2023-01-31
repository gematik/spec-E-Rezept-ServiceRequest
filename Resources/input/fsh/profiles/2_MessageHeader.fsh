Profile: GEM_PR_MEDREQ_MessageHeader
Parent: GEM_PR_KIM_MessageHeader
Id: GEM-PR-MEDREQ-MessageHeader
Title: "GEM PR MEDREQ MessageHeader"
Description: "Header for Messages Bundles used for Medication Request"
* insert Meta (GEM-PR-ERP-MEDREQ-MessageHeader)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-MessageHeader)

* focus only Reference(GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest or GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest)

Instance: PrescriptionMessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Prescription Message Header"
Description: "Message Header for a PrescriptionRequest"
* focus.reference = "Initial-Prescription-Request"
* eventCoding = #eRezept;Rezeptanforderung;V1.0
* sender.reference = "Example-HealthCareService-Organization"
* destination.receiver.reference = "Example-Practitioner"
* destination.endpoint = "http://test-practitioner.de"
* source.endpoint = "http://test-pflegeheim.de"