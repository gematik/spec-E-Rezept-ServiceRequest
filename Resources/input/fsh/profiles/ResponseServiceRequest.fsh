Profile: GEM_PR_ERP_MEDREQ_Response_ServiceRequest
Parent: ServiceRequest
Id: GEM-PR-ERP-MEDREQ-Response-ServiceRequest
Title: "GEM PR ERP MEDREQ Request Service Request"
Description: "A communication resource for collecting information objects needed for responding to a medication request"
* insert Meta (GEM-PR-ERP-MEDREQ-Response-ServiceRequest)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-Response-ServiceRequest)
* id 1..1
//VorgangsID
* requisition 1..1
//* requisition -> VorgangsID

//Prescription
* basedOn 1..1
* basedOn only Reference(KBV_PR_ERP_Prescription)

//Patient
* subject 1..1
* subject only Reference(KBV_PR_FOR_Patient)

//Practitioner and PrescribingOrganization and DispensingOrganization
* performer 2..3
* performer only Reference($KBV_PR_FOR_Practitioner or GEM_PR_ERP_MEDREQ_PrescribingOrganization or GEM_PR_ERP_MEDREQ_DispensingOrganization)

//RequestingOrganization
* requester 1..1
* requester only Reference(GEM_PR_ERP_MEDREQ_RequestingOrganization)

//AccessCodeEX and PrescriptionIdEX
//* supportingInfo   -> AccessCodeEX and PrescriptionIdEX