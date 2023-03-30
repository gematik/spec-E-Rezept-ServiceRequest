## {{page-title}}

### `.extension:EPrescriptionTokenEX`

Das schreibende System MUSS dieses Feld korrekt befüllen können, um den Token für den Empfänger nutzbar zu machen.

Ein empfangendes System MUSS dieses Token lesen, verarbeiten und dem Nutzer darstellen können. Weiterhin MUSS es in der Lage sein das Token für einen folgenden Dispense_ServiceRequest einzubetten, um eine Belieferung anzufragen.

### `.identifier:requestId`

Dieser Identifier identifiziert eineindeutig einen einzelnen ServiceRequest. Zur Referenzierung und Zuordnung von ServiceRequest, bspw. wenn ein ServiceRequest einen anderen ersetzen soll, ist es wichtig diese Zuordnung mit dem Identifier treffen zu können.

### `.identifier:predisId`

In einigen Anwendungsfällen werden bedarf es der Information welche Verordnungsanfrage zu welcher Belieferungsanfrage gehört. Wenn bspw. ein Medikament angefragt wird möchte man verfolgen können welche die dazugehörige Belieferungsanfrage ist. Hierzu dient der predisIdentifier, der ein Paar von ServiceRequest**Prescription**Request und ServiceRequest**Dispense**Request zusammengehörig identifiziert.

Das implementierende System muss in der Lage sein diese Verknüpfung herzustellen als auch zu lesen.

### `.basedOn`

Dieses Feld referenziert den zugrundeliegenden MedicationRequest, der die medizinischen Informationen zur Rezeptanfrage enthält. Wenn die Rezeptanfrage gestellt wird KANN das Profil MedicationRequestPrescriptionRequest genutzt werden.
Wenn die Verordnung erstellt wurde ist der entsprechende KBV_PR_ERP_Bundle-Verordnungsdatensatz zu referenzieren.

### `.status`



### `.code`


### `.orderDetail`


### `.subject`


### `.occurenceDateTime`


### `.authoredOn`


### `.requester`


### `.performer`


### `reasonCode`


### `.supportingInfo:AuslieferndeApotheke`


### `.note`


