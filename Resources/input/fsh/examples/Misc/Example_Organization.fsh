Instance: Example-HealthCareService-Organization
InstanceOf: ERPServiceRequestOrganization
Usage: #example
* meta.tag[Origin].code = #owner
* name = "Pflegeheim Immergrün"
* identifier[TelematikID].value = "123456789"
* type[profession].coding = $profession-id-cs#1.2.276.0.76.4.245 "Betriebsstätte Gesundheits-, Kranken- und Altenpflege"
* contact.telecom[tel].system = #phone
* contact.telecom[tel].value = "0301234567"
* contact.telecom[kim].system = #email
* contact.telecom[kim].value = "arbeitsplatz-1@test-pflegeheim.kim.telematik"
* address[+]
  * type = #both
  * line = "Musterstr. 2"
  * city = "Berlin"
  * postalCode = "10623"

Instance: Example-HealthCareService-Organization-no-kim
InstanceOf: ERPServiceRequestOrganization
Usage: #inline
* name = "Pflegeheim Immergrün"
* meta.tag[Origin].code = #owner
* type[profession].coding = $profession-id-cs#1.2.276.0.76.4.245 "Betriebsstätte Gesundheits-, Kranken- und Altenpflege"
* identifier[TelematikID].value = "123456789"
* contact.telecom[tel].system = #phone
* contact.telecom[tel].value = "0301234567"
* address[+]
  * type = #both
  * line = "Musterstr. 2"
  * city = "Berlin"
  * postalCode = "10623"

Instance: Example-HealthCareService-Organization-wrong-type
InstanceOf: ERPServiceRequestOrganization
Usage: #inline
* name = "Pflegeheim Immergrün"
* meta.tag[Origin].code = #owner
* type[profession].coding = $profession-id-cs#1.2.276.0.76.4.54 "Öffentliche Apotheke"
* identifier[TelematikID].value = "123456789"
* contact.telecom[tel].system = #phone
* contact.telecom[tel].value = "0301234567"
* contact.telecom[kim].system = #email
* contact.telecom[kim].value = "arbeitsplatz-1@test-pflegeheim.kim.telematik"
* address[+]
  * type = #both
  * line = "Musterstr. 2"
  * city = "Berlin"
  * postalCode = "10623"

Instance: Example-Pharmacy-Organization
InstanceOf: ERPServiceRequestOrganization
Usage: #inline
* name = "Test Apotheke"
* meta.tag[Origin].code = #owner
* type[profession].coding = $profession-id-cs#1.2.276.0.76.4.54 "Öffentliche Apotheke"
* identifier[TelematikID].value = "123456789"
* contact.telecom[tel].system = #phone
* contact.telecom[tel].value = "0301234567"
* address[+]
  * type = #both
  * line = "Musterstr. 2"
  * city = "Berlin"
  * postalCode = "10623"

Instance: Example-Practitioner-Organization
InstanceOf: ERPServiceRequestOrganization
Usage: #inline
* name = "Test Arztpraxis"
* meta.tag[Origin].code = #owner
* type[profession].coding = $profession-id-cs#1.2.276.0.76.4.50 "Betriebsstätte Arzt"
* identifier[TelematikID].value = "123456789"
* contact.telecom[tel].system = #phone
* contact.telecom[tel].value = "0307654321"
* address[+]
  * type = #both
  * line = "Musterarztstr. 3"
  * city = "Berlin"
  * postalCode = "10623"