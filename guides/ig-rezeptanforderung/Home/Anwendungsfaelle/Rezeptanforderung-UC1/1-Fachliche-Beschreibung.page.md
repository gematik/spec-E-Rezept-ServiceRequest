## {{page-title}}

In diesem Anwendungsfall löst ein Anfragender (z.B. eine Pflegeeinrichtung) den Prozess aus und stellt eine Rezeptanfrage an einen Verordnenden Arzt. Der Arzt kann nun die Anfrage bearbeiten und ein E-Rezept erstellen. Ist dies geschehen sendet der Arzt das E-Rezept-Token an den Anfragenden zurück.
Dieser kann nun das Token an eine Apotheke seiner Wahl übermitteln, die daraufhin das E-Rezept einlösen und das Präparat dispensieren kann.

### Anfragen einer Verordnung durch einen Arzt

Eine Pflegeeinrichtung benötigt eine Verordnung für ein Medikament. Diese fragt nun einen Arzt um eine entsprechende Verordnung an (**[1]**).

Der Arzt kann, in dem Fall, dass er zustimmt, diese Verordnung nun erstellen, signieren und im E-Rezept Fachdienst einsetellen (**[2]**). Der Arzt erhält in der Antwort vom Fachdienst die PrescriptionID und den Access Code (**[3]**). Beide Informationen werden benötigt, um eine Verordnung in einer Apotheke einzulösen.

Der Arzt übermittelt diese Informationen in Form des E-Rezept-Tokens (siehe [gemSpec_DM_eRp](https://fachportal.gematik.de/dokumentensuche?tx_gemcharacteristics_productlist%5BformIdentifier%5D=form-2849&tx_gemcharacteristics_productlist%5Btype%5D=ProdT&tx_gemcharacteristics_productlist%5Bproducttype%5D=107&tx_gemcharacteristics_productlist%5Bproducttypeversion%5D=75#c2849)) an die Pflegeeinrichtung (**[4]**).

{{render:guides/ig-rezeptanforderung/images/puml_images/UC1_1.png}}

### Anfragen einer Abgabe durch eine Apotheke

Die Pflegeeinrichtung ist nun im Besitz der Informationen, um ein Rezept in einer beliebigen Apotheke einzulösen. Über eine Anfrage der Apotheke zur Dispensierung eines Medikamentes ([4]), kann die Pflegeeinrichtung nun mit den verordneten Medikamenten beliefert werden.
Die Apotheke kann nun im letzten Schritt die Verarbeitung der Anfrage und die Belieferung bestätigen ([5]).

{{render:guides/ig-rezeptanforderung/images/puml_images/UC1_2.png}}
