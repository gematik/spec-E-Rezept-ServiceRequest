ValueSet: RequestReasonVS
Id: request-reason-vs
Title: "Grund der Medikamentenanfrage (VS)"
Description: "Liefert Codes für Gründe, warum Medikation angefragt wird"
* insert MetaValueSet(request-reason-vs)
* include codes from system GEM_CS_MEDREQ_MedicationRequest_Reason
* include codes from system GEM_CS_MEDREQ_Cancellation_Reason_Type

ValueSet: MedicationObservationVS
Id: medication-observation-vs
Title: "Angabe zur Medikamentenbeobachtung (VS)"
Description: "Gibt Arten der Beobachtungen zum Status eines Medikaments an"
* insert MetaValueSet(medication-observation-vs)
* include codes from system GEM_CS_MEDREQ_MedicationObservation