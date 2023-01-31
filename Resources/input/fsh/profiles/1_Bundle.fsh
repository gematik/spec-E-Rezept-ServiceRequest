Profile: GEM_PR_MEDREQ_MessageBundle
Parent: GEM_PR_KIM_MessageBundle
Id: GEM-PR-MEDREQ-MessageBundle
Title: "GEM_PR_MEDREQ_MessageBundle"
Description: "Basic Bundle for communication of FHIR Ressources with KIM Messages"
* entry contains
    PrescriptionServiceRequest 0..* MS and
    DispenseServiceRequest 0..* MS and
    MedicationRequest 0..* MS and
    Medication 0..* MS and
    DispenseInformation 0..* MS and
    Patient 1..1 MS and
    Practitioner 0..* MS and
    DispensingOrganization 0..1 MS and
    InsuranceCoverage 0..1 MS
* entry[MessageHeader].resource only GEM_PR_KIM_MessageHeader
* entry[PrescriptionServiceRequest].resource only GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest
* entry[DispenseServiceRequest].resource only GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
* entry[MedicationRequest].resource only GEM_PR_ERP_MEDREQ_MedicationRequest or $KBV_PR_ERP_Prescription
* entry[Medication].resource only $KBV_PR_ERP_Medication_FreeText or $KBV_PR_ERP_Medication_Compounding or $KBV_PR_ERP_Medication_PZN or $KBV_PR_ERP_Medication_Ingredient
* entry[DispenseInformation].resource only GEM_ERP_PR_MedicationDispense
* entry[Patient].resource only $KBV_PR_FOR_Patient
* entry[Practitioner].resource only $KBV_PR_FOR_Practitioner
* entry[DispensingOrganization].resource only GEM_PR_ERP_MEDREQ_Organization
* entry[InsuranceCoverage].resource only $KBV_PR_FOR_Coverage

//TODO: Umfassende Bundle Examples Pflege->Arzt; Arzt->Pflege; Pflege -> Apotheke; Apotheke -> Pflege