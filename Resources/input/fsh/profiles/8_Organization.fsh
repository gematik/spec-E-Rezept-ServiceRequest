Profile: ERPServiceRequestOrganization
Parent: KBV_PR_Base_Organization
Id: erp-service-request-organization
Title: "ERP Service Request Organization"
Description: "Organization that can be used to specify a KIM address"
* insert Meta (erp-service-request-organization)

* name 1..1 MS
* address MS
* type 1..1 MS
  * coding 1..1 MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
    * ^slicing.description = "Slicing to determine the type of the organization"
    * ^slicing.ordered = false
    
  * coding contains organization-type 1..1 MS

  * coding[organization-type] from ServiceRequestOrganizationTypeVS (required)
    * ^definition = "Hier kann der Typus der Einrichtung anhand eines Codes aus dem Codesystem IHE Deutschland e.V. angegeben werden. Erlaubt sind Pflegeeinrichtung, Apotheke und Arztpraxis"


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
  

