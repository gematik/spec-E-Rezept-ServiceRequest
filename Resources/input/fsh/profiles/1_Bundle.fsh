Profile: ERPServiceRequestMessageContainer
Parent: $GEM_PR_ATF_MessageBundle
Id: erp-service-request-message-container
Title: "ERP Service Request Message Container"
Description: "Bundle, which contains all resources of a message"
* insert Meta (erp-service-request-message-container)
* obeys service-request-message-container-1
* obeys service-request-message-container-2
* obeys service-request-message-container-3
* obeys service-request-message-container-4

* entry[MessageHeader].resource only ERPServiceRequestRequestHeader

Invariant: service-request-message-container-1
Description: "If the Message is a copy then the focus of the MessageHeader must be a Bundle, otherwise a ServiceRequest."
Expression: "(Bundle.entry[0].resource.event.code = 'eRezept_Rezeptanforderung;NachrichtKopie' implies (Bundle.entry[0].resource.focus.all($this.resolve() is Bundle))) and (Bundle.entry[0].resource.event.code != 'eRezept_Rezeptanforderung;NachrichtKopie' implies Bundle.entry[0].resource.focus.all($this.resolve() is ServiceRequest))"
Severity: #error

Invariant: service-request-message-container-2
Description: "If the the ServiceRequest contains the health-care service as a reference, then the e-mail contact must be present."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all($this.resolve().supportingInfo.where($this.type = 'Organization').exists() implies $this.resolve().supportingInfo.where($this.type = 'Organization').reference.resolve().contact.telecom.where(system = 'email').exists())"
Severity: #error

Invariant: service-request-message-container-3
Description: "If the the ServiceRequest contains the health-care service as a reference, then the organization must have the respective type."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all($this.resolve().supportingInfo.where($this.type = 'Organization').exists() implies $this.resolve().supportingInfo.where($this.type = 'Organization').reference.resolve().type.coding.code = 'PFL')"
Severity: #error

Invariant: service-request-message-container-4
Description: "If the the ServiceRequest is active and the requester is a pharmacy, then the Healthcare Service to receive a copy must be stated."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all(($this.resolve().status = 'active' and $this.resolve().requester.resolve().type.coding.code = 'APO') implies $this.resolve().supportingInfo.where($this.type = 'Organization').exists())"
Severity: #error