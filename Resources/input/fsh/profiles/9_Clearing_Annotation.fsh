Profile: AnnotationClearing
Parent: Annotation
Id: annotation-clearing
Title: "Annotation Clearing"
Description: "Eintrag für einen Klärfall"
* insert Meta (annotation-clearing)

* author[x] MS
* authorReference 0..1 MS
* authorReference only Reference($KBV_PR_FOR_Practitioner or OrganizationWithKIMAdress)

* time 1..1 MS

* text MS
