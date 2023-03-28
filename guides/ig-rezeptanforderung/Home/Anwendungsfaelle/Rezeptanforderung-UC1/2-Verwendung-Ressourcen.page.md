## {{page-title}}

### Übermittlung einer Rezeptanforderung an einen Verordnenden (**[1]**)

{{render:guides/ig-rezeptanforderung/images/puml_images/UC1_1.png}}

Eine Pflegeeinrichtung benötigt ein E-Rezept, um einen Patienten mit Medikamenten zu versorgen. Diese fragt nun einen Arzt um eine entsprechende Verordnung an.

Hierfür MUSS im Bundle folgende Inhalte geliefert werden:

`Verordnungsanfrage (ServiceRequestPrescriptionRequest)`

* .status = #active
* .basedOn = MedicationRequestPrescriptionRequest
* .orderDetail = #return-to-requester (Dieser Code signalisiert dem PVS, dass der Token in die Antwort an den Anfragenden eingebettet werden muss)

`Angefragte Medikation (MedicationRequestPrescriptionRequest)`

* .extension:PriorPrescriptionID (falls vorhanden)
* .medication[x] (Angabe der benötigten Medikation)

Falls gewünscht kann noch strukturiert angegeben werden warum diese Medikation gebraucht wird über `ServiceRequest.reasonCode` und `ServiceRequest.reasonReference`.

#### Stornierung - Anfrage

Falls der Anfragende die Anfrage stornieren möchte, wird der gleiche ServiceRequest (.identifer:requestId muss gleich sein) erneut an den Verordnenden versendet und

* .status = #revoked

angegeben. Hierzu kann ebenfalls ein Grund unter `ServiceRequest.reasonCode` angegeben werden.

### Übermittlung der Verordnung an den Anfragenden (**[2-5]**)

Der Arzt kann, in dem Fall, dass er zustimmt, diese Verordnung nun erstellen, signieren und im E-Rezept Fachdienst einsetellen (**[2]**).

Der Arzt erhält in der Antwort vom Fachdienst die PrescriptionID und den AccessCode (**[3]**). Beide Informationen werden benötigt, um eine Verordnung in einer Apotheke einzulösen.

Der Arzt übermittelt diese Informationen in Form des E-Rezept-Tokens (siehe [gemSpec_DM_eRp](https://fachportal.gematik.de/dokumentensuche?tx_gemcharacteristics_productlist%5BformIdentifier%5D=form-2849&tx_gemcharacteristics_productlist%5Btype%5D=ProdT&tx_gemcharacteristics_productlist%5Bproducttype%5D=107&tx_gemcharacteristics_productlist%5Bproducttypeversion%5D=75#c2849)) an die Pflegeeinrichtung (**[4]**).

Hierfür MUSS im Bundle folgende Inhalte geliefert werden:

`Verordnungsanfrage (ServiceRequestPrescriptionRequest)`

* .extension:EPrescriptionToken.value = *E-Rezept-Token*
* .status = #completed
* .basedOn = KBV_PR_ERP_Prescription

Der Token muss nun vom Pflegesystem für die Weiterverarbeitung und das Erstellen einer Dispensierungsanfrage gespeichert werden (**[5]**).

#### Stornierung - Verordnung

Der Arzt kann das Ausstellen der Verordnung auch ablehnen. Hierbei ist `ServiceRequest.status` auf `#revoked` zu setzen und ein Grund unter `ServiceRequest.reasonCode` auszuwählen und anzugeben.

### Anfragen einer Abgabe durch eine Apotheke (**[6]**)

{{render:guides/ig-rezeptanforderung/images/puml_images/UC1_2.png}}

Die Pflegeeinrichtung ist nun im Besitz der Informationen, um ein Rezept in einer beliebigen Apotheke einzulösen. Über eine Anfrage der Apotheke zur Dispensierung eines Medikamentes ([6]), kann die Pflegeeinrichtung nun mit den verordneten Medikamenten beliefert werden.

Hierfür MUSS im Bundle folgende Inhalte geliefert werden:

`Anfrage zum Beliefern einer Verordnung (ServiceRequestDispenseRequest)`

* .extension:EPrescriptionToken.value = *E-Rezept-Token*
* .status = #active
* .basedOn = KBV_PR_ERP_Prescription
* .supportingInfo:AusstellenderArzt (Für eventuelle Rückfragen an den Verordnenden)

### Übermittlung der Auslieferungsbestätigung an den Anfragenden (**[7-8]**)

Mit Besitz des Tokens ist eine Apotheke in der Lage den E-Rezept-Fachdienst nach dem Rezept abzufragen und kann dieses entsprechend bearbeiten (**[7]**).
Die Apotheke kann nun im letzten Schritt die Verarbeitung der Anfrage und die Belieferung bestätigen (**[8]**).

Hierfür MUSS im Bundle folgende Inhalte geliefert werden:

`Anfrage zum Beliefern einer Verordnung (ServiceRequestDispenseRequest)`

* .status = #completed

#### Stornierung - Abgabe

Die Apotheke kann die Dispensierung der Abgabe auch ablehnen. Hierbei ist `ServiceRequest.status` auf `#revoked` zu setzen und nach Möglichkeit ein Hinweis unter `ServiceRequest.note` anzuzeigen.
