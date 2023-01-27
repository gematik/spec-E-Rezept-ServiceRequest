# UseCases

## UC1: Anforderung aus der Pflegeeinrichtung (Selbstabholen)

### 1. Pflegeeinrichtung -> Arzt

* Bundle
  * MessageHeader
    * event = eRezept;Anforderung;V1.0
    * sender = teleIDPflegeEinrichtung
    * receiver = teleIDArzt
  * ServiceRequest
    * status = *active*
    * basedOn = MedRequest
    * intent = order
    * orderDetail = #SelbstAbholer
    * performer = Ausstellender Arzt
    * requester = Pflegeeinrichtung
    * reasonCode
      * medikamentLäuftAus
  * MedicationRequest
  * RemainingObservation

### 2a Arzt -> Pflegeeinrichtung: ablehnung

* Bundle
  * MessageHeader
    * event = eRezept;Anforderung;V1.0
    * sender = teleIDArzt
    * receiver = teleIDPflegeEinrichtung
  * ServiceRequest
    * status = *revoked*
    * requester = Pflegeeinrichtung
  * reasonCode
    * #keineLust

### 2b Arzt -> Pflegeeinrichtung

* Bundle
  * MessageHeader
    * event = eRezept;Anforderung;V1.0
    * sender = teleIDArzt
    * receiver = teleIDPflegeEinrichtung
  * ServiceRequest
    * status = *completed*
    * basedOn = KBV_Prescription
    * intent = original-order

    * performer = Ausstellender Arzt
    * requester = Pflegeeinrichtung
    * supportingInfo
      * ERezeptToken (Task/Task.id/$accept?ac=AccessCode)
  * KBV_Prescription

## UC2: Anforderung aus der Pflegeeinrichtung (Apothekenbelieferung)

### UC2 1. Pflegeeinrichtung -> Arzt

* Bundle
  * MessageHeader
    * event = eRezept;Anforderung;V1.0
    * sender = teleIDPflegeEinrichtung
    * receiver = teleIDArzt
  * ServiceRequest
    * status = *active*
    * basedOn = MedRequest
    * intent = order
    * orderDetail = #Apothekenbelieferung
    * performer = Ausstellender Arzt
    * requester = Pflegeeinrichtung
    * supportingInformation
      * gewünschteApothekeOrganization(mit telematikID)
    * reasonCode
      * medikamentLäuftAus
  * MedicationRequest
  * RemainingObservation

### UC2 2a Arzt -> Pflegeeinrichtung: ablehnung

* Bundle
  * MessageHeader
    * event = eRezept;Anforderung;V1.0
    * sender = teleIDArzt
    * receiver = teleIDPflegeEinrichtung
  * ServiceRequest
    * status = *revoked*
    * requester = Pflegeeinrichtung
  * reasonCode
    * #apothekeMagIchNicht

### UC2 2b Arzt -> Pflegeeinrichtung

* Bundle
  * MessageHeader
    * event = eRezept;Anforderung;V1.0
    * sender = teleIDArzt
    * receiver = teleIDPflegeeinrichtung
  * ServiceRequest
    * status = *completed*
    * intent = *original-order*
    * orderDetail = #Apothekenbelieferung
    * performer = gewünschteApotheke
    * requester = Pflegeeinrichtung
    * supportingInfo
      * ERezeptToken
      * anApothekeGesendetOrganization

### UC2 2b Arzt -> Apotheke

* Bundle
  * event = eRezept;Anforderung;V1.0
    * sender = teleIDArzt
    * receiver = teleIDApotheke
  * ServiceRequest
    * status = *active*
    * intent = order
    * orderDetail = #Apothekenbelieferung
    * performer = Arzt
    * requester = Pflegeeinrichtung
    * supportingInfo
      * ERezeptToken
      * gewünschteApotheke
