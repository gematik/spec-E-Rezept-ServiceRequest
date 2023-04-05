ValueSet: ClearingReasonVS
Id: clearing-reason-vs
Title: "Grund des Klärfalls"
Description: "Auswahl an Codes um anzugeben welchen Status ein ServiceRequest hat"
* insert MetaValueSet (clearing-reason-vs)
* include codes from system CancellationReasonCS
* exclude CancellationReasonCS#medication-stopped
* exclude CancellationReasonCS#medication-paused
* exclude CancellationReasonCS#medication-altered-dosage
* exclude CancellationReasonCS#medication-occurrence-implausible
* exclude CancellationReasonCS#successor-already-sent