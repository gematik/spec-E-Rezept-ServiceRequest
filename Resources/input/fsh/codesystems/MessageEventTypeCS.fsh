CodeSystem: MessageEventTypeCS
Id: MessageEventTypeCS
Title: "CodeSystem for MessageEventTypes"
Description: "Definition of message types used for communication about medication requests"
* insert MetaCodeSystem(MessageEventTypeCS)

* #RequestingMessage "Nachricht zur Rezeptanforderung"
* #RespondingMessage "Antwort auf eine Rezeptanforderung"
* #CancellationMessage "Stornierung einer Rezeptanforderung"
* #DispenseMessage "Abgabeinformation der Rezeptanforderung"