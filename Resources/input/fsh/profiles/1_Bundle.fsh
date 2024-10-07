Profile: ERPServiceRequestMessageContainer
Parent: $GEM_PR_ATF_MessageBundle
Id: erp-service-request-message-container
Title: "ERP Service Request Message Container"
Description: "Bundle, which contains all resources of a message"
* insert Meta (erp-service-request-message-container)
* obeys service-request-message-container-1

* entry[MessageHeader].resource only ERPServiceRequestRequestHeader

Invariant: service-request-message-container-1
Description: "If the Message is a copy then the focus of the MessageHeader must be a Bundle, otherwise a ServiceRequest."
Expression: "(Bundle.entry[0].resource.event.code = 'eRezept_Rezeptanforderung;NachrichtKopie' implies (Bundle.entry[0].resource.focus.all($this.resolve() is Bundle))) and (Bundle.entry[0].resource.event.code != 'eRezept_Rezeptanforderung;NachrichtKopie' implies Bundle.entry[0].resource.focus.all($this.resolve() is ServiceRequest))"
Severity: #error