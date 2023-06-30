Profile: ERPServiceRequestMessageContainer
Parent: $GEM_PR_ATF_MessageBundle
Id: erp-service-request-message-container
Title: "ERP Service Request Message Container"
Description: "Bundle, which contains all resources of a message"
* insert Meta (erp-service-request-message-container)

* meta.profile 2..* MS
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "profile"
* meta.profile ^slicing.rules = #open

* meta.profile contains service-request-profile 1..1
* meta.profile[service-request-profile] = "https://gematik.de/fhir/erp-servicerequest/StructureDefinition/erp-service-request-message-container"

* entry[MessageHeader].resource only ERPServiceRequestRequestHeader

/*
Beispielinstanzen finden sich unter ../examples

Folgende UseCases sind beschrieben:
UC1: Pflegeeinrichtung -> Arzt -> Pflegeeinrichtung -> Apotheke
UC2: Pflegeeinrichtung -> Arzt -> Apotheke -> Pflegeeinrichtung
UC3: Pflegeeinrichtung -> Arzt -> Pflegeeinrichtung (Patient geht selbst zur Apotheke)
UC4(parenterele Zubereitung): Apotheke -> Arzt -> Apotheke
*/


/*

UC2:
* PrescriptionRequest zum Arzt
* PrescriptionRequest (complete, ohne Token) an Pflegeeinrichtung
* DispenseRequest (da generiert, active, mit Token) an Apotheke
* DispenseRequest (active ohne Token) an Pflegeeinrichtung
* DispenseRequest (complete) an Pflegeeinrichtung
*/
