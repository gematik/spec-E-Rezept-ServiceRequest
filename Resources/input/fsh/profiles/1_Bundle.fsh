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
    Rezeptanforderung 0..1 MS and
    Belieferungsanforderung 0..1 MS and
    VerordnungAnfrage 0..1 MS and
    VerordnungArzneimittel 0..1 MS and
    RezeptierdatenFreitextverordnung 0..1 MS and
    RezeptierdatenRezepturverordnung 0..1 MS and
    RezeptierdatenPZNVerordnung 0..1 MS and
    RezeptierdatenWirkstoffverordnung 0..1 MS and
    AbgabeInformationen 0..1 MS and
    Patient 1..1 MS and
    Practitioner 0..* MS and
    Organization 0..* MS and
    Krankenversicherungsverhaeltnis 0..1
* entry[MessageHeader].resource only GEM_PR_MEDREQ_MessageHeader
* entry[MessageHeader].resource 1..1
* entry[MessageHeader].fullUrl 1..1
* entry[MessageHeader].link 0..0
* entry[MessageHeader].search 0..0
* entry[MessageHeader].request 0..0
* entry[MessageHeader].response 0..0
* entry[Rezeptanforderung].resource only GEM_PR_ERP_MEDREQ_Prescription_ServiceRequest
* entry[Rezeptanforderung].resource 1..1
* entry[Rezeptanforderung].fullUrl 1..1
* entry[Rezeptanforderung].link 0..0
* entry[Rezeptanforderung].search 0..0
* entry[Rezeptanforderung].request 0..0
* entry[Rezeptanforderung].response 0..0
* entry[Belieferungsanforderung].resource only GEM_PR_ERP_MEDREQ_Dispense_ServiceRequest
* entry[Belieferungsanforderung].resource 1..1
* entry[Belieferungsanforderung].fullUrl 1..1
* entry[Belieferungsanforderung].link 0..0
* entry[Belieferungsanforderung].search 0..0
* entry[Belieferungsanforderung].request 0..0
* entry[Belieferungsanforderung].response 0..0
* entry[VerordnungAnfrage].resource only GEM_PR_ERP_MEDREQ_MedicationRequest
* entry[VerordnungAnfrage].resource 1..1
* entry[VerordnungAnfrage].fullUrl 1..1
* entry[VerordnungAnfrage].link 0..0
* entry[VerordnungAnfrage].search 0..0
* entry[VerordnungAnfrage].request 0..0
* entry[VerordnungAnfrage].response 0..0
* entry[VerordnungArzneimittel].resource only $KBV_PR_ERP_Prescription
* entry[VerordnungArzneimittel].resource 1..1
* entry[VerordnungArzneimittel].fullUrl 1..1
* entry[VerordnungArzneimittel].link 0..0
* entry[VerordnungArzneimittel].search 0..0
* entry[VerordnungArzneimittel].request 0..0
* entry[VerordnungArzneimittel].response 0..0
* entry[RezeptierdatenFreitextverordnung].resource only $KBV_PR_ERP_Medication_FreeText
* entry[RezeptierdatenFreitextverordnung].resource 1..1
* entry[RezeptierdatenFreitextverordnung].fullUrl 1..1
* entry[RezeptierdatenFreitextverordnung].link 0..0
* entry[RezeptierdatenFreitextverordnung].search 0..0
* entry[RezeptierdatenFreitextverordnung].request 0..0
* entry[RezeptierdatenFreitextverordnung].response 0..0
* entry[RezeptierdatenRezepturverordnung].resource only $KBV_PR_ERP_Medication_Compounding
* entry[RezeptierdatenRezepturverordnung].resource 1..1
* entry[RezeptierdatenRezepturverordnung].fullUrl 1..1
* entry[RezeptierdatenRezepturverordnung].link 0..0
* entry[RezeptierdatenRezepturverordnung].search 0..0
* entry[RezeptierdatenRezepturverordnung].request 0..0
* entry[RezeptierdatenRezepturverordnung].response 0..0
* entry[RezeptierdatenPZNVerordnung].resource only $KBV_PR_ERP_Medication_PZN
* entry[RezeptierdatenPZNVerordnung].resource 1..1
* entry[RezeptierdatenPZNVerordnung].fullUrl 1..1
* entry[RezeptierdatenPZNVerordnung].link 0..0
* entry[RezeptierdatenPZNVerordnung].search 0..0
* entry[RezeptierdatenPZNVerordnung].request 0..0
* entry[RezeptierdatenPZNVerordnung].response 0..0
* entry[RezeptierdatenWirkstoffverordnung].resource only $KBV_PR_ERP_Medication_Ingredient
* entry[RezeptierdatenWirkstoffverordnung].resource 1..1
* entry[RezeptierdatenWirkstoffverordnung].fullUrl 1..1
* entry[RezeptierdatenWirkstoffverordnung].link 0..0
* entry[RezeptierdatenWirkstoffverordnung].search 0..0
* entry[RezeptierdatenWirkstoffverordnung].request 0..0
* entry[RezeptierdatenWirkstoffverordnung].response 0..0
* entry[AbgabeInformationen].resource only GEM_PR_MEDREQ_Abgabeinformationen
* entry[AbgabeInformationen].resource 1..1
* entry[AbgabeInformationen].fullUrl 1..1
* entry[AbgabeInformationen].link 0..0
* entry[AbgabeInformationen].search 0..0
* entry[AbgabeInformationen].request 0..0
* entry[AbgabeInformationen].response 0..0
* entry[Patient].resource only $KBV_PR_FOR_Patient
* entry[Patient].resource 1..1
* entry[Patient].fullUrl 1..1
* entry[Patient].link 0..0
* entry[Patient].search 0..0
* entry[Patient].request 0..0
* entry[Patient].response 0..0
* entry[Practitioner].resource only $KBV_PR_FOR_Practitioner
* entry[Practitioner].resource 1..1
* entry[Practitioner].fullUrl 1..1
* entry[Practitioner].link 0..0
* entry[Practitioner].search 0..0
* entry[Practitioner].request 0..0
* entry[Practitioner].response 0..0
* entry[Organization].resource only $KBV_PR_FOR_Organization
* entry[Organization].resource 1..1
* entry[Organization].fullUrl 1..1
* entry[Organization].link 0..0
* entry[Organization].search 0..0
* entry[Organization].request 0..0
* entry[Organization].response 0..0
* entry[Krankenversicherungsverhaeltnis].resource only $KBV_PR_FOR_Coverage
* entry[Krankenversicherungsverhaeltnis].resource 1..1
* entry[Krankenversicherungsverhaeltnis].fullUrl 1..1
* entry[Krankenversicherungsverhaeltnis].link 0..0
* entry[Krankenversicherungsverhaeltnis].search 0..0
* entry[Krankenversicherungsverhaeltnis].request 0..0
* entry[Krankenversicherungsverhaeltnis].response 0..0


