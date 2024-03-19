Instance: Pflegeheim-Immergrün-Identifier
InstanceOf: $HL7_Identifier
Usage: #inline
Title: "Pflegeheim-Immergrün-Identifier"
Description: "Example identifier for Nursing Home Evergreen"
* system = "https://gematik.de/fhir/sid/telematik-id"
* value = "5-test-telematik-id"

Instance: Hans-Topp-Glücklich-Identifier
InstanceOf: $HL7_Identifier
Usage: #inline
Title: "Hans-Topp-Glücklich-Identifier"
Description: "Example identifier for the doctor Hans Topp Glück"
* system = "https://gematik.de/fhir/sid/telematik-id"
* value = "1-test-telematik-id"

Instance: Test-Apotheke-Identifier
InstanceOf: $HL7_Identifier
Usage: #inline
Title: "Test-Apotheke-Identifier"
Description: "Example identifier for the executing pharmacy"
* system = "https://gematik.de/fhir/sid/telematik-id"
* value = "3-test-telematik-id"

Instance: Test-Apotheke2-Identifier
InstanceOf: $HL7_Identifier
Usage: #inline
Title: "Test-Apotheke2-Identifier"
Description: "Example identifier for the executing pharmacy"
* system = "https://gematik.de/fhir/sid/telematik-id"
* value = "3-test-telematik-id-2"


Instance: Pflegeheim-Immergrün-KIM-Identifier
InstanceOf: $GEM_PR_KIM_AdressIdentifier
Usage: #inline
Title: "Pflegeheim-Immergrün-KIM-Identifier"
Description: "Example KIM-identifier for Nursing Home Evergreen"
* value = "pflegeheim.immergrün.arzt@sana-pflegeheime.kim.telematik"

Instance: Hans-Topp-Glücklich-KIM-Identifier
InstanceOf: $GEM_PR_KIM_AdressIdentifier
Usage: #inline
Title: "Hans-Topp-Glücklich-KIM-Identifier"
Description: "Example KIM-identifier for the doctor Hans Topp Glück"
* value = "hans@ytopp-gluecklich.kim.telematik"

Instance: Test-Apotheke-KIM-Identifier
InstanceOf: $GEM_PR_KIM_AdressIdentifier
Usage: #inline
Title: "Test-Apotheke-KIM-Identifier"
Description: "Example KIM-identifier for the executing pharmacy"
* value = "arbeitsplatz-1@test-apotheke.kim.telematik"

Instance: Test-Apotheke2-KIM-Identifier
InstanceOf: $GEM_PR_KIM_AdressIdentifier
Usage: #inline
Title: "Test-Apotheke2-KIM-Identifier"
Description: "Example KIM-identifier for the executing pharmacy"
* value = "arbeitsplatz-1@test-apotheke-2.kim.telematik"