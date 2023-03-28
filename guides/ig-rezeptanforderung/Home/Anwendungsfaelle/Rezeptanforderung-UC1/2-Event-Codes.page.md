## {{page-title}}

Für diesen Anwendungsfall sind im MessageHeader.eventCode folgende Codes zu verwenden und in MessageHeader.focus folgende Ressource anzugeben.

|.eventCode|.focus|Anwendung|
|---|---|---|
|#eRezept_Rezeptanforderung;Rezeptanfrage|Prescription_ServiceRequest|Übermittlung einer Rezeptanfrage an einen Verordnenden Arzt.|
|#eRezept_Rezeptanforderung;Rezeptanfrage_Storno|Prescription_ServiceRequest|Stornierung einer Rezeptanfrage. Kann sowohl vom Anfragenden, wie auch Verordnenden benutzt werden.|
|#eRezept_Rezeptanforderung;Rezeptbestaetigung|Prescription_ServiceRequest|Bestätigung der bearbeiteten Rezeptanfrage.|
|#eRezept_Rezeptanforderung;Abgabeanfrage|Dispense_ServiceRequest|Übermittlung einer Abgabeanfrage an eine dispensierende Apotheke.|
|#eRezept_Rezeptanforderung;Abgabeanfrage_Storno|Dispense_ServiceRequest|Stornierung einer Abgabeanfrage. Kann sowohl vom Anfragenden, wie auch von der Apotheke benutzt werden.|
|#eRezept_Rezeptanforderung;Abgabebestaetigung|Dispense_ServiceRequest|Bestätigung der bearbeiteten Abgabeanfrage.|