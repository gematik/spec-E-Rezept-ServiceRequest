Instance: UC1-HealthCareService-to-Practitioner-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "HealthCareService-to-Practitioner-MessageHeader"
Description: "Message Header from HealthCareService to Practitioner"
* insert HealthCareService-to-Practitioner(UC1-Initial-Prescription-Request)

Instance: UC1-Practitioner-to-HealthCareService-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Practitioner-to-HealthCareService-MessageHeader"
Description: "Message Header from Practitioner to HealthCareService"
* insert HealthCareService-to-Practitioner(UC1-Response-Prescription-Request)

Instance: UC1-HealthCareService-to-Pharmacy-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "HealthCareService-to-Pharmacy-MessageHeader"
Description: "Message Header from HealthCareService to Pharmacy"
* insert HealthCareService-to-Practitioner(UC1-Initial-Dispense-Request)

Instance: UC1-Pharmacy-to-HealthCareService-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader"
Description: "Message Header from Pharmacy to HealthCareService"
* insert HealthCareService-to-Practitioner(UC1-Response-Dispense-Request)


