---
topic: datenobjekte_im_bundle
---
## {{page-title}}

### Einbetten aller Objekte im Bundle

Das Message Bundle aus dem App-Transport-Framework enthält einen Constraint wonach alle referenzierten Objekte im Bundle und deren Kinder aufgelöst werden müssen. Somit sind entsprechende Informationen in einer Nachricht zu übermitteln.
Zum Beispiel erfordert der ServiceRequest.subject 1..1 die Angabe eines KBV_PR_FOR_Patient. Dieser muss dementsprechend, wie auch alle anderen referenzierten Objekte, im Bundle vorhanden sein.

### Verwendung von .note

Alle Ressourcen, die ein .note Feld enthalten und mit MS geflaggt sind, sind in der UI darzustellen. Beim lesenden Zugriff MÜSSEN Hinweise und Inhalte dem Anwender dargestellt werden. Beim schreibenden Zugriff auf eine Ressource MUSS die UI eine Option zum Verfassen eines Hinweises anbieten.