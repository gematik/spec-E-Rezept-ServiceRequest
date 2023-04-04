## {{page-title}}

Dieser Identifier bildet eine Vorgangs-ID ab und wird unter `ServiceRequest.requisition` angegeben. Innerhalb eines Vorgangs können verschiedene Medikamente angefragt werden für die jeweils ein ServiceRequest erstellt wird. Diese Vorgangs-ID verknüpft nun alle ServiceRequests, die diesem Vorgang zugeordnet sind.

Diese Vorgangs-ID wird vom schreibenden System vergeben und ist von den anderen Sytemen, die den ServiceRequest bearbeiten nicht zu verändern!

Falls ein anderes System als das ursprünglich anfragende einen neuen ServiceRequest erstellt, ist die Vorgangs-ID von vorhandenen ServiceRequests zu übernehmen.

Bspw. erstellt im Anwendungsfall {{pagelink:Home/Anwendungsfaelle/Rezeptanforderung-UC1}}, wenn `ServiceRequest.orderDetail.code = #send-to-pharmacy` gesetzt ist, das PVS die Belieferungsanfrage. Hier ist also die selbe Vorgangs-ID aus `ServiceRequest.requisition` aus der Verordnungsanfrage in die Belieferungsanfrage zu übernehmen.
