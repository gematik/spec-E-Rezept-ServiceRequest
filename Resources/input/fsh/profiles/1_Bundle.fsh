Profile: BundleMessageContainer
Parent: $GEM_PR_KIM_MessageBundle
Id: bundle-message-container
Title: "Nachichten Container"
Description: "Bundle, was alle Ressourcen einer Nachricht enthält"
* insert Meta (bundle-message-container)
* entry[MessageHeader].resource only MessageHeaderRequestHeader

/*
Beispielinstanzen finden sich unter ../examples

Folgende UseCases sind beschrieben:
UC1: Pflegeeinrichtung -> Arzt -> Pflegeeinrichtung -> Apotheke
UC2: Pflegeeinrichtung -> Arzt -> Apotheke -> Pflegeeinrichtung
UC3: Pflegeeinrichtung -> Arzt -> Pflegeeinrichtung (Patient geht selbst zur Apotheke)
UC4(parenterele Zubereitung): Apotheke -> Arzt -> Apotheke
UC5 (Apothekenverbund): Apotheke -> Apotheke (E-Rezept mit Secret)
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