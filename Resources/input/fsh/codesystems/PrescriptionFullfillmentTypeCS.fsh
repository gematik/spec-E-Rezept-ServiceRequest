CodeSystem: PrescriptionFullfillmentTypeCS
Id: prescription-fullfillment-type-cs
Title: "Zustelltyp der Rezeptanforderung (CS)"
Description: "Wird im Prescription_ServiceRequest genutzt um anzugeben wie mit dem Rezept weiter verfahren werden soll"
* insert MetaCodeSystem(prescription-fullfillment-type-cs)

* #issue-prescription "Ausstellung des Rezeptes"
* #return-to-requester "Ausstellung des Rezeptes und Übermittlung an die anfragende Organisation"
* #send-to-pharmacy "Weiterleiten des Rezeptes an die ausliefernde Apotheke"
