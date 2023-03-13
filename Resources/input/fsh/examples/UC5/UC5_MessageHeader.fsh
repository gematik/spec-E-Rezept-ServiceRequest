Instance: UC5-Pharmacy1-to-Pharmacy2-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "HealthCareService-to-Pharmacy-MessageHeader"
Description: "Message Header from HealthCareService to Pharmacy"
* insert Pharmacy1-to-Pharmacy2(UC5-Initial-Dispense-Request)
* eventCoding = $GEM_CS_KIM_Dienstkennung#eRezept_Rezeptanforderung

Instance: UC5-Pharmacy2-to-Pharmacy1-MessageHeader
InstanceOf: GEM_PR_MEDREQ_MessageHeader
Usage: #inline
Title: "Pharmacy-to-HealthCareService-MessageHeader"
Description: "Message Header from Pharmacy to HealthCareService"
* insert Pharmacy2-to-Pharmacy1(UC5-Response-Dispense-Request)
* eventCoding = $GEM_CS_KIM_Dienstkennung#eRezept_Rezeptanforderung


