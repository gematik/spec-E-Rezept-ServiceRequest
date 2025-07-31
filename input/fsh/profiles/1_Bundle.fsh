Profile: ERPServiceRequestMessageContainer
Parent: BundleAppTransportFramework
Id: erp-service-request-message-container
Title: "ERP Service Request Nachrichten-Container"
Description: "Bundle, welches alle Ressourcen einer Nachricht enthält"
* insert Meta (erp-service-request-message-container)
* obeys service-request-message-container-1
* obeys service-request-message-container-2
* obeys service-request-message-container-3
* obeys service-request-message-container-4
* obeys service-request-message-container-5

* entry[MessageHeader].resource only ERPServiceRequestRequestHeader

Invariant: service-request-message-container-1
Description: "Wenn die Nachricht eine Kopie ist, muss der Fokus des MessageHeaders ein Bundle sein, andernfalls ein ServiceRequest."
Expression: "(Bundle.entry[0].resource.event.code = 'eRezept_Rezeptanforderung;NachrichtKopie' implies (Bundle.entry[0].resource.focus.all($this.resolve() is Bundle))) and (Bundle.entry[0].resource.event.code != 'eRezept_Rezeptanforderung;NachrichtKopie' implies Bundle.entry[0].resource.focus.all($this.resolve() is ServiceRequest))"
Severity: #error

Invariant: service-request-message-container-2
Description: "Wenn der Prescription-ServiceRequest den Pflegedienst als Referenz enthält, muss der E-Mail-Kontakt vorhanden sein."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all(($this.resolve().supportingInfo.where($this.type = 'Organization').exists() and $this.resolve().code.coding.code = 'prescription-request')implies $this.resolve().supportingInfo.where($this.type = 'Organization').reference.resolve().contact.telecom.where(system = 'email').exists())"
Severity: #error

Invariant: service-request-message-container-3
Description: "Wenn der Prescription-ServiceRequest den Pflegedienst als Referenz enthält, muss die Organisation den entsprechenden Typ haben."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all(($this.resolve().code.coding.code = 'prescription-request' and $this.resolve().supportingInfo.where($this.type = 'Organization').exists()) implies $this.resolve().supportingInfo.where($this.type = 'Organization').reference.resolve().type.coding.code = '1.2.276.0.76.4.245')"
Severity: #error

Invariant: service-request-message-container-4
Description: "Wenn der Prescription-ServiceRequest aktiv ist, nicht Zyto ist und der Anforderer eine Apotheke ist, muss der Pflegedienst für den Erhalt einer Kopie angegeben werden."
Expression: "(Bundle.entry[0].resource.event.code != 'eRezept_ParenteraleZubereitung;Rezeptanfrage') implies Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all(($this.resolve().code.coding.code = 'prescription-request' and $this.resolve().status = 'active' and $this.resolve().requester.resolve().type.coding.code = '1.2.276.0.76.4.54') implies $this.resolve().supportingInfo.where($this.type = 'Organization').exists())"
Severity: #error

Invariant: service-request-message-container-5
Description: "Wenn der Dispense-ServiceRequest aktiv ist, muss der Anforderer ein Pflegedienst sein."
Expression: "Bundle.entry.resource.children().reference.where($this.startsWith('ServiceRequest')).all(($this.resolve().code.coding.code = 'dispense-request' and $this.resolve().status = 'active') implies $this.resolve().requester.resolve().type.coding.code = '1.2.276.0.76.4.245')"
Severity: #error