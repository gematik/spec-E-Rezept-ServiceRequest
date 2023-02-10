Profile: GEM_PR_MEDREQ_Abgabeinformationen
Parent: MedicationDispense
Id: GEM-PR-MEDREQ-Abgabeinformationen
Title: "GEM_PR_MEDREQ_Abgabeinformationen"
Description: "Abgabeinformationen der Apotheke"
* insert Meta (GEM-PR-MEDREQ-Abgabeinformationen)


* performer.actor only Reference($KBV_PR_FOR_Organization)
* authorizingPrescription.identifier only GEM_ERP_PR_PrescriptionId
* authorizingPrescription.reference 0..0

//TODO: das muss noch eingebaut werden wirft derzeit aber Fehler
//* substitution.extension contains $DAV-EX-ERP-Rezeptaenderung named Rezeptaenderung 2..*

Instance: Example-Abgabeinformationen
InstanceOf: GEM_PR_MEDREQ_Abgabeinformationen
Usage: #inline
* status = #completed
* authorizingPrescription.identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* authorizingPrescription.identifier.value = "160.100.000.000.002.36"
* medicationCodeableConcept = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* performer.actor = Reference(Example-Apotheke)
* whenHandedOver = "2020-02-04"