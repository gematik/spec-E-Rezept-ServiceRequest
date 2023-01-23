Profile: GEM_PR_ERP_MEDREQ_CancellationHeader
Parent: MessageHeader
Id: GEM-PR-ERP-MEDREQ-CancellationHeader
Title: "GEM PR ERP MEDREQ CancellationHeader"
Description: "Header for cancellation message of a medication Request"
* insert Meta (GEM-PR-ERP-MEDREQ-CancellationHeader)
* insert MetaProfile (GEM-PR-ERP-MEDREQ-CancellationHeader)
* obeys freetextorreasontype

* event[x] only Coding
* event[x] from MessageEventTypeVS

* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization or GEM_PR_ERP_MEDREQ_RequestingOrganization or GEM_PR_ERP_MEDREQ_DispensingOrganization or GEM_PR_ERP_MEDREQ_PrescribingOrganization)
* sender.reference 1..1

* extension contains
    VorgangsIdEX named VorgangsID 1..1 and
    PatientIdEX named PatientID 1..1 and
    IdentifierEX named IdentifierForCancelation 1..1 and
    CancellationReasonTypeEX named CancellationReasonType 0..1 and
    FreeTextEX named FreeText 0..1
* extension[VorgangsID] 1..1 MS
* extension[PatientID] 1..1 MS
* extension[IdentifierForCancelation].value[x] 1..1
* extension[IdentifierForCancelation].value[x] only uuid
* extension[IdentifierForCancelation] ^short = "UUID des zu stornierungen MedicationRequestBundles"
* extension[FreeText].value[x] 0..1
* extension[FreeText].value[x] only string
* extension[FreeText] ^short = "Begründung der Stornierung"

Invariant:   freetextorreasontype
Description: "Choose providing of one of Freetext or Reasontype, but not both or none"
Expression:  "(Bundle.entry.resource.extension('https://gematik.de/fhir/erpmedreqcom/StructureDefinition/FreeTextEX').exists().not() and Bundle.entry.resource.extension('https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX').exists()) or (Bundle.entry.resource.extension('https://gematik.de/fhir/erpmedreqcom/StructureDefinition/FreeTextEX').exists() and Bundle.entry.resource.extension('https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX').exists().not())"
Severity:    #error

Instance: CancellationHeaderExample_RequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationHeader
Usage: #inline
Title: "CancellationHeaderExample_RequestingOrganisation"
Description: "Example of a cancellation Header used by a requesting organisation"
* id = "CancellationHeaderExample-RequestingOrganisation"
* MetaInstance(GEM-PR-ERP-MEDREQ-CancellationHeader)
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#CancellationMessage "Stornierung einer Rezeptanforderung"
* sender.reference = "Organisation/RequestingOrganizationExample" //RequestingOrganizationExample
* source.endpoint = "https://pflegeheim.de/KIM"
* extension[+][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* extension[+][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* extension[+][IdentifierForCancelation].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/IdentifierEX"
* extension[=][IdentifierForCancelation].valueUuid = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* extension[+][CancellationReasonTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX"
* extension[=][CancellationReasonTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/CancellationReasonTypeCS#InformationenIncorrect "Informationen fehlerhaft"
* extension[+][FreeTextEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/FreeTextEX"
* extension[=][FreeTextEX].valueString = "Ausfuehrlicher Freitext"

Instance: CancellationHeaderExample_DispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationHeader
Usage: #inline
Title: "CancellationHeaderExample_DispensingOrganisation"
Description: "Example of a cancellation Header used by a requesting organisation"
* id = "CancellationHeaderExample-DispensingOrganisation"
* MetaInstance(GEM-PR-ERP-MEDREQ-CancellationHeader)
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#CancellationMessage "Stornierung einer Rezeptanforderung"
* sender.reference = "Organisation/DispensingOrganizationExample" //DispensingOrganizationExample
* source.endpoint = "https://pflegeheim.de/KIM"
* extension[+][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* extension[+][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* extension[+][IdentifierForCancelation].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/IdentifierEX"
* extension[=][IdentifierForCancelation].valueUuid = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* extension[+][CancellationReasonTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX"
* extension[=][CancellationReasonTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/CancellationReasonTypeCS#InformationenIncorrect "Informationen fehlerhaft"

Instance: CancellationHeaderExample_Praxis
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationHeader
Usage: #inline
Title: "CancellationHeaderExample_Praxis"
Description: "Example of a cancellation Header used by prescribing organisation"
* id = "CancellationHeaderExample-Praxis"
* MetaInstance(GEM-PR-ERP-MEDREQ-CancellationHeader)
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#CancellationMessage "Stornierung einer Rezeptanforderung"
* sender.reference = "Organisation/KBV-PR-FOR-OrganizationExample" //KBV_PR_FOR_OrganizationExample
* source.endpoint = "https://praxis_um_die_ecke.de/KIM"
* extension[+][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* extension[+][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* extension[+][IdentifierForCancelation].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/IdentifierEX"
* extension[=][IdentifierForCancelation].valueUuid = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* extension[+][CancellationReasonTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX"
* extension[=][CancellationReasonTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/CancellationReasonTypeCS#InformationMissing "Informationen unvollständig"