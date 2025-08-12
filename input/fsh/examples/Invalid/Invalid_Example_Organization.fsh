Instance: INVALID-HealthCareService-Organization
InstanceOf: ERPServiceRequestOrganization
Usage: #example
Title: "Invalide Pflegeeinrichtung"
Description: "Dieses Beispiel ist invalide und dient nur der Sicherstellung der Validierung."
* name = "Pflegeheim Immergrün"
* identifier[TelematikID].value = "123456789"
* type[profession].coding = $profession-id-cs#1.2.276.0.76.4.24 "Betriebsstätte Gesundheits-, Kranken- und Altenpflege"
* contact.telecom[tel].system = #phone
* contact.telecom[tel].value = "0301234567"
* contact.telecom[kim].system = #email
* contact.telecom[kim].value = "arbeitsplatz-1@test-pflegeheim.kim.telematik"
* address[+]
  * type = #both
  * use = #home
  * line = "Musterstr. 2"
  * city = "Berlin"
  * postalCode = "10623"
