
# <a id="Inhalt"></a>Inhalt

- [Inhalt](#Inhalt)
  - [Vorbemerkungen zum Mapping](#Vorbemerkungen-zum-Mapping)
  - [Mapping-Tabelle fachlicher Informationsobjekte zu FHIR-Objekten](#Mapping-Table)

## <a id="Vorbemerkungen-zum-Mapping"></a>Vorbemerkungen zum Mapping

Die untenstehende Tabelle beschreibt das Mapping der Informationsobjekte, die aus der fachlichen Ausarbeitung der User Stories und der damit verbundenen Use Cases hervorgegangen sind auf konkrete FHIR-Objekte. Ziel des Mapping ist es,

  - die fachlichen Informationsobjekte möglichst vollständig wiederzuspiegeln.
  - vorhandene FHIR-Types, die im Kontext des E-Rezepts bereits verwendet werden, möglichst häufig wiederzuverwenden (sofern es der konkrete Use Case zulässt), um dadurch zusätzliche Mapping-Aufwände in den Primärsystemen gering zu halten.
  - dort, wo es fachlich notwendig erscheint, eigens definierte FHIR-Types anzubieten, dort aber (z.B. bei Subtypen) möglichst häufig erneut auf Wiederverwendung vorhandener Typen zu setzen
  - Pflicht- und Optionsfelder (Kardinalitäten der Informationsobjekte) konsistenz zur fachlichen Notwendigkeit anzubieten


## <a id="Mapping-Table"></a>Mapping-Tabelle fachlicher Informationsobjekte zu FHIR-Objekten


|Informationsobjekt 1.Ebene|Informationsobjekt 2.Ebene|Informationsobjekt 3.Ebene|Kardinalität|mögliche Quelle(n)|FHIR-Type-Mapping|FHIR-Base-Type||
|---|---|---|---|---|---|---|---|
Rezeptanforderung|Vorgangs_ID|n/a|1..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_DispenseInformationBundle.GEM_PR_ERP_MEDREQ_MessageHeader.extension:VorgangsID|String
Rezeptanforderung|Prioritaet|n/a|0..1|Vorgängerverordnung / PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.priority|RequestPriority
Rezeptanforderung|Adressat_der_Rezeptanforderung|Telematik_ID|0..1|Vorgänger-DispenseInformationBundle / PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.requester.identifier:Telematik-ID|Identifier-Profil aus de.basisprofil
Rezeptanforderung|Adressat_der_Rezeptanforderung|Name|0..1|Vorgänger-DispenseInformationBundle / PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.requester.name:name|KBV_PR_Base_Datatype_Name
Rezeptanforderung|Adressat_der_Rezeptuebermittlung|Telematik_ID|1..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_Organization [Bundle.entry:RequestingOrganization]|GEM_PR_ERP_MEDREQ_Organization
Rezeptanforderung|Adressat_der_Rezeptuebermittlung|Empfaenger_Typ|1..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.extension.prescriptionDeliveryType|Coding
Rezeptanforderung|Patienteninformationen|KVNR|1..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.KBV_PR_FOR_Patient.identifier:[versichertenId_GKV ODER versichertenID_pkv]|Identifier-Profil aus de.basisprofil
Rezeptanforderung|Patienteninformationen|Name|1..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.KBV_PR_FOR_Patient.name|KBV_PR_Base_Datatype_Name
Rezeptanforderung|Patienteninformationen|Geburtstag|1..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.KBV_PR_FOR_Patient.birthDate|date
Rezeptanforderung|Adressat_der_Rezeptanforderung||0..1|DispenseInformationBundle des Vorgängervorgangs / PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.KBV_PR_FOR_Practitioner|KBV_PR_FOR_Practitioner
Rezeptanforderung|Praeparat|Bezeichnung|1..1|DispenseInformationBundle des Vorgängervorgangs / PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.KBV_PR_ERP_Medication_*.code|
Rezeptanforderung|Praeparat|Packungsgroesse|1..1|DispenseInformationBundle des Vorgängervorgangs / PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.KBV_PR_ERP_Medication_*.amount|
Rezeptanforderung|Restreichweite|Anzahl_Resteinheiten|0..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.extension:RemainingQuantity|SimpleQuantity
Rezeptanforderung|Restreichweite|Restreichweitendatum|0..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.extension:RemainingRangeDate|date
Rezeptanforderung|Vorheriges_Rezept|n/a|0..1|DispenseInformationBundle des Vorgängervorgangs / PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.extension:PriorPrescriptionID|GEM_ERP_PR_PrescriptionId
Rezeptanforderung|Freitext|n/a|0..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_RequestBundle.GEM_PR_ERP_MEDREQ_MedicationRequest.extension:FreeText|String
Rezeptanforderung_Storno|Vorgangs_ID|n/a|1..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_CancellationBundle.GEM_PR_ERP_MEDREQ_CancellationHeader.extension:VorgangsID|String
Rezeptanforderung_Storno|Begruendung_der_Stornierung|n/a|0..1|PS d. Pflegeeinrichtung / AVS|GEM_PR_ERP_MEDREQ_CancellationBundle.CancellationHeader.MessageHeader.extension:FreeText|String
Rezeptanfrage_Rezeptuebermittlung|Vorgangs_ID|n/a|1..1|RequestBundle des Vorgangs|GEM_PR_ERP_MEDREQ_ResponseBundle.GEM_PR_ERP_MEDREQ_ResponseHeader.extension:VorgangsID|String
Rezeptanfrage_Rezeptuebermittlung|Erezept_Access_Code|n/a|1..1|PVS|GEM_PR_ERP_MEDREQ_ResponseBundle.GEM_PR_ERP_MEDREQ_ResponseHeader.extension:AccessCode|GEM_ERP_PR_AccessCode
Rezeptanfrage_Rezeptuebermittlung|Erezept_Task_ID|n/a|1..1|PVS|GEM_PR_ERP_MEDREQ_ResponseBundle.GEM_PR_ERP_MEDREQ_ResponseHeader.extension:PrescriptionID|GEM_ERP_PR_PrescriptionId
Rezeptanfrage_Rezeptuebermittlung|Strukturierter_Verordnungsdatensatz|Verordnungsinhalt|1..1|RequestBundle des Vorgangs / PVS|GEM_PR_ERP_MEDREQ_ResponseBundle.KBV_PR_ERP_Prescription.medication|KBV_PR_ERP_Medication_*
Rezeptanfrage_Rezeptuebermittlung|Strukturierter_Verordnungsdatensatz|Verschreibender_Leistungserbringer|1..1|PVS|GEM_PR_ERP_MEDREQ_ResponseBundle.KBV_PR_ERP_Prescription.requester|KBV_PR_FOR_Practitioner
Rezeptanfrage_Rezeptuebermittlung|LEI des Verordnenden||1..1|PVS|GEM_PR_ERP_MEDREQ_ResponseBundle.KBV_PR_FOR_Organization|KBV_PR_FOR_Organization
Rezeptanfrage_Rezeptuebermittlung|Strukturierter_Verordnungsdatensatz|Betroffener_Versicherter|1..1|PVS|GEM_PR_ERP_MEDREQ_ResponseBundle.KBV_PR_ERP_Prescription.subject|KBV_PR_FOR_Patient
Rezeptanfrage_Rezeptuebermittlung|Strukturierter_Verordnungsdatensatz|Abgebender_Leistungserbringer||RequestBundle des Vorgangs|GEM_PR_ERP_MEDREQ_ResponseBundle.GEM_PR_ERP_MEDREQ_Organization [Bundle.entry:DispensingOrganization]|GEM_PR_ERP_MEDREQ_Organization
Rezeptanfrage_Rezeptuebermittlung|Strukturierter_Verordnungsdatensatz|Medikamentverabreichende_Institution||RequestBundle des Vorgangs|GEM_PR_ERP_MEDREQ_ResponseBundle.GEM_PR_ERP_MEDREQ_Organization [Bundle.entry:RequestingOrganization]|GEM_PR_ERP_MEDREQ_Organization
Rezeptanfrage_Rezeptuebermittlung|||1..1|PVS|GEM_PR_ERP_MEDREQ_ResponseBundle.KBV_PR_FOR_Practitioner|KBV_PR_FOR_Practitioner
Rezeptanfrage_Ablehnung|Vorgangs_ID|n/a|1..1|RequestBundle des Vorgangs|GEM_PR_ERP_MEDREQ_CancellationBundle.GEM_PR_ERP_MEDREQ_CancellationHeader.extension:VorgangsID|String
Rezeptanfrage_Ablehnung|Ablehnunggrund|n/a|1..1|PVS|GEM_PR_ERP_MEDREQ_CancellationBundle.GEM_PR_ERP_MEDREQ_CancellationHeader.extension:CancellationReasonType|Coding
Rezeptanfrage_Ablehnung|Freitext|n/a|0..1|PVS|GEM_PR_ERP_MEDREQ_CancellationBundle.GEM_PR_ERP_MEDREQ_CancellationHeader.extension:FreeText|String
Verordnung_Dispensierung|Vorgangs_ID|n/a|1..1|ResponseBundle des Vorgangs|GEM_PR_ERP_MEDREQ_DispenseInformationBundle.GEM_PR_ERP_MEDREQ_MessageHeader.extension:VorgangsID|String
Verordnung_Dispensierung|Strukturierter_Verordnungsdatensatz|Verordnungsinhalt|1..1|ResponseBundle des Vorgangs / AVS|GEM_PR_ERP_MEDREQ_DispenseInformationBundle.KBV_PR_ERP_Prescription.medication|KBV_PR_ERP_Medication_*
Verordnung_Dispensierung|Strukturierter_Verordnungsdatensatz|Verschreibender_Leistungserbringer|0..1|ResponseBundle des Vorgangs / AVS|GEM_PR_ERP_MEDREQ_DispenseInformationBundle.KBV_PR_ERP_Prescription.requester|KBV_PR_FOR_Practitioner
Verordnung_Dispensierung|Strukturierter_Verordnungsdatensatz|Betroffener_Versicherter|1..1|ResponseBundle des Vorgangs / AVS|GEM_PR_ERP_MEDREQ_DispenseInformationBundle.KBV_PR_FOR_Patient|KBV_PR_FOR_Patient
Verordnung_Dispensierung|Strukturierter_Verordnungsdatensatz|Abgebender_Leistungserbringer|0..1|AVS|GEM_PR_ERP_MEDREQ_DispenseInformationBundle.GEM_PR_ERP_MEDREQ_Organization [Bundle.entry:DispensingOrganization]|GEM_PR_ERP_MEDREQ_Organization
Verordnung_Dispensierung|Strukturierter_Verordnungsdatensatz|Medikamentverabreichende_Institution|0..1|ResponseBundle des Vorgangs / AVS|GEM_PR_ERP_MEDREQ_DispenseInformationBundle.GEM_PR_ERP_MEDREQ_Organization [Bundle.entry:RequestingOrganization]|GEM_PR_ERP_MEDREQ_Organization
Verordnung_Dispensierung|Strukturierter_Dispensierungsdatensatz|Verordnungsinhalt|1..1|AVS|GEM_PR_ERP_MEDREQ_DispenseInformationBundle.GEM_ERP_PR_MedicationDispense|GEM_ERP_PR_MedicationDispense
