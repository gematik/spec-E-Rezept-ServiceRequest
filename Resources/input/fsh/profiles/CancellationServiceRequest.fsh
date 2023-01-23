Profile: GEM_PR_ERP_MEDREQ_Cancellation_ServiceRequest
Parent: ServiceRequest
Id: GEM-PR-ERP-MEDREQ-Cancellation-ServiceRequest
Title: "GEM PR ERP MEDREQ Cancellation Service Request"
Description: "Resource for cancellation message of a medication Request"
* insert Meta (GEM-PR-ERP-MEDREQ-Cancellation-ServiceRequest)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-Request-ServiceRequest)
* id 1..1
//VorgangsID
* requisition 1..1
//* requisition -> VorgangsID

//IdentifierForCancelation
* basedOn 1..1
* basedOn only Reference(GEM_PR_ERP_MEDREQ_MedicationRequest)

//PatientID
* subject 1..1
* subject only Reference(KBV_PR_FOR_Patient)

//CancelationReasonType
//* reasonCode -> CancelationReasonType

//FreeText
//* note -> FreeText