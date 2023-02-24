Profile: GEM_PR_MEDREQ_MessageBundle
Parent: GEM_PR_KIM_MessageBundle
Id: GEM-PR-MEDREQ-MessageBundle
Title: "GEM_PR_MEDREQ_MessageBundle"
Description: "Basic Bundle for communication of FHIR Ressources with KIM Messages"

* insert Meta (GEM-PR-MEDREQ-MessageBundle)
* entry[MessageHeader].resource only GEM_PR_MEDREQ_MessageHeader

/*
Beispielinstanzen finden sich unter ../examples

Folgende UseCases sind beschrieben:
UC1: Pflegeeinrichtung -> Arzt -> Pflegeeinrichtung -> Apotheke
UC2: Pflegeeinrichtung -> Arzt -> Apotheke -> Pflegeeinrichtung
UC3: Pflegeeinrichtung -> Arzt -> Pflegeeinrichtung (Patient geht selbst zur Apotheke)
UC4(parenterele Zubereitung): Apotheke -> Arzt -> Apotheke
*/