Invariant: resolve-references-in-bundle
Description: "Alle Referenzen innerhalb eines Bundles müssen aufgelöst werden können"
Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not()).all((%resource.entry.fullUrl.join('|') + '|').contains($this + '|'))"
Severity: #error


//TODO: Umfassende Bundle Examples Pflege->Arzt; Arzt->Pflege; Pflege -> Apotheke; Apotheke -> Pflege

Instance: PrescriptionRequestToPrescriber
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
* entry[Patient].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[Patient].resource = Example-Patient
* entry[Organization].fullUrl = "http://medreq-test.de/Organization/Example-HealthCareService-Organization"
* entry[Organization].resource = Example-HealthCareService-Organization

Instance: FullfilledPrescriptionRequest
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "Fullfilled Prescription Request"
Description: "Response sent from Practitioner back to HealthCareService"
* identifier.value = "urn:uuid:29888885-6639-481c-934e-4b7b51745084"
* timestamp.value = "2023-01-30T13:28:17.239+02:00"
* entry[MessageHeader].fullUrl = "http://medreq-test.de/MessageHeader/Practitioner-to-HealthCareService-MessageHeader"
* entry[MessageHeader].resource = Practitioner-to-HealthCareService-MessageHeader
* entry[Rezeptanforderung].fullUrl = "http://medreq-test.de/ServiceRequest/Response-Prescription-Request"
* entry[Rezeptanforderung].resource = Response-Prescription-Request
* entry[VerordnungArzneimittel].fullUrl = "http://medreq-test.de/MedicationRequest/Example-Response-KBV-Prescription"
* entry[VerordnungArzneimittel].resource = Example-Response-KBV-Prescription
* entry[RezeptierdatenPZNVerordnung].fullUrl = "http://medreq-test.de/Medication/Example-Response-Medication"
* entry[RezeptierdatenPZNVerordnung].resource = Example-Response-Medication
* entry[Practitioner].fullUrl = "http://medreq-test.de/Practitioner/Example-Practitioner"
* entry[Practitioner].resource = Example-Practitioner
* entry[Patient].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[Patient].resource = Example-Patient
* entry[Organization].fullUrl = "http://medreq-test.de/Organization/Example-HealthCareService-Organization"
* entry[Organization].resource = Example-HealthCareService-Organization

Instance: DispenseRequestToPharmacy
InstanceOf: GEM_PR_MEDREQ_MessageBundle
Usage: #example
Title: "DispenseRequestToPharmacy"
Description: "Request sent to Pharmacy to request a dispense of the medication"
* identifier.value = "urn:uuid:c80f6c55-92f8-4518-ba66-cb193da09336"
* timestamp.value = "2023-02-01T13:28:17.239+02:00"
* entry[MessageHeader].fullUrl = "http://medreq-test.de/MessageHeader/HealthCareService-to-Pharmacy-MessageHeader"
* entry[MessageHeader].resource = HealthCareService-to-Pharmacy-MessageHeader
* entry[Belieferungsanforderung].fullUrl = "http://medreq-test.de/ServiceRequest/Response-Prescription-Request"
* entry[Belieferungsanforderung].resource = Initial-Dispense-Request
* entry[Patient].fullUrl = "http://medreq-test.de/Patient/Example-Patient"
* entry[Patient].resource = Example-Patient