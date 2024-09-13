Extension: CopyToCareFacilityEX
Id: copy-to-care-facility-ex
Title: "Copy To Care Facility (EX)"
Description: "This extension is used to record the KIM-Adress of the care facility that receives a copy of the request."
Context: MessageHeader, MessageDefinition
* insert Meta (copy-to-care-facility-ex)
* value[x] 1..1 MS
* value[x] only ContactDetail
* valueContactDetail
  * ^short = "The contact details of the care facility that receives a copy of the request."
  * name 1..1 MS
  
  * telecom MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
    * ^slicing.description = "Slices on contact options"
    * ^slicing.ordered = false
  * telecom contains 
    tel 1..1 MS
    and kim 1..1 MS

  * telecom[tel].system = #phone
  * telecom[tel].value 1..1 MS

  * telecom[kim].system = #email
  * telecom[kim].value 1..1 MS
    * ^short = "The KIM-Adress of the care facility that receives a copy of the request."