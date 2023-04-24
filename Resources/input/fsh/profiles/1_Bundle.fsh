Profile: ERPServiceRequestMessageContainer
Parent: $GEM_PR_ATF_MessageBundle
Id: erpservice-request-message-container
Title: "ERP Service Request Message Container"
Description: "Bundle, was alle Ressourcen einer Nachricht enthält"
* insert Meta (erpservice-request-message-container)
* entry[MessageHeader].resource only MessageHeaderRequestHeader

/*
Beispielinstanzen finden sich unter ../examples

Folgende UseCases sind beschrieben:
UC1: Pflegeeinrichtung -> Arzt -> Pflegeeinrichtung -> Apotheke
UC2: Pflegeeinrichtung -> Arzt -> Apotheke -> Pflegeeinrichtung
UC3: Pflegeeinrichtung -> Arzt -> Pflegeeinrichtung (Patient geht selbst zur Apotheke)
UC4(parenterele Zubereitung): Apotheke -> Arzt -> Apotheke
*/


/*
TODO
Abbruch durch die Apotheke

DispenseRequest wird vom PVS erstellt

UC2:
* PrescriptionRequest zum Arzt
* PrescriptionRequest (complete, ohne Token) an Pflegeeinrichtung
* DispenseRequest (da generiert, active, mit Token) an Apotheke
* DispenseRequest (active ohne Token) an Pflegeeinrichtung
* DispenseRequest (complete) an Pflegeeinrichtung
*/
