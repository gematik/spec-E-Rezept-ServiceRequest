// Originally defined on lines 1 - 29
Profile: GEM_PR_ERP_MEDREQ_CancellationHeader
Parent: MessageHeader
Id: GEM-PR-ERP-MEDREQ-CancellationHeader
Title: "GEM PR ERP MEDREQ CancellationHeader"
Description: "Header for cancellation message of a medication Request"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-CancellationHeader"
* ^version = "1.0"
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/GEM-PR-ERP-MEDREQ-CancellationHeader|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0
* event[x] only Coding
* event[x] from MessageEventTypeVS (required)
* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization or GEM_PR_ERP_MEDREQ_Organization)
* sender.reference 1..1
* extension contains
    VorgangsIdEX named VorgangsID 0.. and
    PatientIdEX named PatientID 0.. and
    IdentifierEX named IdentifierForCancelation 0.. and
    CancellationReasonTypeEX named CancellationReasonType 0.. and
    FreeTextEX named FreeText 0..
* extension[VorgangsID] 1..1
* extension[PatientID] 1..1
* extension[IdentifierForCancelation] 1..1
* extension[CancellationReasonType] 0..1
* extension[FreeText] 0..1
* extension[VorgangsID] 1..1
* extension[VorgangsID] MS
* extension[PatientID] 1..1
* extension[PatientID] MS
* extension[IdentifierForCancelation].value[x] 1..1
* extension[IdentifierForCancelation].value[x] only uuid
* extension[IdentifierForCancelation] ^short = "UUID des zu stornierungen MedicationRequestBundles"
* extension[FreeText].value[x] 0..1
* extension[FreeText].value[x] only string
* extension[FreeText] ^short = "Begründung der Stornierung"
* extension[IdentifierForCancelation].extension 0..0
* extension[FreeText].extension 0..0

// Originally defined on lines 31 - 46
Instance: CancellationHeaderExample_RequestingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationHeader
Title: "CancellationHeaderExample_RequestingOrganisation"
Description: "Example of a cancellation Header used by a requesting organisation"
Usage: #inline
* id = "CancellationHeaderExample-RequestingOrganisation"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#CancellationMessage "Stornierung einer Rezeptanforderung"
* sender.reference = "Organisation/RequestingOrganizationExample"
* source.endpoint = "https://pflegeheim.de/KIM"
* extension[0][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* extension[0][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* extension[0][IdentifierForCancelation].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/IdentifierEX"
* extension[0][IdentifierForCancelation].valueUuid = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* extension[0][CancellationReasonTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX"
* extension[0][CancellationReasonTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/CancellationReasonTypeCS#InformationenIncorrect "Informationen fehlerhaft"

// Originally defined on lines 48 - 63
Instance: CancellationHeaderExample_DispensingOrganisation
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationHeader
Title: "CancellationHeaderExample_DispensingOrganisation"
Description: "Example of a cancellation Header used by a requesting organisation"
Usage: #inline
* id = "CancellationHeaderExample-DispensingOrganisation"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#CancellationMessage "Stornierung einer Rezeptanforderung"
* sender.reference = "Organisation/DispensingOrganizationExample"
* source.endpoint = "https://pflegeheim.de/KIM"
* extension[0][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* extension[0][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* extension[0][IdentifierForCancelation].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/IdentifierEX"
* extension[0][IdentifierForCancelation].valueUuid = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* extension[0][CancellationReasonTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX"
* extension[0][CancellationReasonTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/CancellationReasonTypeCS#InformationenIncorrect "Informationen fehlerhaft"

// Originally defined on lines 65 - 80
Instance: CancellationHeaderExample_Praxis
InstanceOf: GEM_PR_ERP_MEDREQ_CancellationHeader
Title: "CancellationHeaderExample_Praxis"
Description: "Example of a cancellation Header used by prescribing organisation"
Usage: #inline
* id = "CancellationHeaderExample-Praxis"
* eventCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/MessageEventTypeCS#CancellationMessage "Stornierung einer Rezeptanforderung"
* sender.reference = "Organisation/KBV-PR-FOR-OrganizationExample"
* source.endpoint = "https://praxis_um_die_ecke.de/KIM"
* extension[0][VorgangsID].valueString = "VorgangsID_des_initial_AustellendenSystems-f17b6592a3a5c"
* extension[0][PatientID].valueString = "PatientID_des_initial_AustellendenSystems-3ddee2863325d"
* extension[0][IdentifierForCancelation].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/IdentifierEX"
* extension[0][IdentifierForCancelation].valueUuid = "urn:uuid:7a1d5187-3070-4a23-a877-162bdd479b9b"
* extension[0][CancellationReasonTypeEX].url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/CancellationReasonTypeEX"
* extension[0][CancellationReasonTypeEX].valueCoding = https://gematik.de/fhir/erpmedreqcom/CodeSystem/CancellationReasonTypeCS#InformationMissing "Informationen unvollständig"

