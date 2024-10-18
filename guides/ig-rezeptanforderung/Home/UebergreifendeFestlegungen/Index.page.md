# {{page-title}}

In diesem Kapitel werden übergreifende Festlegungen definiert, die generell für diese Spezifikation gelten.

## Methodik

Anforderungen als Ausdruck normativer Festlegungen werden durch die dem [RFC2119](https://tools.ietf.org/html/rfc2119) entsprechenden, in Großbuchstaben geschriebenen deutschen Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN sowie ihrer Pluralformen gekennzeichnet.

### Angabe von Codes im IG

In der Beschreibung der Anwendungsfälle werden Codes aus FHIR-CodeSystemen erwähnt. Diese sind in Texten und Bildern mit einem '#' gekennzeichnet, um klarzustellen, dass es sich um einen Code handelt. Beispiel: #issue-prescription aus dem CodeSystem {{pagelink:Home/Datenobjekte/Terminologien/codesystems/service-request-type-cs.page.md}}:


## Dateiformat

Der FHIR-Standard beschreibt drei verschiedene [Repräsentationsformate](http://hl7.org/fhir/formats.html#wire): XML, JSON und RDF (Turtle).
Im Rahmen dieser Spezifikation MUSS umsetzende Systeme das Format [XML](http://hl7.org/fhir/xml.html) unterstützten.
Je nach Transportmedium MUSS nach Möglichkeit die Information des gewählten Dateiformats übermittelt werden, z.B. in Form eines HTTP-Headers.

## Must Support

Felder der FHIR-Spezifikation, die mit "Must Support" (MS) geflaggt sind, SOLLEN derart umgesetzt werden, dass die Inhalte dem Nutzer sichtbar gemacht werden und wo nötig auch bearbeitbar sind.

Wenn die entsprechende Information vorliegt, bzw. eingeholt werden kann, MUSS dieses Feld befüllt werden.
Wenn ein Feld befüllt ist MUSS die entsprechende Information im Frontend sichtbar gemacht, bzw. verarbeitet werden können.
Felder, die Referenzen zu anderen Objekten aufweisen und mit "MS" gekennzeichnet sind MUSS das referenzierte Objekt verarbeiten und darstellen können.

## Weitere Vorgaben:
Im folgenden werden weitere Festlegungen definiert:

{{index:children}}
