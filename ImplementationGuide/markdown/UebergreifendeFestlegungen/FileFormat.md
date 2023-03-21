# Dateiformat

Der FHIR-Standard beschreibt drei verschiedene [Repräsentationsformate](http://hl7.org/fhir/formats.html#wire): XML, JSON und RDF (Turtle).

Im Rahmen der MedReq-Spezifikation MUSS umsetzende Systeme, analog zum Austausch mit dem E-Rezept Fachdienst, das Format [XML](http://hl7.org/fhir/xml.html) unterstützten.

Zur erhöhten Interoperabilität auch mit Blick auf die Zukunft mit vermehrtem Einsatz von mobilen Endgeräten SOLL das System auch das Austauschformat [JSON](http://hl7.org/fhir/json.html) unterstützen.

Je nach Transportmedium MUSS nach Möglichkeit die Information des gewählten Dateiformats übermittelt werden, z.B. in Form eines HTTP-Headers.
