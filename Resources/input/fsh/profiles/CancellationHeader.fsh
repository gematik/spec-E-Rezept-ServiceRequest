Profile: GEM_PR_ERP_MEDREQ_CancellationHeader
Parent: MessageHeader
Id: gem-pr-erp-medreq-cancellation-header
Title: "GEM PR ERP MEDREQ CancellationHeader"
Description: "Header for cancellation message of a medication Request"
* insert Meta
* insert MetaProfile (GEM_PR_ERP_MEDREQ_CancellationHeader)

* event[x] only Coding
* event[x] from MessageEventTypeVS

* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization or GEM_PR_ERP_MEDREQ_Organization)
* sender.reference 1..1

* extension contains
    IdentifierEX named IdentifierForCancelation 1..1 and
    CancellationReasonTypeEX named CancellationReasonType 0..1 and
    FreeTextEX named FreeText 0..1
* extension[IdentifierForCancelation].value[x] 1..1
* extension[IdentifierForCancelation].value[x] only uuid
* extension[IdentifierForCancelation] ^short = "UUID des zu stornierungen MedicationRequestBundles"
* extension[FreeText].value[x] 0..1
* extension[FreeText].value[x] only string
* extension[FreeText] ^short = "Begründung der Stornierung"

Instance: CancellationHeaderExample_RequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationHeader
Usage: #inline
Title: "CancellationHeaderExample_RequestingOrganisation"
Description: "Example of a cancellation Header used by a requesting organisation"
* id = "853c0a72-d4e3-41b6-b4cb-e506d6f224ca"
* MetaInstance(GEM_PR_ERP_MEDREQ_CancellationHeader)
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#CancellationMessage "Stornierung einer Rezeptanforderung"
* sender.reference = "Organisation/a8efd0b3-58c3-48f7-89f5-67f86dd298e8" //RequestingOrganizationExample
* source.endpoint = "https://pflegeheim.de/KIM"
* extension[+][IdentifierForCancelation].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/IdentifierEX"
* extension[=][IdentifierForCancelation].valueUuid = "7a1d5187-3070-4a23-a877-162bdd479b9b"
* extension[+][CancellationReasonTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX"
* extension[=][CancellationReasonTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/CancellationReasonTypeCS#InformationenIncorrect "Informationen fehlerhaft"

Instance: CancellationHeaderExample_Praxis
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationHeader
Usage: #inline
Title: "CancellationHeaderExample_Praxis"
Description: "Example of a cancellation Header used by prescribing organisation"
* id = "e0e10aa4-3405-49de-8969-1e13864aa111"
* MetaInstance(GEM_PR_ERP_MEDREQ_CancellationHeader)
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#CancellationMessage "Stornierung einer Rezeptanforderung"
* sender.reference = "Organisation/f67dcc87-f877-49da-a249-aac4d1b15418" //KBV_PR_FOR_OrganizationExample
* source.endpoint = "https://praxis_um_die_ecke.de/KIM"
* extension[+][IdentifierForCancelation].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/IdentifierEX"
* extension[=][IdentifierForCancelation].valueUuid = "7a1d5187-3070-4a23-a877-162bdd479b9b"
* extension[+][CancellationReasonTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX"
* extension[=][CancellationReasonTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/CancellationReasonTypeCS#InformationMissing "Informationen unvollständig"