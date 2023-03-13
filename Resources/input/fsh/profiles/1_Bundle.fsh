Profile: GEM_PR_MEDREQ_MessageBundle
Parent: $GEM_PR_KIM_MessageBundle
Id: GEM-PR-MEDREQ-MessageBundle
Title: "Nachrichtenbundle"
Description: "Bundle, was alle Informationen für die Anwendungsfälle bereit hält"
* insert Meta (GEM-PR-MEDREQ-MessageBundle)
* entry[MessageHeader].resource only GEM_PR_MEDREQ_MessageHeader

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