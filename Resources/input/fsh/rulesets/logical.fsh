RuleSet: RS_LOG_MessageHeader
* MetaDaten 1..1 BackboneElement "Metadaten im MessageHeader"
  * Empfaenger 1..* BackboneElement "Empfänger der Nachricht"
    * KIMAdresse 1..1 url "KIM-Adresse des Empfängers"
    * TelematikID 0..1 url "Telematik-ID des Absenders"
  * Absender 1..1 BackboneElement "Absender der Nachricht"
    * TelematikID 0..1 url "Telematik-ID des Absenders"
    * Name 1..1 string "Name des Absenders"
  * AbsendendesSystem 1..1 BackboneElement "Absendendes System"
    * Name 1..1 string "Name des Herstellers des absendenden Systems"
    * Software 1..1 string "Name der Software des absendenden Systems"
    * Version 1..1 string "Version des absendenden Systems"
    * EMailKontakt 1..1 string "E-Mail-Kontakt des absendenden Systems"
    * Website 1..1 url "Website des absendenden Systems"

RuleSet: RS_MAP_MetaDaten
* MetaDaten -> "ERPServiceRequestDispenseRequestHeader"
  * Empfaenger -> "ERPServiceRequestDispenseRequestHeader.destination"
    * KIMAdresse -> "ERPServiceRequestDispenseRequestHeader.destination.endpoint"
    * TelematikID -> "ERPServiceRequestDispenseRequestHeader.destination.receiver.identifier.value"
  * Absender -> "ERPServiceRequestDispenseRequestHeader.sender"
    * TelematikID -> "ERPServiceRequestDispenseRequestHeader.sender.identifier.value"
    * Name -> "ERPServiceRequestDispenseRequestHeader.sender.display"
  * AbsendendesSystem -> "ERPServiceRequestDispenseRequestHeader.source"
    * Name -> "ERPServiceRequestDispenseRequestHeader.source.name"
    * Software -> "ERPServiceRequestDispenseRequestHeader.source.software"
    * Version -> "ERPServiceRequestDispenseRequestHeader.source.version"
    * EMailKontakt -> "ERPServiceRequestDispenseRequestHeader.source.contact.value"
    * Website -> "ERPServiceRequestDispenseRequestHeader.source.endpoint"
