ValueSet: ServiceIdentifierVS
Id: service-identifier-vs
Title: "Identifier of the use case"
Description: "Identifiers for specifying an application of e-prescription communication"
* insert MetaValueSet(service-identifier-vs)
* $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptanfrage "Request to a doctor to issue a prescription"
* $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptanfrage_Storno "Cancellation of the prescription request"
* $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Rezeptbestaetigung "Confirmation and transmission of an issued prescription"
* $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Abgabeanfrage "Request to fulfill a prescription and dispense the drug"
* $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Abgabeanfrage_Storno "Cancellation of the delivery request"
* $GEM_CS_ATF_ServiceIdentifier#eRezept_Rezeptanforderung;Abgabebestaetigung "Confirmation of fulfillment and dispensing of a medication"
* $GEM_CS_ATF_ServiceIdentifier#eRezept_ParenteraleZubereitung;Rezeptanfrage "Prescription request for a parenteral preparation"
* $GEM_CS_ATF_ServiceIdentifier#eRezept_ParenteraleZubereitung;Rezeptanfrage_Storno "Cancellation of the prescription request for a parenteral preparation"
* $GEM_CS_ATF_ServiceIdentifier#eRezept_ParenteraleZubereitung;Rezeptbestaetigung "Confirmation and transmission of an issued prescription for a parenteral preparation"