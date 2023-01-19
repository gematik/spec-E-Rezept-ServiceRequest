Profile: GEM_PR_ERP_MEDREQ_PrescribingOrganization
Parent: KBV_PR_Base_Organization
Id: GEM-PR-ERP-MEDREQ-PrescribingOrganization
Title: "GEM_PR_ERP_MEDREQ_Organization"
Description: ""
* insert Meta (GEM-PR-ERP-MEDREQ-PrescribingOrganization)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-PrescribingOrganization)
* type from RequestingOrganizationTypeVS


Profile: GEM_PR_ERP_MEDREQ_RequestingOrganization
Parent: KBV_PR_Base_Organization
Id: GEM-PR-ERP-MEDREQ-RequestingOrganization
Title: "GEM_PR_ERP_MEDREQ_Organization"
Description: ""
* insert Meta (GEM-PR-ERP-MEDREQ-RequestingOrganization)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-RequestingOrganization)
* type from RequestingOrganizationTypeVS

Profile: GEM_PR_ERP_MEDREQ_DispensingOrganization
Parent: KBV_PR_Base_Organization
Id: GEM-PR-ERP-MEDREQ-DispensingOrganization
Title: "GEM_PR_ERP_MEDREQ_Organization"
Description: ""
* insert Meta (GEM-PR-ERP-MEDREQ-DispensingOrganization)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-DispensingOrganization)
* type from RequestingOrganizationTypeVS




Instance: PrescribingOrganizationExample
InstanceOf: GEM_PR_ERP_MEDREQ_PrescribingOrganization
Usage: #inline
Title: "Prescribing Organization Example"
Description: "Example of a Organisation responsible for prescribing medication"
* id = "PrescribingOrganizationExample"
* MetaInstance(GEM_PR_ERP_MEDREQ_Organization)
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "10-42.423.00045678"
* name = "Gemeinschaftspraxis Waldorf und Statler"
* telecom.system = #email
* telecom.value = "arztpraxis@Kim-dienstleiseter.telematik"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Theatergasse 1"
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10247"

Instance: RequestingOrganizationExample
InstanceOf:  GEM_PR_ERP_MEDREQ_RequestingOrganization
Usage: #inline
Title: "Requesting Organization Example"
Description: "Example of a Organisation responsible for the request of the medication"
* id = "RequestingOrganizationExample"
* MetaInstance(GEM_PR_ERP_MEDREQ_Organization)
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "10-67.245.00001234"
* name = "Pflegeheim am Platz der Sonne"
* telecom.system = #email
* telecom.value = "pflegeheim@Kim-dienstleiseter.telematik"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Meinekestraße 61"
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10247"

Instance: DispensingOrganizationExample
InstanceOf: GEM_PR_ERP_MEDREQ_DispensingOrganization
Usage: #inline
Title: "DispensingOrganizationExample"
Description: "Example of a Organisation responsible for the request of the medication"
* id = "DispensingOrganizationExample"
* MetaInstance(GEM_PR_ERP_MEDREQ_Organization)
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "3-abc-1234567890"
* name = "Apotheke am Platz der Sonne"
* telecom.system = #email
* telecom.value = "apotheke@Kim-dienstleiseter.telematik"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Meinekestraße 63"
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10247"
