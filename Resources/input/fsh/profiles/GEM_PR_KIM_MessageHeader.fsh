Profile: GEM_PR_KIM_MessageHeader
Parent: MessageHeader
Id: GEM-PR-KIM-MessageHeader
Title: "GEM PR KIM MessageHeader"
Description: "Basic Message Header for communication of FHIR Ressources with KIM Messages"
//
* event[x] from KimDienstleistungsVS
//sender und receicer als Identifier und KIM-Adresse als Identifier modellieren
//email ist uri?
//refernzpunkt display als Anzeigename
* sender 1..1
* destination.receiver 1..1
* focus 1..

//MS für alle elemente

//Was passiert auf KIM EBNE?
//Wie gehen wir damit um, wenn FHIR nicht valide