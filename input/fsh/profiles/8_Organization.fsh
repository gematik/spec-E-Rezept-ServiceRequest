Profile: ERPServiceRequestOrganization
Parent: TIOrganization
Id: erp-service-request-organization
Title: "ERP Service Request Organisation"
Description: "Organisation, die zur Angabe einer KIM-Adresse verwendet werden kann"
* insert Meta (erp-service-request-organization)

* contact 1..* MS
  * telecom 1..* MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
    * ^slicing.description = "Slices on contact options"
    * ^slicing.ordered = false
  
  * telecom contains 
    tel 1..1 MS
    and kim 0..1 MS

  * telecom[tel].system = #phone
  * telecom[tel].value 1..1 MS

  * telecom[kim].system = #email
  * telecom[kim].value 1..1 MS
  

