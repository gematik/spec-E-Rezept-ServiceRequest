## {{page-title}}

Als Anfragender möchte ich angeben können welche Medikation ich für einen Patienten anfragen möchte.

Hierzu muss in einem Prescription_ServiceRequest ein MedicationRequestPrescriptionRequest mit angegeben werden. Dieser enthält die medizinische Information, die der Verordnende benötigt, um ein entsprechendes Rezept auszustellen.

Die anzugebende Medication entspricht dabei den [KBV Medication's](https://simplifier.net/erezept/~resources?text=medication&category=Profile&sortBy=RankScore_desc), damit das PVS daraus eine Verordnung erstellen kann.
