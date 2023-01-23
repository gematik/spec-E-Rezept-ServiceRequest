Profile: GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
Parent: ServiceRequest
Id: GEM-PR-ERP-MEDREQ-Dispense-ServiceRequest
Title: "GEM PR ERP MEDREQ Dispense Service Request"
Description: "Communication resource for sending dispenseInformation about a medication requisition."
* insert Meta (GEM-PR-ERP-MEDREQ-Dispense-ServiceRequest)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-Dispense-ServiceRequest)
* id 1..1
* basedOn 1..1
* basedOn only Reference(KBV_PR_ERP_Prescription)
//VorgangsID
* requisition 1..1
//* requisition -> VorgangsID

//Patient
* subject 1..1
* subject only Reference(KBV_PR_FOR_Patient)

//Practitioner and PrescribingOrganization and DispensingOrganization
* performer 3..3
* performer only Reference($KBV_PR_FOR_Practitioner or GEM_PR_ERP_MEDREQ_PrescribingOrganization or GEM_PR_ERP_MEDREQ_DispensingOrganization)

* requester 1..1
* requester only Reference(GEM_PR_ERP_MEDREQ_RequestingOrganization)