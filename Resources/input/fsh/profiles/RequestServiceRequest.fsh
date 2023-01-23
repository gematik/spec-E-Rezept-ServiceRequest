Profile: GEM_PR_ERP_MEDREQ_Request_ServiceRequest
Parent: ServiceRequest
Id: GEM-PR-ERP-MEDREQ-Request-ServiceRequest
Title: "GEM PR ERP MEDREQ Request Service Request"
Description: "A communication resource for collecting information objects needed to request a medication"
* insert Meta (GEM-PR-ERP-MEDREQ-Request-ServiceRequest)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-Request-ServiceRequest)
* id 1..1

//VorgangsID
* requisition 1..1
//* requisition -> VorgangsID

//MedicationRequest
* basedOn 1..1
* basedOn only Reference(GEM_PR_ERP_MEDREQ_MedicationRequest)

//Patient
* subject 1..1
* subject only Reference(KBV_PR_FOR_Patient)

//Practitioner and DispensingOrganization
* performer 1..2
* performer only Reference($KBV_PR_FOR_Practitioner or GEM_PR_ERP_MEDREQ_DispensingOrganization)

//RequestingOrganization
* requester 1..1
* requester only Reference(GEM_PR_ERP_MEDREQ_RequestingOrganization)