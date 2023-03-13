Instance: UC1-Medication-Dispense
InstanceOf: $GEM_ERP_PR_MedicationDispense
Usage: #inline
Description: "Example MedicationDispense"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "160.100.000.000.002.36"
* identifier.use = #official
* contained[0] = Example-Response-Medication
* status = RequestStatus#completed
* medicationReference = Reference(Example-Response-Medication)

* subject
  * identifier
    * system = "http://fhir.de/sid/gkv/kvid-10"
    * value = "X123456789"

* performer
  * actor
    * identifier
      * system = "https://gematik.de/fhir/sid/telematik-id"
      * value = "12345678901234567890"

* whenHandedOver = "2020-04-16T13:44:27.957+00:00"

* dosageInstruction
  * sequence = 1
  * text = "Eine Tablette täglich"
  * timing
    * repeat
      * frequency = 1
      * period = 1
      * periodUnit = #d
  * doseAndRate
    * type = #ordered
    * doseQuantity
      * value = 1
      * unit = "tablet"

