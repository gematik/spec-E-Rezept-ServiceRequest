<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir">
    <!-- Root template -->
    <xsl:template match="/">
        <!-- Extract the eventCode -->
        <xsl:variable name="eventCode"
            select="/fhir:Bundle/fhir:entry/fhir:resource/fhir:MessageHeader/fhir:eventCoding/fhir:code/@value" />
        <!-- Determine the rootBundle based on the eventCode -->
        <xsl:choose>
            <xsl:when test="$eventCode = 'eRezept_Rezeptanforderung;NachrichtKopie'">
                <xsl:call-template name="main_template">
                    <xsl:with-param name="eventCode" select="$eventCode" />
                    <xsl:with-param name="rootBundle"
                        select="/fhir:Bundle/fhir:entry/fhir:resource/fhir:Bundle" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="main_template">
                    <xsl:with-param name="eventCode" select="$eventCode" />
                    <xsl:with-param name="rootBundle" select="/fhir:Bundle" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- Master template for Bundle -->
    <xsl:template name="main_template">
        <xsl:param name="eventCode" />
        <xsl:param name="rootBundle" />
        <html>
            <head>
                <title>FHIR Message Bundle</title>
                <style type="text/css">
                    @page {
                        size: A4 landscape;
                        margin: 20mm;
                    }
                    body {
                        font-family: 'Verdana', sans-serif;
                        line-height: 1.6;
                        color: #333;
                        margin: 0;
                        padding: 0;
                    }
                    #gesamtseite {
                        display: flex;
                        flex-direction: column;
                        align-items: flex-start;
                        padding: 40px;
                        gap: 40px;
                        background: #FFFFFF;
                    }
                    .header-info {
                        display: flex;
                        flex-direction: column;
                        width: 100%;
                    }
                    .sender-info, .receiver-info {
                        font-size: 14px;
                        line-height: 1.4;
                        color: #000;
                        margin-bottom: 30px;
                    }
                    .sender-info p {
                        margin: 0;
                    }
                    .request-body {
                        display: flex;
                        flex-direction: column;
                        gap: 40px;
                        width: 100%;
                        background: #000000;
                    }
                    .request-content {
                        width: 100%;
                    }
                    .request-content-service-request {
                        box-sizing: border-box;
                        display: flex;
                        flex-direction: column;
                        align-items: flex-start;
                        margin-bottom: 24px;
                        padding: 24px 16px;
                        background: #FFFFFF;
                        border: 1px solid #A7A7A7;
                        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
                    }
                    .sr-patient-info {
                        display: flex;
                        justify-content: space-between;
                        align-items: flex-end;
                        width: 100%;
                        gap: 20px;
                        margin-bottom: 20px;
                    }
                    .patient-info {
                        font-weight: bold;
                        font-size: 14px;
                        align-self: flex-end;
                        flex-grow: 1;
                        white-space: nowrap;
                        overflow: hidden;
                        text-overflow: ellipsis;
                    }
                    .subject-date {
                        align-self: flex-end;
                        text-align: right;
                        font-size: 0.9em;
                        color: #777;
                        white-space: nowrap;
                    }
                    table {
                        width: calc(100% - 40px);
                        border-collapse: collapse;
                        margin-top: 20px;
                        border: none;
                        font-size: 0.9em;
                    }
                    th, td {
                        padding: 10px;
                        text-align: left;
                        border-right: 1px solid #ccc;
                        vertical-align: top;
                    }
                    th {
                        background-color: #f2f2f2;
                        font-weight: bold;
                        text-align: center;
                    }
                    td:last-child, th:last-child {
                        border-right: none;
                    }
                    .subject h2 {
                        font-size: 1.8em;
                        margin: 0;
                    }
                    .urgent-pill, .mvo-pill, .redeem-pill, .changed-pill {
                        display: inline-block;
                        padding: 5px 15px;
                        border-radius: 20px;
                        font-size: 0.9em;
                        font-weight: bold;
                        color: white;
                        margin-right: 10px;
                    }
                    .urgent-pill { background-color: #FF5765; }
                    .mvo-pill { background-color: #008F71; }
                    .redeem-pill { background-color: #345A92; }
                    .changed-pill { background-color: #F1896F; }
                    .subject-date {
                        text-align: right;
                        font-size: 0.9em;
                        color: #777;
                    }
                    .subject h2 {
                        font-size: 1.8em;
                        margin: 0;
                        margin-bottom: 30px;
                    }
                    .identifier-info {
                        display: block;
                        background-color: #e0e0e0;
                        color: #333;
                        padding: 5px;
                        border-radius: 5px;
                        font-size: 0.8em;
                        text-align: center;
                        font-weight: bold;
                        margin-top: 10px;
                    }
                    .service-request-info {
                        width: 100%;
                    }
                    .service-request-header {
                        font-weight: bold;
                        font-size: 1.2em;
                        padding: 10px;
                        border-bottom: 1px solid #ccc;
                        margin-bottom: 10px;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }
                    .service-request-box:last-child {
                        margin-bottom: 40px;
                        border-bottom: 1px dashed #000000;
                    }
                    .service-request-box {
                        border: none;
                        border-top: 1px dashed #000000;
                        padding: 15px;
                    }
                    .reason-and-pill-container {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-top: 10px;
                        gap: 20px;
                    }
                    .pill-container {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 10px;
                    }
                    .reason-section {
                        flex-grow: 1;
                        margin-top: 20px;
                    }
                    .token-section {
                        margin-top: 20px;
                    }
                    .copy-sender-info {
                        margin-top: 20px;
                        padding: 10px;
                        border-top: 1px dashed #ccc;
                        font-size: 0.9em;
                        color: #555;
                    }
                    hr {
                        border: 0;
                        border-top: 1px dashed #ccc;
                        margin: 20px 0;
                    }
                </style>
            </head>
            <body>
                <div id="gesamtseite">
                    <!-- Briefkopf mit Sender und Empfänger -->
                    <div class="header-info">
                        <!-- Sender Informationen -->
                        <xsl:call-template name="sender-info">
                            <xsl:with-param name="rootBundle" select="/fhir:Bundle" />
                        </xsl:call-template>
                        <!-- Empfänger Informationen -->
                        <xsl:call-template name="receiver-info">
                            <xsl:with-param name="rootBundle" select="/fhir:Bundle" />
                        </xsl:call-template>
                    </div>
                    <!-- Body des Requests -->
                    <div class="request-content">
                        <!-- Betreffzeile -->
                        <xsl:call-template name="letter-subject-info">
                            <xsl:with-param name="rootBundle" select="$rootBundle" />
                        </xsl:call-template>
                        <!-- Je Patienten eine Tabelle anzeigen -->
                        <xsl:for-each select="$rootBundle/fhir:entry/fhir:resource/fhir:Patient">
                            <xsl:variable name="patientRef" select="fhir:id/@value" />
                            <div class="request-content-service-request">
                                <xsl:choose>
                                    <xsl:when test="$eventCode = 'eRezept_Rezeptanforderung;Abgabeanfrage'">
                                        <!-- Fall 1: Abgabeanfrage -->
                                        <xsl:call-template name="dispense-request-info">
                                            <xsl:with-param name="patientRef" select="$patientRef" />
                                            <xsl:with-param name="rootBundle" select="$rootBundle" />
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!-- Fall 2: Rezeptanforderung -->
                                        <xsl:call-template name="service-request-info">
                                            <xsl:with-param name="patientRef" select="$patientRef" />
                                            <xsl:with-param name="rootBundle" select="$rootBundle" />
                                        </xsl:call-template>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!-- Page Break after each Patient -->
                                <div style="page-break-after: always;"></div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    <!-- Senderinformation -->
    <xsl:template name="sender-info">
        <xsl:param name="rootBundle" />
        <div class="sender-info">
            <xsl:for-each
            select="/fhir:Bundle/fhir:entry/fhir:resource/fhir:MessageHeader">
                <xsl:variable
                name="respRef" select="fhir:responsible/fhir:reference" />
                <xsl:for-each
                select="/fhir:Bundle/fhir:entry[fhir:fullUrl = $respRef]">
                    <!-- Name und Straße -->
                    <xsl:for-each select="fhir:resource/fhir:Organization">
                        <p>
                            <strong>
                                <xsl:value-of select="fhir:name/@value" />
                            </strong>
                        </p>
                        <p>
                            <xsl:for-each select ="fhir:address/fhir:line">
                                <xsl:value-of select="@value" />
                            </xsl:for-each>
                            <span>, </span>
                            <xsl:value-of select="fhir:address/fhir:postalCode/@value" />
                            <span>,&#160;</span>
                            <xsl:value-of select="fhir:address/fhir:city/@value" />
                        </p>
                        <p>
                            <xsl:call-template name="contact-info">
                                <xsl:with-param name="rootBundle" select="/fhir:Bundle" />
                                <xsl:with-param name="contactRef" select="$respRef" />
                            </xsl:call-template>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- Sender - Kontaktinformationen -->
            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- Kontaktinformationen -->
    <xsl:template name="contact-info">
        <xsl:param name="rootBundle" />
        <xsl:param name ="contactRef" />
        <div class="contact-info">
            <xsl:for-each
            select="$rootBundle/fhir:entry/fhir:resource/fhir:MessageHeader">
                <!-- Find the corresponding Organization by matching the reference -->
                <xsl:for-each
                select="$rootBundle/fhir:entry[fhir:fullUrl = $contactRef]">
                    <xsl:for-each select="fhir:resource/fhir:Organization">
                        <p>
                            Tel.:
                            <xsl:value-of
                        select="fhir:contact/fhir:telecom[fhir:system/@value = 'phone']/fhir:value/@value" />
                            <br />
                            
                            <xsl:choose>
                                <!-- Check if the string contains a colon -->
                                <xsl:when test="contains(fhir:contact/fhir:telecom[fhir:system/@value = 'email']/fhir:value/@value, ':')">
                                    <!-- Print the part after the colon -->
                                    KIM: <xsl:value-of select="substring-after(fhir:contact/fhir:telecom[fhir:system/@value = 'email']/fhir:value/@value, ':')" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- Print the whole string if no colon is present -->
                                    KIM: <xsl:value-of select="fhir:contact/fhir:telecom[fhir:system/@value = 'email']/fhir:value/@value" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- Empfänger Informationen -->
    <xsl:template name="receiver-info">
        <xsl:param name="rootBundle" />
        <!-- Find the MessageHeader in the rootBundle -->
        <xsl:for-each
            select="$rootBundle/fhir:entry/fhir:resource/fhir:MessageHeader">
            <!-- Retrieve the responsible reference, which points to the Organization -->
            <div class="receiver-info">
                <span class="name">
                    <strong>
                        <xsl:value-of select="fhir:destination/fhir:name/@value" />
                    </strong>
                </span>
                <br />
                <span class="email">
                    KIM:
                    <xsl:choose>
                        <!-- Check if the string contains a colon -->
                        <xsl:when test="contains(fhir:destination/fhir:endpoint/@value, ':')">
                            <!-- Print the part after the colon -->
                            <xsl:value-of select="substring-after(fhir:destination/fhir:endpoint/@value, ':')" />
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- Print the whole string if no colon is present -->
                            <xsl:value-of select="fhir:destination/fhir:endpoint/@value" />
                        </xsl:otherwise>
                    </xsl:choose>
                </span>
            </div>
        </xsl:for-each>
    </xsl:template>
    <!-- Betreff -->
    <xsl:template name="letter-subject-info">
        <xsl:param name="rootBundle" />
        <div class="letter-subject-info">
            <xsl:for-each
            select="/fhir:Bundle/fhir:entry/fhir:resource/fhir:MessageHeader">
                <!-- Betreff -->
                <div class="subject">
                    <h2>
                        <xsl:choose>
                            <!-- Specific codes and corresponding subject values -->
                            <xsl:when
                            test="fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Rezeptanfrage'">
                                <xsl:text>Rezeptanforderung</xsl:text>
                            </xsl:when>
                            <xsl:when
                            test="fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Rezeptanfrage_Storno'">
                                <xsl:text>Stornierung einer Rezeptanfrage</xsl:text>
                            </xsl:when>
                            <xsl:when
                            test="fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung'">
                                <xsl:text>Ablehnung einer Rezeptanfrage</xsl:text>
                            </xsl:when>
                            <xsl:when
                            test="fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Rezeptbestaetigung'">
                                <xsl:text>Rezeptbestätigung und Übermittlung</xsl:text>
                            </xsl:when>
                            <xsl:when
                            test="fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Abgabeanfrage'">
                                <xsl:text>Anfrage zur Abgabe eines Medikaments</xsl:text>
                            </xsl:when>
                            <xsl:when
                            test="fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Abgabebestaetigung'">
                                <xsl:text>Bestätigung der Medikamentenabgabe</xsl:text>
                            </xsl:when>
                            <xsl:when
                            test="fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;NachrichtKopie'">
                                <xsl:choose>
                                    <xsl:when
                                    test="$rootBundle/fhir:entry/fhir:resource/fhir:MessageHeader/fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Rezeptanfrage'">
                                        <xsl:text>Kopie einer Rezeptanforderung</xsl:text>
                                    </xsl:when>
                                    <xsl:when
                                    test="$rootBundle/fhir:entry/fhir:resource/fhir:MessageHeader/fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Rezeptanfrage_Storno'">
                                        <xsl:text>Kopie einer Stornierung einer Rezeptanforderung</xsl:text>
                                    </xsl:when>
                                    <xsl:when
                                    test="$rootBundle/fhir:entry/fhir:resource/fhir:MessageHeader/fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Rezeptanfrage_Ablehnung'">
                                        <xsl:text>Kopie einer Ablehnung einer Rezeptanforderung</xsl:text>
                                    </xsl:when>
                                    <xsl:when
                                    test="$rootBundle/fhir:entry/fhir:resource/fhir:MessageHeader/fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Rezeptbestaetigung'">
                                        <xsl:text>Kopie einer Rezeptbestätigung</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                            <!-- Default subject if no matching code is found -->
                            <xsl:otherwise>
                                <xsl:text>Unknown Subject</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </h2>
                </div>
                <xsl:if
                test="fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;NachrichtKopie'">
                    <div class="copy-sender-info clear">
                        <p>Dies ist die Kopie einer initialen Nachricht, gesendet von:</p>
                        <xsl:call-template name="sender-info">
                            <xsl:with-param name="rootBundle" select="$rootBundle" />
                        </xsl:call-template>
                        <br />
                        <p>an: </p>
                        <br />
                        <xsl:call-template name="receiver-info">
                            <xsl:with-param name="rootBundle" select="$rootBundle" />
                        </xsl:call-template>
                    </div>
                </xsl:if>
            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- Adjust service-request-info template to use rootBundle -->
    <xsl:template name="service-request-info">
        <xsl:param name="patientRef" />
        <xsl:param name="rootBundle" />
        <div class="service-request-info">
            <xsl:call-template
            name="sr-patient-info">
                <xsl:with-param name="patientRef" select="$patientRef" />
                <xsl:with-param name="rootBundle" select="$rootBundle" />
            </xsl:call-template>
            <!-- Template for displaying information about each ServiceRequest in the Bundle -->
            <div
            class="service-request">
                <xsl:for-each
                select="$rootBundle/fhir:entry/fhir:resource/fhir:ServiceRequest[fhir:subject/fhir:reference/@value = concat('Patient/', $patientRef)]">
                    <div class="service-request-box">
                        <table>
                            <thead>
                                <tr>
                                    <th>Nr.</th>
                                    <th>Artikel</th>
                                    <th>Pkg</th>
                                    <th>ME</th>
                                    <th>DOS</th>
                                    <th>Reichweite/ Bedarfszeitraum</th>
                                    <th>Notiz</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <!-- Nr. -->
                                    <td>
                                        <xsl:value-of select="position()" />
                                    </td>
                                    <!-- Medication -->
                                    <td>
                                        <xsl:variable name="medReqRef"
                                        select="fhir:basedOn/fhir:reference/@value" />
                                        <div>
                                            <xsl:for-each
                                            select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
                                                <xsl:variable name="medicationRef"
                                                select="fhir:medicationReference/fhir:reference/@value" />
                                                <xsl:call-template
                                                name="medication-info">
                                                    <xsl:with-param name="medicationRef"
                                                    select="$medicationRef" />
                                                    <xsl:with-param name="rootBundle"
                                                    select="$rootBundle" />
                                                </xsl:call-template>
                                            </xsl:for-each>
                                        </div>
                                    </td>
                                    <!-- Menge je Packung -->
                                    <td>
                                        <xsl:variable name="medReqRef"
                                        select="fhir:basedOn/fhir:reference/@value" />
                                        <xsl:for-each
                                        select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
                                            <xsl:variable name="medicationRef"
                                            select="fhir:medicationReference/fhir:reference/@value" />
                                            <xsl:for-each select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medicationRef) + 1) = $medicationRef]/fhir:resource/fhir:Medication">
                                                <xsl:value-of select="fhir:amount/fhir:numerator/fhir:extension[@url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize']/fhir:valueString/@value" />
                                                <xsl:value-of select="fhir:amount/fhir:numerator/fhir:unit/@value" />
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </td>
                                    <!-- Mengeneinheiten -->
                                    <td>
                                        <xsl:variable name="medReqRef"
                                        select="fhir:basedOn/fhir:reference/@value" />
                                        <xsl:for-each
                                        select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
                                            <xsl:value-of
                                            select="fhir:dispenseRequest/fhir:quantity/fhir:value/@value" />
                                            <span>&#160;</span>
                                            <xsl:choose>
                                                <xsl:when test="fhir:dispenseRequest/fhir:quantity/fhir:unit/@value">
                                                    <xsl:value-of select="fhir:dispenseRequest/fhir:quantity/fhir:unit/@value" />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="translate(fhir:dispenseRequest/fhir:quantity/fhir:code/@value, '{}', '')" />
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </td>
                                    <!-- Dosieranweisung -->
                                    <td>
                                        <xsl:variable name="medReqRef"
                                        select="fhir:basedOn/fhir:reference/@value" />
                                        <xsl:for-each
                                        select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
                                            <xsl:value-of
                                            select="fhir:dosageInstruction/fhir:text/@value" />
                                            <xsl:if test="fhir:dosageInstruction/fhir:patientInstruction/@value">
                                                <br/>
                                                <xsl:value-of
                                                select="fhir:dosageInstruction/fhir:patientInstruction/@value" />
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                    <!-- Reichweite und Bedarf -->
                                    <td>
                                        <xsl:for-each select="fhir:reasonCode/fhir:extension">
                                            <xsl:choose>
                                                <xsl:when
                                                test="@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/remaining-supply-ex'">
                                                    <xsl:value-of
                                                    select="concat(fhir:valueQuantity/fhir:value/@value, ' ', fhir:valueQuantity/fhir:unit/@value)" />
                                                </xsl:when>
                                                <xsl:when
                                                test="@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/remaining-supply-free-text-ex'">
                                                    <xsl:value-of select="fhir:valueString/@value" />
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:for-each>
                                        <xsl:if test="fhir:occurrenceDateTime">
                                            <span>/
                                                <br/>bis
                                            </span>
                                            <xsl:variable name="occurrenceDateTime"
                                            select="fhir:occurrenceDateTime/@value" />
                                            <xsl:value-of
                                            select="concat(substring($occurrenceDateTime, 9, 2), '.', substring($occurrenceDateTime, 6, 2), '.', substring($occurrenceDateTime, 1, 4))" />
                                        </xsl:if>
                                    </td>
                                    <!-- Notiz -->
                                    <td>
                                        <xsl:value-of select="fhir:note/fhir:text/@value" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="reason-and-pill-container">
                            <div class="reason-section">
                                <xsl:if test="fhir:reasonCode">
                                    <span>
                                        <strong>Begründung</strong>
                                        <br/>
                                    </span>
                                    <xsl:if
                                test="fhir:reasonCode/fhir:coding">
                                        <span>
                                            <xsl:choose>
                                                <xsl:when
                                            test="fhir:reasonCode/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs']/fhir:code/@value = 'exhausted-range'">
                                                    <span>Reichweite erschöpft (Dauermedikation): </span>
                                                </xsl:when>
                                                <xsl:when
                                            test="fhir:reasonCode/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs']/fhir:code/@value = 'correction'">
                                                    <span>Korrektur: </span>
                                                </xsl:when>
                                                <xsl:when
                                            test="fhir:reasonCode/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs']/fhir:code/@value = 'vital-value-measurement'">
                                                    <span>nach Vitalwertmessung: </span>
                                                </xsl:when>
                                                <xsl:when
                                            test="fhir:reasonCode/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs']/fhir:code/@value = 'on-demand'">
                                                    <span>nach Bedarf: </span>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:for-each select="fhir:reasonCode/fhir:coding">
                                                <xsl:value-of select="/fhir:code/@value" />
                                            </xsl:for-each>
                                        </span>
                                    </xsl:if>
                                    <xsl:if
                                test="fhir:reasonCode/fhir:text">
                                        <span>
                                            <xsl:value-of select="fhir:reasonCode/fhir:text/@value" />
                                        </span>
                                    </xsl:if>
                                </xsl:if>
                            </div>
                            <div class="pill-container">
                                <xsl:if test="fhir:priority/@value = 'urgent'">
                                    <div class="urgent-pill">Dringend</div>
                                </xsl:if>
                                <xsl:if
                                test="fhir:modifierExtension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex']/fhir:valueBoolean/@value = 'true'">
                                    <div class="redeem-pill">Patienteneinlösung</div>
                                </xsl:if>
                                <xsl:if
                                test="fhir:modifierExtension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/changed-medication-ex']/fhir:valueBoolean/@value = 'true'">
                                    <div class="changed-pill">Verändertes Medikament</div>
                                </xsl:if>
                                <xsl:variable name="medReqRef"
                                select="fhir:basedOn/fhir:reference/@value" />
                                <div>
                                    <xsl:for-each
                                    select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
                                        <xsl:if
                                        test="fhir:modifierExtension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/request-mvo-ex']/fhir:valueBoolean/@value = 'true'">
                                            <div class="mvo-pill">MVO</div>
                                        </xsl:if>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </div>
                        <div class="token-section">
                            <!-- Token section below row if there is a note -->
                            <xsl:if
                            test="fhir:extension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex']">
                                <strong>E-Rezept Token: </strong>
                                <xsl:value-of
                                        select="fhir:extension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex']/fhir:valueIdentifier/fhir:value/@value" />
                            </xsl:if>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
    <xsl:template name="dispense-request-info">
        <xsl:param name="patientRef" />
        <xsl:param name="rootBundle" />
        <div class="dispense-request-info">
            <xsl:call-template
            name="sr-patient-info">
                <xsl:with-param name="patientRef" select="$patientRef" />
                <xsl:with-param name="rootBundle" select="$rootBundle" />
            </xsl:call-template>
            <!-- Template for displaying information about each ServiceRequest in the Bundle -->
            <div
            class="service-request">
                <xsl:for-each
                select="$rootBundle/fhir:entry/fhir:resource/fhir:ServiceRequest[fhir:subject/fhir:reference/@value = concat('Patient/', $patientRef)]">
                    <div class="service-request-box">
                        <div class="service-request-header">
                            <span>#
                                <xsl:value-of
                                select="fhir:identifier[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/sid/RequestIdentifier']/fhir:value/@value" />
                            </span>
                            <div class="pill-container">
                                <xsl:if test="fhir:priority/@value = 'urgent'">
                                    <div class="urgent-pill">dringend</div>
                                </xsl:if>
                                <xsl:if
                                test="fhir:modifierExtension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/redeem-by-patient-ex']/fhir:valueBoolean/@value = 'true'">
                                    <div class="redeem-pill">Patienteneinlösung</div>
                                </xsl:if>
                                <xsl:if
                                test="fhir:modifierExtension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/changed-medication-ex']/fhir:valueBoolean/@value = 'true'">
                                    <div class="changed-pill">Verändertes Arzneimittel</div>
                                </xsl:if>
                                <xsl:for-each
                                select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length(fhir:basedOn/fhir:reference/@value) + 1) = fhir:basedOn/fhir:reference/@value]/fhir:resource/fhir:MedicationRequest">
                                    <xsl:if
                                    test="fhir:modifierExtension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/request-mvo-ex']/fhir:valueBoolean/@value = 'true'">
                                        <div class="mvo-pill">MVO</div>
                                    </xsl:if>
                                </xsl:for-each>
                            </div>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Nr.</th>
                                    <th>E-Rezept-Token</th>
                                    <xsl:choose>
                                        <xsl:when
                                        test="fhir:code/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/delivery-type-cs']/fhir:code/@value = 'delivery-to-alternative-address'">
                                            <th>Lieferadresse</th>
                                        </xsl:when>
                                        <xsl:when
                                        test="fhir:code/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/delivery-type-cs']/fhir:code/@value">
                                            <th>Lieferung</th>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <th></th>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <xsl:value-of select="position()" />
                                    </td>
                                    <td>
                                        <xsl:value-of
                                        select="fhir:extension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex']/fhir:valueIdentifier/fhir:value/@value" />
                                    </td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when
                                            test="fhir:code/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/delivery-type-cs']/fhir:code/@value = 'pickup-by-healthcare-service'">
                                                <xsl:text>Abholung durch Pflegeeinrichtung</xsl:text>
                                            </xsl:when>
                                            <xsl:when
                                            test="fhir:code/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/delivery-type-cs']/fhir:code/@value = 'pickup-by-patient'">
                                                <xsl:text>Abholung durch Patient</xsl:text>
                                            </xsl:when>
                                            <xsl:when
                                            test="fhir:code/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/delivery-type-cs']/fhir:code/@value = 'delivery-to-healthcare-service'">
                                                <xsl:text>Lieferung an Pflegeeinrichtung</xsl:text>
                                            </xsl:when>
                                            <xsl:when
                                            test="fhir:code/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/delivery-type-cs']/fhir:code/@value = 'delivery-to-alternative-address'">
                                                <i>
                                                    <xsl:text>Lieferung an: </xsl:text>
                                                </i>
                                                <xsl:for-each
                                                select="fhir:extension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/alternative-delivery-address-ex']/fhir:valueAddress">
                                                    <xsl:for-each select="fhir:line">
                                                        <xsl:value-of select="@value" />
                                                        <br />
                                                    </xsl:for-each>
                                                    <xsl:value-of
                                                    select="fhir:city/@value" />,
                                                    <xsl:value-of
                                                    select="fhir:postalCode/@value" />
                                                    <xsl:value-of
                                                    select="fhir:country/@value" />
                                                </xsl:for-each>
                                            </xsl:when>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
    <xsl:template name="sr-patient-info">
        <xsl:param name="patientRef" />
        <xsl:param name="rootBundle" />
        <div class="sr-patient-info">
            <div class="patient-info">
                <span>Bezüglich: </span>
                <xsl:for-each
                select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($patientRef) + 1) = $patientRef]/fhir:resource/fhir:Patient">
                    <xsl:value-of select="fhir:name[fhir:use/@value='official']/fhir:family/@value" />
                    <span>
        , </span>
                    <xsl:value-of select="fhir:name[fhir:use/@value='official']/fhir:given/@value" />
                    <span>
        (KVNR: </span>
                    <xsl:value-of
                    select="fhir:identifier[fhir:system/@value='http://fhir.de/sid/gkv/kvid-10']/fhir:value/@value" />
                    <span>
        )</span>
                </xsl:for-each>
                <span>, geb. (</span>
                <xsl:variable name="birthDate" select="fhir:birthDate/@value" />
                <xsl:value-of
                select="concat(substring($birthDate, 9, 2), '.', substring($birthDate, 6, 2), '.', substring($birthDate, 1, 4))" />
                <span>)</span>
            </div>
            <div
        class="subject-date">
                <xsl:value-of
            select="concat(substring(/fhir:Bundle/fhir:timestamp/@value, 9, 2), '.', substring(/fhir:Bundle/fhir:timestamp/@value, 6, 2), '.', substring(/fhir:Bundle/fhir:timestamp/@value, 1, 4))" />
            </div>
        </div>
    </xsl:template>
    <xsl:template match="fhir:ingredient" mode="rezeptur">
        <li style="margin-left:2em;">
            <xsl:call-template name="getPossibleEmptyValue">
                <xsl:with-param name="path" select="fhir:itemCodeableConcept/fhir:text/@value" />
            </xsl:call-template>
            <xsl:call-template name="getPossibleEmptyValue">
                <xsl:with-param name="path" select="fhir:strength/fhir:numerator/fhir:value/@value" />
            </xsl:call-template>
            <xsl:call-template name="getPossibleEmptyValue">
                <xsl:with-param name="path" select="fhir:strength/fhir:numerator/fhir:unit/@value" />
            </xsl:call-template>
            <xsl:call-template name="getPossibleEmptyValue">
                <xsl:with-param name="path"
                    select="fhir:strength/fhir:extension[@url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Ingredient_Amount']/fhir:valueString/@value" />
            </xsl:call-template>
            <xsl:call-template name="getPossibleEmptyValue">
                <xsl:with-param name="path"
                    select="fhir:extension[@url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Ingredient_Form']/fhir:valueString/@value" />
            </xsl:call-template>
            <xsl:if test="fhir:itemCodeableConcept/fhir:coding/fhir:code/@value">
                <text>(PZN:&#160;</text>
                <xsl:value-of
                    select="fhir:itemCodeableConcept/fhir:coding/fhir:code/@value" />
                <text>)</text>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="fhir:ingredient" mode="wirkstoff">
        <xsl:if test="position()&gt;1">
            <text>&#32;+&#32;</text>
        </xsl:if>
        <xsl:call-template name="getPossibleEmptyValue">
            <xsl:with-param name="path" select="fhir:itemCodeableConcept/fhir:text/@value" />
        </xsl:call-template>
        <xsl:call-template
            name="getPossibleEmptyValue">
            <xsl:with-param name="path" select="fhir:strength/fhir:numerator/fhir:value/@value" />
        </xsl:call-template>
        <xsl:choose>
            <xsl:when test="not(fhir:itemCodeableConcept/fhir:coding/fhir:code/@value)">
                <xsl:value-of select="fhir:strength/fhir:numerator/fhir:unit/@value" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="getPossibleEmptyValue">
                    <xsl:with-param name="path"
                        select="fhir:strength/fhir:numerator/fhir:unit/@value" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if
            test="fhir:itemCodeableConcept/fhir:coding/fhir:code/@value">
            <text>ASK-Nr:&#160;</text>
            <xsl:value-of
                select="fhir:itemCodeableConcept/fhir:coding/fhir:code/@value" />
        </xsl:if>
    </xsl:template>
    <xsl:template name="medication-info">
        <xsl:param name="medicationRef" />
        <xsl:param name="rootBundle" />
        <xsl:for-each
            select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medicationRef) + 1) = $medicationRef]/fhir:resource/fhir:Medication">
            <xsl:choose>
                <xsl:when
                    test="fhir:code/fhir:coding/fhir:system[@value='http://fhir.de/CodeSystem/ifa/pzn']">
                    <p
                        class="daten" style="max-width: 50em;">
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path" select="fhir:code/fhir:text/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:form/fhir:coding/fhir:code/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:amount/fhir:numerator/fhir:extension[@url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize']/fhir:valueString/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:amount/fhir:numerator/fhir:unit/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:extension[@url='http://fhir.de/StructureDefinition/normgroesse']/fhir:valueCode/@value" />
                        </xsl:call-template>
                        <text>(PZN: </text>
                        <xsl:value-of select="fhir:code/fhir:coding/fhir:code/@value" />
                        <text>)</text>
                    </p>
                </xsl:when>
                <xsl:when
                    test="fhir:code/fhir:coding/fhir:system[@value='https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type']/following-sibling::fhir:code[@value='wirkstoff']">
                    <p
                        class="daten" style="max-width: 50em;">
                        <xsl:if test="count(fhir:ingredient)&gt;1">
                            <text>(</text>
                        </xsl:if>
                        <xsl:apply-templates select="fhir:ingredient" mode="wirkstoff" />
                        <xsl:if test="count(fhir:ingredient)&gt;1">
                            <text>)</text>
                        </xsl:if>
                        <text>&#160;</text>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path" select="fhir:form/fhir:text/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:amount/fhir:numerator/fhir:extension[@url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize']/fhir:valueString/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:amount/fhir:numerator/fhir:unit/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:extension[@url='http://fhir.de/StructureDefinition/normgroesse']/fhir:valueCode/@value" />
                        </xsl:call-template>
                    </p>
                </xsl:when>
                <xsl:when
                    test="fhir:code/fhir:coding/fhir:system[@value='https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type']/following-sibling::fhir:code[@value='freitext']">
                    <p
                        class="daten" style="max-width: 50em;">
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path" select="fhir:code/fhir:text/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path" select="fhir:form/fhir:text/@value" />
                        </xsl:call-template>
                    </p>
                </xsl:when>
                <xsl:when
                    test="fhir:code/fhir:coding/fhir:system[@value='https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Type']/following-sibling::fhir:code[@value='rezeptur']">
                    <p
                        class="daten kein_abstand" style="max-width: 50em;">
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path" select="fhir:code/fhir:text/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:amount/fhir:numerator/fhir:extension[@url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize']/fhir:valueString/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:amount/fhir:numerator/fhir:unit/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path" select="fhir:form/fhir:text/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:extension[@url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction']/fhir:valueString/@value" />
                        </xsl:call-template>
                        <xsl:call-template name="getPossibleEmptyValue">
                            <xsl:with-param name="path"
                                select="fhir:extension[@url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging']/fhir:valueString/@value" />
                        </xsl:call-template>
                    </p>
                    <ul
                        class="daten">
                        <xsl:apply-templates select="fhir:ingredient" mode="rezeptur" />
                    </ul>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="getPossibleEmptyValue">
        <xsl:param name="path" />
        <xsl:choose>
            <xsl:when test="$path">
                <xsl:value-of select="$path" />
                <text>&#160;</text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getIdFromReference">
        <xsl:param name="ref" />
        <xsl:choose>
            <xsl:when test="contains($ref,'/')">
                <xsl:call-template name="substring-after-last">
                    <xsl:with-param name="input" select="$ref" />
                    <xsl:with-param name="substr" select="'/'" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($ref,':')">
                <xsl:call-template name="substring-after-last">
                    <xsl:with-param name="input" select="$ref" />
                    <xsl:with-param name="substr" select="':'" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ref" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>