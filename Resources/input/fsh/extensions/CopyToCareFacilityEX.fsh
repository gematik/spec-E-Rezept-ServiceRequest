Extension: CopyToCareFacilityEX
Id: copy-to-care-facility-ex
Title: "Copy To Care Facility (EX)"
Description: "This extension is used to record the KIM-Adress of the care facility that receives a copy of the request."
Context: MessageHeader, MessageDefinition
* insert Meta (copy-to-care-facility-ex)
* value[x] 1..1 MS
* value[x] only uri
  * ^short = "The KIM-Adress of the care facility that receives a copy of the request."