Instance: UC4-1-Pharmacy-to-Practitioner-MessageHeader
InstanceOf: MessageHeaderRequestHeader
Usage: #inline
Title: "TODO"
Description: "TODO"
* insert Pharmacy-to-Practitioner(UC4-Initial-Prescription-Request)
* eventCoding = $GEM_CS_KIM_Dienstkennung#eRezept_ParenteraleErnaehrung

Instance: UC4-2-Practitioner-to-Pharmacy-MessageHeader
InstanceOf: MessageHeaderRequestHeader
Usage: #inline
Title: "Practitioner-to-Pharmacy-MessageHeader"
Description: "Message Header from Practitioner to Pharmacy"
* insert Practitioner-to-Pharmacy(UC4-Response-Prescription-Request)
* eventCoding = $GEM_CS_KIM_Dienstkennung#eRezept_ParenteraleErnaehrung