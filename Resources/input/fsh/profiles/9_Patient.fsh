Profile: ERPServiceRequestPatient
Parent: KBV_PR_Base_Patient
Id: erp-service-request-patient
Title: "ERP Service Request Patient"
Description: "Patient that can be used for the UseCase ServiceRequest"
* insert Meta (erp-service-request-patient)

* identifier 1..1 MS
* identifier[versichertenId_GKV] 0..1 MS
* identifier[versichertennummer_pkv] 0..1 MS
* identifier[pid] 0..0
* identifier[reisepassnummer] 0..0
* identifier[versichertennummer_kvk] 0..0

* birthDate MS

* name MS
* name[name] 1..1 MS