## Vorgaben zu Identifiern in der Rezeptanforderung

### Identifer im ServiceRequest

Eine Rezeptanforderung soll einen hohen Grad an Automatisierung ermöglichen. Dazu ist es wichtig, dass Identifier genutzt werden, um eine Verknüpfung von Daten zu ermöglichen. Der ServiceRequest ist die zentrale Ressource in einem Vorgang, die mit Identifiern angereichert werden kann.

Folgende Identifier sind im Profil [ERPServiceRequestPrescriptionRequest](./StructureDefinition-erp-service-request-prescription-request.html) und [ERPServiceRequestDispenseRequest](./StructureDefinition-erp-service-request-dispense-request.html) anzugeben:

|Element im ServiceRequest|Identifier Profil|Beschreibung|
|---|---|
|identifier:requestId|[ERPServiceRequestRequestIdentifier](./StructureDefinition-erp-service-request-request-identifier.html)|Eine eindeutige Anfrage ID, die eine konkrete Anfrage referenziert. Dieser Wert wird erzeugt, wenn ein Anfragender initial den ServiceRequest erstellt. 
Systeme, die einen ServiceRequest auswerten und bearbeiten müssen bei Antworten den Identifier wieder mit angeben.|
|requisition|[ERPServiceRequestProcedureIdentifier](./StructureDefinition-erp-service-request-procedure-identifier.html)|Identifiziert einen Fall, der mehrere ServiceRequests verknüpfen kann. Wenn bspw. für einen Versicherten mehrere Arzneimittel angefragt werden, kann in diesen ServiceRequests die gleiche identifier in `.requisition` angegeben werden.
Der Wert wird vom Anfragenden generiert und muss bei einer Antwort angegeben werden.|

Darüber hinaus gibt es in ServiceRequest.identifier durch die offene Profilierung die Möglichkeit weitere Identifier einem Request anzuhängen. Diese können z.B. aus regionalen Kooperationen entstehen oder aus fachlichen Gründen definiert worden sein.

WICHTIG: Wenn ein Objekt (z.B. ein ServiceRequest) bearbeitet, modifiziert und dann weitergeleitet wird MÜSSEN alle Identifier, die unter `ServiceRequest.identifier` angegeben wurden verarbeitet und in einer Antwort angehangen werden.


### Anwendungsfall Rezeptanforderung für anwendungsfertige Zytostatikazubereitungen

In Abstimmung mit den Industriepartnern wurden für den Anwendungsfall [Rezeptanforderung für anwendungsfertige Zytostatika Zubereitungen](./usecase-4-zyto.html) folgende Identifier definiert:

|Fachliche Beschreibung|.identifier.system|
|---|---|
|Patienten-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/erp-servicerequest/sid/patient-id"|
|Fall-ID für die Verwendung in einer Taxierungssoftware|"https://gematik.de/fhir/erp-servicerequest/sid/case-id"|
|Vorgangs-ID für die Verwendung in einer Taxierungssoftware, abweichend von .requisition|"https://gematik.de/fhir/erp-servicerequest/sid/process-id"|

Für diese Identifier wurden keine Profile erstellt, sondern sind vom schreibenden System zu setzen.