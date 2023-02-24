Instance: UC2-1-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC2-Initial-Prescription-Request)

Instance: UC2-2-Practitioner-to-Pharmacy-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Practitioner-to-Pharmacy-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Practitioner-to-Pharmacy(UC2-Forward-Dispense-Request)

Instance: UC2-3-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Pharmacy-to-HealthCareService(UC2-Response-Dispense-Request)