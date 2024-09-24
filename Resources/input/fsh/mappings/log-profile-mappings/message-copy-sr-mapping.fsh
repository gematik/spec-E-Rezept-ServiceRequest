Mapping: NachrichtenKopieFachlichesMapping
Source: GEM_ERP_SR_LOG_MessageCopy
Target: "ERPServiceRequestRequestHeader"
Id: Nachrichten-Kopie-Fachliches-Mapping
Title: "Nachrichten Kopie Fachliches Mapping"
Description: "Mapping des Fachmodells aus GEM_ERP_SR_LOG_MessageCopy auf das FHIR-Modell ERPServiceRequestRequestHeader"

// MetaDaten
* insert RS_MAP_MetaDaten

* IndikatorKopie -> "ERPServiceRequestRequestHeader.eventCoding.code = 'messageCopy'"
* Anforderungsinformationen -> "ERPServiceRequestRequestHeader.focus(ERPServiceRequestMessageContainer)"

* ArtDerKopie -> "ERPServiceRequestMessageContainer.ERPServiceRequestRequestHeader.eventCoding.code"

