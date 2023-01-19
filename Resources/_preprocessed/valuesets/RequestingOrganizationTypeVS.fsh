// Originally defined on lines 1 - 7
ValueSet: RequestingOrganizationTypeVS
Id: RequestingOrganizationTypeVS
Title: "ValueSet of requesting Entity used in the MessageHeader"
Description: "ValueSet Header Event codes of request orgin"
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpmedreqcom/StructureDefinition/RequestingOrganizationTypeVS"
* ^version = "1.0"
* include codes from system PractitionerProfessionOID
* include codes from system OrganizationProfessionOID

