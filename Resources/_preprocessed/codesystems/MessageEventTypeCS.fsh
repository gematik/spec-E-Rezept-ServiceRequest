// Originally defined on lines 1 - 10
CodeSystem: MessageEventTypeCS
Id: MessageEventTypeCS
Title: "CodeSystem for MessageEventTypes"
Description: "Definition of message types used for communication about medication requests"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/MessageEventTypeCS"
* ^version = "1.0"
* #RequestingMessage "Nachricht zur Rezeptanforderung"
* #RespondingMessage "Antwort auf eine Rezeptanforderung"
* #CancellationMessage "Stornierung einer Rezeptanforderung"
* #DispenseMessage "Abgabeinformation der Rezeptanforderung"

