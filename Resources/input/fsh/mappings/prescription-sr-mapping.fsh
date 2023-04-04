Mapping: ServiceRequestPrescriptionRequest
Source: ServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1 Fachliche Information"
Id: prescription-request-mapping
Title: "Prescription Request Mapping (Rezeptanforderung)"
Description: "Mapping für fachliche Informationseinheiten der Verordnungsanfrage des Feature Dokuments"
* -> "ServiceRequest"
* requisition -> "Vorgangs_ID"
* priority -> "Prioritaet"
* performer -> "Adressat_der_Rezeptanforderung"
* requester -> "Adressat_der_Rezeptuebermittlung"
* subject -> "Pateiteninformationen"
* basedOn -> "Praeparat"
* reasonCode -> "Bedarfsbegruendung (Code)"
* reasonReference -> "Bedarfsbegruendung (Observation)"
* reasonReference -> "Restreichweite"
* note -> "Freitext"

Mapping: ServiceRequestPrescriptionRequestStorno
Source: ServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1 Fachliche Information"
Id: prescription-request-mapping-storno
Title: "Prescription Request Mapping (Rezeptanforderung_Storno)"
Description: "Mapping für fachliche Informationseinheiten des Stornos einer Verordnungsanfrage des Feature Dokuments"
* -> "ServiceRequest"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Begründung der Stornierung"

Mapping: ServiceRequestPrescriptionRequestReject
Source: ServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1 Fachliche Information"
Id: prescription-request-mapping-reject
Title: "Prescription Request Mapping (Rezeptanforderung_Ablehnung)"
Description: "Mapping für fachliche Informationseinheiten der Ablehnung einer Verordnungsanfrage des Feature Dokuments"
* -> "ServiceRequest"
* requisition -> "Vorgangs_ID"
* reasonCode -> "Ablehnungsgrund"
* note -> "Freitext"