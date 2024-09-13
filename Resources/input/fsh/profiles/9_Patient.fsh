Profile: ERPServiceRequestPatient
Parent: KBV_PR_Base_Patient
Id: erp-service-request-patient
Title: "ERP Service Request Patient"
Description: "Patient that can be used for the UseCase ServiceRequest"
* insert Meta (erp-service-request-patient)

* identifier 1..1 MS
* identifier[versichertenId_GKV] 1..1 MS

* birthDate MS

* name MS
* name[name] 1..1 MS