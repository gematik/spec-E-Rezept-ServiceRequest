## {{page-title}}

Als Anfragender möchte ich angeben können, welche Medikation ich für einen Patienten anfragen möchte. Eine Einrichtung/ Person, die eine Verordnung anfragt nutzt dieses Profil, um strukturiert anzugeben, welche Medikation benötigt wird.

Hierzu muss in einem ServiceRequestPrescriptionRequest ein MedicationRequestPrescriptionRequest mit angegeben werden. Dieser enthält die medizinische Information, die der Verordnende benötigt, um ein entsprechendes Rezept auszustellen.

Die anzugebende Medication entspricht dabei den [KBV Medication's](https://simplifier.net/erezept/~resources?text=medication&category=Profile&sortBy=RankScore_desc), damit das PVS daraus eine Verordnung erstellen kann.

Da die [KBV_PR_ERP_Prescription](https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription) Informationen voraussetzt, die u.U. im Moment der Anfrage nicht bekannt sind, wurde dieses Profil spezifiziert. Es lehnt sich an die Spezifikation der KBV_PR_ERP_Prescription an, ist aber offener, erlaubt also auch dass die fehlenden Informationen nicht angegeben werden müssen.

Das PS der verordnenden LEI sollte die Informationen aus diesem Profil extrahieren und dann eine eigene KBV_PR_ERP_Prescription erstellen, die es dann in der Antwort nutzen kann.
