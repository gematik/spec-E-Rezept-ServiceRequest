//TODO: Ableiten von KIM Bundle??
Profile: GEM_ERP_PR_MEDREQ_Bundle
Parent: Bundle
Id: gem-erp-pr-medreq-bundle
Title: "GEM ERP PR MEDREQ Bundle"
Description: "Bundle that is used for MedicationRequests with KIM"
* insert Meta (GEM_ERP_PR_MEDREQ_Bundle)
* insert MetaProfile (GEM_ERP_PR_MEDREQ_Bundle)
* type = #message (exactly)
* timestamp 1..1
* entry 1..*
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #open
* entry contains
    MessageHeader 1..1 and
    PrescriptionServiceRequest 1..* and
    DispenseServiceRequest 0..* and
    MedicationRequest 0..* and
    DispenseInformation 0..* and
    Patient 1..1 and
    Practitioner 0..*
* entry[MessageHeader].resource only GEM_PR_ERP_MEDREQ_MessageHeader
* entry[PrescriptionServiceRequest].resource only GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest
* entry[DispenseServiceRequest].resource only GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
* entry[MedicationRequest].resource only GEM_PR_ERP_MEDREQ_MedicationRequest
* entry[DispenseInformation].resource only GEM_ERP_PR_MedicationDispense
* entry[Patient].resource only $KBV_PR_FOR_Patient
* entry[Practitioner].resource only $KBV_PR_FOR_Practitioner
