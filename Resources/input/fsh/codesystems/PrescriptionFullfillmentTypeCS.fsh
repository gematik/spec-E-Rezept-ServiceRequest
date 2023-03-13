CodeSystem: GEM_CS_MEDREQ_Prescription_Fullfillment_Type
Id: GEM-CS-MEDREQ-Prescription-Fullfillment-Type
Title: "Zustelltyp der Rezeptanforderung (CS)"
Description: "Wird im Prescription_ServiceRequest genutzt um anzugeben wie mit dem Rezept weiter verfahren werden soll"
* insert MetaCodeSystem(GEM-CS-MEDREQ-Prescription-Fullfillment-Type)

* #issue-prescription "Ausstellung des Rezeptes"
* #return-to-requester "Ausstellung des Rezeptes und Übermittlung an die anfragende Organisation"
* #send-to-pharmacy "Weiterleiten des Rezeptes an die ausliefernde Apotheke"