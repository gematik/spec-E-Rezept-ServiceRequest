Profile: GEM_PR_KIM_MessageHeader
Parent: MessageHeader
Id: GEM-PR-KIM-MessageHeader
Title: "GEM PR KIM MessageHeader"
Description: "Basic Message Header for communication of FHIR Ressources with KIM Messages"
* ^status = #draft

//
* event[x] from GEM_VS_MEDREQ_KIM_Dienstkennung (required)
//sender und receicer als Identifier und KIM-Adresse als Identifier modellieren
// Im FHIR Message header ist source.endpoint und destination.endpoint 1..1, soll das als KIM Adresse genutzt werden?
//email ist uri?
//refernzpunkt display als Anzeigename
* sender 1..1
* sender.identifier 1..1 MS
* sender.identifier only GEM_PR_MEDREQ_KIM_Adresse or GEM_PR_MEDREQ_TIM_Adresse
* sender.display 0..1 MS
  * ^short = "Anzeigename der KIM Adresse"
* destination.receiver 1..1
* destination.receiver.identifier 1..1 MS
* destination.receiver.identifier only GEM_PR_MEDREQ_KIM_Adresse or GEM_PR_MEDREQ_TIM_Adresse
* destination.receiver.display 0..1 MS
  * ^short = "Anzeigename der KIM Adresse"
* focus 1..*

//MS für alle elemente

//Was passiert auf KIM EBNE?
//Wie gehen wir damit um, wenn FHIR nicht valide