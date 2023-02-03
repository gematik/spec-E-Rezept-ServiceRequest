Profile: GEM_PR_MEDREQ_MessageBundle
Parent: GEM_PR_KIM_MessageBundle
Id: GEM-PR-MEDREQ-MessageBundle
Title: "GEM_PR_MEDREQ_MessageBundle"
Description: "Basic Bundle for communication of FHIR Ressources with KIM Messages"
//TODO: Müssen die namentlich genannt werden? Oder einfach nur open entries? Was ist best practice?
* insert Meta (GEM-PR-MEDREQ-MessageBundle)
* insert MetaProfile (GEM-PR-MEDREQ-MessageBundle)

//* entry obeys resolve-references-in-bundle
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #open
* entry contains
    Rezeptanforderung 0..* MS and
    Belieferungsanforderung 0..* MS and
    VerordnungAnfrage 0..* MS and
    VerordnungArzneimittel 0..* MS and
    RezeptierdatenFreitextverordnung 0..* MS and
    RezeptierdatenRezepturverordnung 0..* MS and
    RezeptierdatenPZNVerordnung 0..* MS and
    RezeptierdatenWirkstoffverordnung 0..* MS and
    //DispenseInformation 0..* MS and
    Patient 1..1 MS and
    Practitioner 0..* MS and
    Organization 0..* MS and
    Krankenversicherungsverhaeltnis 0..1
* entry[MessageHeader].resource only GEM_PR_MEDREQ_MessageHeader
* entry[Rezeptanforderung].resource only GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest
* entry[Belieferungsanforderung].resource only GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
* entry[VerordnungAnfrage].resource only GEM_PR_ERP_MEDREQ_MedicationRequest
* entry[VerordnungArzneimittel].resource only $KBV_PR_ERP_Prescription
* entry[RezeptierdatenFreitextverordnung].resource only $KBV_PR_ERP_Medication_FreeText
* entry[RezeptierdatenRezepturverordnung].resource only $KBV_PR_ERP_Medication_Compounding
* entry[RezeptierdatenPZNVerordnung].resource only $KBV_PR_ERP_Medication_PZN
* entry[RezeptierdatenWirkstoffverordnung].resource only $KBV_PR_ERP_Medication_Ingredient
//TODO: * entry[AbgabeInformationen].resource only GEM_ERP_PR_MedicationDispense
* entry[Patient].resource only $KBV_PR_FOR_Patient
* entry[Practitioner].resource only $KBV_PR_FOR_Practitioner
* entry[Organization].resource only $KBV_PR_FOR_Organization
* entry[Krankenversicherungsverhaeltnis].resource only $KBV_PR_FOR_Coverage


Invariant: resolve-references-in-bundle
Description: "Alle Referenzen innerhalb eines Bundles müssen aufgelöst werden können"
Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not()).all((%resource.entry.fullUrl.join('|') + '|').contains($this + '|'))"
Severity: #error


//TODO: Umfassende Bundle Examples Pflege->Arzt; Arzt->Pflege; Pflege -> Apotheke; Apotheke -> Pflege

Instance: MedicationRequestToPrescriber
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "Medication Request To Prescriber"
Description: "Request sent to Prescriber to get a Prescription"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2015-02-07T13:28:17.239+02:00"
* entry[MessageHeader].fullUrl = "http://medreq-test.de/MessageHeader/Prescription-Request-MessageHeader"
* entry[MessageHeader].resource = HealthCareService-to-Practitioner-MessageHeader
* entry[Rezeptanforderung].fullUrl = "http://medreq-test.de/ServiceRequest/Initial-Prescription-Request"
* entry[Rezeptanforderung].resource = Initial-Prescription-Request
* entry[VerordnungAnfrage].fullUrl = "http://medreq-test.de/MedicationRequest/Example-Initial-Medication-Request"
* entry[VerordnungAnfrage].resource = Example-Initial-Medication-Request
* entry[RezeptierdatenPZNVerordnung].fullUrl = "http://medreq-test.de/Medication/Example-Initial-Medication"
* entry[RezeptierdatenPZNVerordnung].resource = Example-Initial-Medication
* entry[Practitioner].fullUrl = "http://medreq-test.de/Practitioner/Example-Practitioner"
* entry[Practitioner].resource = Example-Practitioner
* entry[Patient].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[Patient].resource = Example-Patient
* entry[Organization].fullUrl = "http://medreq-test.de/Organization/Example-HealthCareService-Organization"
* entry[Organization].resource = Example-HealthCareService-Organization