---
topic: datenobjekte_im_bundle
---
## {{page-title}}

### Einbetten aller Objekte im Bundle

Das Message Bundle aus dem App-Transport-Framework enthält einen Constraint wonach alle referenzierten Objekte im Bundle und deren Kinder aufgelöst werden müssen. Somit sind entsprechende Informationen in einer Nachricht zu übermitteln.
Zum Beispiel erfordert der ServiceRequest.subject 1..1 die Angabe eines KBV_PR_FOR_Patient. Dieser muss dementsprechend, wie auch alle anderen referenzierten Objekte, im Bundle vorhanden sein.

### Verwendung von .note

Alle Ressourcen, die ein .note Feld enthalten und mit MS geflaggt sind, sind in der UI darzustellen. Beim lesenden Zugriff MÜSSEN Hinweise und Inhalte dem Anwender dargestellt werden. Beim schreibenden Zugriff auf eine Ressource MUSS die UI eine Option zum Verfassen eines Hinweises anbieten.

### Einbetten des E-Rezept-Tokens (ServiceRequest.extension[EPrescriptionToken])

Wenn Informationen zu einem E-Rezept in einem ServiceRequest eingebettet werden sind `PrescriptionID` und `AccessCode` zu übertragen. Dies soll nach dem Format eines E-Rezept-Tokens geschehen (siehe [gemSpec_DM_eRp](https://fachportal.gematik.de/dokumentensuche?tx_gemcharacteristics_productlist%5BformIdentifier%5D=form-2849&tx_gemcharacteristics_productlist%5Btype%5D=ProdT&tx_gemcharacteristics_productlist%5Bproducttype%5D=107&tx_gemcharacteristics_productlist%5Bproducttypeversion%5D=75#c2849)).
