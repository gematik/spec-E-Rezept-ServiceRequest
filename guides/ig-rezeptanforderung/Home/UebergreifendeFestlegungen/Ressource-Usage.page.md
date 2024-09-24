---
topic: datenobjekte_im_bundle
---
# {{page-title}}

## Einbetten aller Objekte im Bundle

Das Message Bundle aus dem App-Transport-Framework enthält einen Constraint wonach alle referenzierten Objekte im Bundle und deren Kinder aufgelöst werden müssen. Somit sind entsprechende Informationen in einer Nachricht zu übermitteln.
Zum Beispiel erfordert der ServiceRequest.subject 1..1 die Angabe eines KBV_PR_FOR_Patient. Dieser muss dementsprechend, wie auch alle anderen referenzierten Objekte, im Bundle vorhanden sein.

## Verwendung von .note

Alle Ressourcen, die ein .note Feld enthalten und mit MS geflaggt sind, sind in der UI darzustellen. Beim lesenden Zugriff MÜSSEN Hinweise und Inhalte dem Anwender dargestellt werden. Beim schreibenden Zugriff auf eine Ressource MUSS die UI eine Option zum Verfassen eines Hinweises anbieten.

## Einbetten des E-Rezept-Tokens (ServiceRequest.extension[EPrescriptionToken])

Wenn Informationen zu einem E-Rezept in einem ServiceRequest eingebettet werden, sind `PrescriptionID` und `AccessCode` zu übertragen. Dies soll nach dem Format eines E-Rezept-Tokens geschehen (siehe [gemSpec_DM_eRp](https://gemspec.gematik.de/docs/gemSpec/gemSpec_DM_eRp/)).

Dieses Datenformat wird bereits in der Apotheke genutzt, wenn ein 2D-Code eines E-Rezeptes ausgelesen wird. Daher minimiert es den Implementierungsaufwand, wenn dieses Format beibehalten wird.
