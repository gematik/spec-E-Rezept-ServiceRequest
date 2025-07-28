## Motivation

Dieses Profil wird in den Anwendungsfällen genutzt, um angefragte, verordnete oder dispensierte Arzneimittelinformationen zu übertragen.

Als Anfragender möchte ich angeben können, welche Medikation ich für einen Patienten anfragen möchte. Eine Einrichtung/ Person, die eine Verordnung anfragt nutzt dieses Profil, um strukturiert anzugeben, welche Medikation benötigt wird.
Hierzu muss in ERPServiceRequestPrescriptionRequest.basedOn ein ERPServiceRequestMedicationRequest mit angegeben werden. Dieser enthält die medizinische Information, die der Verordnende benötigt, um ein entsprechendes Rezept auszustellen.

Analog kann der Verordnende angeben, welches Arzneimittel er verordnet hat, sowie ein abgebender LE welches Arzneimittel geliefert wird.

Die anzugebende Medication entspricht dabei den [Medication Profilen](https://simplifier.net/erezept/~resources?category=Profile&corebasetype=Medication&sortBy=RankScore_desc) aus dem eRezept Projekt der KBV.

Da die [KBV_PR_ERP_Prescription](https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription) Informationen voraussetzt, die u.U. im Moment der Anfrage nicht bekannt sind, wurde dieses Profil spezifiziert. Es lehnt sich an die Spezifikation der KBV_PR_ERP_Prescription an, ist aber offener, erlaubt also auch dass die fehlenden Informationen nicht angegeben werden müssen.
