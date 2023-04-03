Mapping: ServiceRequestPrescriptionRequest
Source: ServiceRequestPrescriptionRequest
Target: "gemF_eRp_KIM#3.1.1 Fachliche Information"
Id: prescription-request-mapping
Title: "Prescription Request Mapping"
Description: "Mapping für fachliche Informationseinheiten des Feature Dokuments"
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