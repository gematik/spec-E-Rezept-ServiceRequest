## Motivation

Dieser Identifier dient als übergeordnete ID, die einen Vorgang darstellt.
Wenn bspw. eine anfragende Pflegeeinrichtung mehrere Verordnungen für einen Patienten anfordern und/oder Verordnungen für mehrere Patienten angefragt werden, wird ein Vorgang im Pflegesystem gestartet, der diese Anfragen bündelt. Der Procedure Identifier wird unter ServiceRequest.requisition allen Service Requests angehangen, die in diesem Vorgang enthalten sind.

Nachdem dieser Identifier vergeben wurde, dürfen verarbeitende Systeme diesen nicht verändern und müssen ihn in der Antwort mitgeben.
