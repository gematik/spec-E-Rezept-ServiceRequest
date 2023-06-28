ValueSet: RequestReasonVS
Id: request-reason-vs
Title: "Reason for the medication request (VS)"
Description: "Provides codes for reasons why medication is requested"
* insert MetaValueSet(request-reason-vs)
* include codes from system MedicationRequestReasonCS
* include codes from system CancellationReasonCS

ValueSet: MedicationObservationVS
Id: medication-observation-vs
Title: "Information on medication observation (VS)"
Description: "Specifies types of observations on the status of a drug"
* insert MetaValueSet(medication-observation-vs)
* include codes from system MedicationObservationCS