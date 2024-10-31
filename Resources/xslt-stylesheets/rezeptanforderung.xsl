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
                <style>
                    <style>
                        /* Enhanced styling for a more professional letter-like look optimized for A4 size */
                        @page {
                            size: A4 landscape;
                            margin: 20mm;
                        }
                        body {
                            font-family: 'Roboto', sans-serif;
                            line-height: 1.6;
                            background-color: #f9f9f9;
                            color: #333;
                            margin: 0;
                            padding: 0;
                        }
                        #gesamtseite {
                            width: 100%;
                            max-width: 1000px;
                            margin: 40px auto;
                            background: white;
                            padding: 20px;
                            border: 1px solid #ccc;
                            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                            position: relative;
                        }
                        .header-info {
                            margin-bottom: 30px;
                            font-size: 0.9em;
                            line-height: 1.4;
                        }
                        .header-info p {
                            margin: 0;
                        }
                        .receiver-info {
                            margin-bottom: 30px;
                        }
                        .receiver .name {
                            font-weight: bold;
                        }
                        .receiver .email {
                            font-weight: normal;
                        }
                        .clearfix::after {
                            content: "";
                            display: table;
                            clear: both;
                        }
                        .sr-patient-info {
                            font-style: italic;
                            margin-top: 10px;
                        }
                        table {
                            width: 100%;
                            border-collapse: collapse;
                            margin-top: 20px;
                            border: 1px solid #ccc;
                        }
                        th {
                            background-color: #f2f2f2;
                            padding: 10px;
                            border-bottom: 2px solid #ccc;
                            font-size: 0.9em;
                            text-align: left;
                            border-right: 1px solid #ccc;
                        }
                        td {
                            padding: 10px;
                            border-bottom: 1px solid #ddd;
                            font-size: 0.9em;
                            text-align: left;
                            border-right: 1px solid #ccc;
                        }
                        td:last-child, th:last-child {
                            border-right: none;
                        }
                        .subject-date {
                            text-align: right;
                            font-size: 0.9em;
                            color: #777;
                            margin-bottom: 20px;
                        }
                        .subject h2 {
                            font-size: 1.8em;
                            margin: 0;
                        }
                        .service-request {
                            margin-top: 20px;
                        }
                        .token-section {
                            margin-top: 15px;
                            font-style: italic;
                            color: #333;
                        }
                        .urgent-pill {
                            display: inline-block;
                            background-color: #ff4d4d;
                            color: white;
                            padding: 5px 10px;
                            border-radius: 12px;
                            font-size: 0.8em;
                            margin-right: 5px;
                        }
                        .mvo-pill {
                            display: inline-block;
                            background-color: #1e90ff;
                            color: white;
                            padding: 5px 10px;
                            border-radius: 12px;
                            font-size: 0.8em;
                            margin-right: 5px;
                        }
                        .redeem-pill {
                            display: inline-block;
                            background-color: #3cb371;
                            color: white;
                            padding: 5px 10px;
                            border-radius: 12px;
                            font-size: 0.8em;
                            margin-right: 5px;
                        }
                        .changed-pill {
                            display: inline-block;
                            background-color: #ffa500;
                            color: white;
                            padding: 5px 10px;
                            border-radius: 12px;
                            font-size: 0.8em;
                            margin-right: 5px;
                        }
                        .identifier-info {
                            display: block;
                            background-color: #e0e0e0;
                            color: #333;
                            padding: 5px;
                            border-radius: 5px;
                            font-size: 0.8em;
                            margin-top: 10px;
                            text-align: center;
                            font-weight: bold;
                        }
                        .service-request-box {
                            border: 1px solid #ccc;
                            padding: 15px;
                            margin-bottom: 20px;
                            background-color: #f9f9f9;
                            box-shadow: 0 0 5px rgba(0, 0, 0, 0.05);
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
                        .service-request-header .pill-container {
                            display: flex;
                            flex-wrap: wrap;
                            justify-content: flex-end;
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
                </style>
            </head>
            <body>
                <div id="gesamtseite">
                    <div class="clearfix">
                        <div class="header-info">
                        <div class="sender-info">
                            <xsl:call-template name="sender-info">
                                <xsl:with-param name="rootBundle" select="/fhir:Bundle" />
                            </xsl:call-template>
                        </div>
                        <div class="contact-info">
                            <xsl:call-template name="contact-info">
                                <xsl:with-param name="rootBundle" select="/fhir:Bundle" />
                            </xsl:call-template>
                        </div>
                    </div>
                </div>
                    <div class="receiver-info clear">
                        <xsl:call-template name="receiver-info">
                            <xsl:with-param name="rootBundle" select="/fhir:Bundle" />
                        </xsl:call-template>
                    </div>
                    <div class="letter-subject-info">
                        <xsl:call-template name="letter-subject-info">
                            <xsl:with-param name="rootBundle" select="$rootBundle" />
                        </xsl:call-template>
                    </div>
                    <!-- Loop through unique patient references in the rootBundle -->
                    <xsl:for-each select="$rootBundle/fhir:entry/fhir:resource/fhir:Patient">
                        <xsl:variable name="patientRef" select="fhir:id/@value" />
                        <xsl:choose>
                            <xsl:when test="$eventCode = 'eRezept_Rezeptanforderung;Abgabeanfrage'">
                                <div class="dispense-request-info">
                                    <xsl:call-template name="dispense-request-info">
                                        <xsl:with-param name="patientRef" select="$patientRef" />
                                        <xsl:with-param name="rootBundle" select="$rootBundle" />
                                    </xsl:call-template>
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="service-request-info">
                                    <xsl:call-template name="service-request-info">
                                        <xsl:with-param name="patientRef" select="$patientRef" />
                                        <xsl:with-param name="rootBundle" select="$rootBundle" />
                                    </xsl:call-template>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
    <!-- Adjust sender-info template to use rootBundle -->
    <xsl:template name="sender-info">
        <xsl:param name="rootBundle" />
        <!-- Find the MessageHeader in the rootBundle -->
        <xsl:for-each
            select="/fhir:Bundle/fhir:entry/fhir:resource/fhir:MessageHeader">
            <!-- Retrieve the responsible reference, which points to the Organization -->
            <xsl:variable
                name="respRef" select="fhir:responsible/fhir:reference" />
            <!-- Find the corresponding Organization by matching the reference -->
            <xsl:for-each
                select="/fhir:Bundle/fhir:entry[fhir:fullUrl = $respRef]">
                <xsl:for-each select="fhir:resource/fhir:Organization">
                    <div class="sender-info">
                        <!-- Output the organization's info -->
                        <p>
                        <strong><xsl:value-of select="fhir:name/@value" /></strong>
                        <br/>
                        <xsl:for-each select ="fhir:address/fhir:line">
                            <span>&#160;</span><xsl:value-of select="@value" />
                        </xsl:for-each>
                        <span>,&#160;</span>
                        <xsl:value-of select="fhir:address/fhir:postalCode/@value" />
                        <span>,&#160;</span>
                        <xsl:value-of select="fhir:address/fhir:city/@value" />
                    </p>
                    </div>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    <!-- Adjust contact-info template to use rootBundle -->
    <xsl:template name="contact-info">
        <xsl:param name="rootBundle" />
        <xsl:for-each
            select="$rootBundle/fhir:entry/fhir:resource/fhir:MessageHeader">
            <!-- Retrieve the responsible reference, which points to the Organization -->
            <xsl:variable
                name="respRef" select="fhir:responsible/fhir:reference" />
            <!-- Find the corresponding Organization by matching the reference -->
            <xsl:for-each
                select="$rootBundle/fhir:entry[fhir:fullUrl = $respRef]">
                <xsl:for-each select="fhir:resource/fhir:Organization">
                    <p>
                        <span>&#160;</span>Tel.: <xsl:value-of
                        select="fhir:contact/fhir:telecom[fhir:system/@value = 'phone']/fhir:value/@value" />
                    <br />
                    <span>&#160;</span>KIM: <xsl:value-of
                        select="fhir:contact/fhir:telecom[fhir:system/@value = 'email']/fhir:value/@value" />
                    </p>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    <!-- Adjust receiver-info template to use rootBundle -->
    <xsl:template name="receiver-info">
        <xsl:param name="rootBundle" />
        <!-- Find the MessageHeader in the rootBundle -->
        <xsl:for-each
            select="$rootBundle/fhir:entry/fhir:resource/fhir:MessageHeader">
            <!-- Retrieve the responsible reference, which points to the Organization -->
            <div class="header-info">
            <div class="receiver">
                <span class="name">
                    <xsl:value-of select="fhir:destination/fhir:name/@value" />
                </span>
                <br />
                <span class="email">
                    <span>&#160;</span>KIM: <xsl:value-of select="fhir:destination/fhir:endpoint/@value" />
                </span>
            </div>
        </div>
        </xsl:for-each>
    </xsl:template>
    <!-- Adjust letter-subject-info template to use rootBundle -->
    <xsl:template name="letter-subject-info">
        <xsl:param name="rootBundle" />
        <xsl:for-each
            select="/fhir:Bundle/fhir:entry/fhir:resource/fhir:MessageHeader">
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
            <div
                class="subject-date">
                <xsl:value-of
                    select="concat(substring(/fhir:Bundle/fhir:timestamp/@value, 9, 2), '.', substring(/fhir:Bundle/fhir:timestamp/@value, 6, 2), '.', substring(/fhir:Bundle/fhir:timestamp/@value, 1, 4))" />
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
    </xsl:template>
    <!-- Adjust service-request-info template to use rootBundle -->
    <xsl:template name="service-request-info">
        <xsl:param name="patientRef" />
        <xsl:param name="rootBundle" />
        <xsl:call-template
            name="sr-patient-info">
            <xsl:with-param name="patientRef" select="$patientRef" />
            <xsl:with-param name="rootBundle" select="$rootBundle" />
        </xsl:call-template>
        <!-- Template for displaying information about each ServiceRequest in the Bundle -->
        <div
            class="service-request">
            <xsl:variable name="patientFullRef" select="concat('Patient/', $patientRef)" />
            <xsl:for-each
                select="$rootBundle/fhir:entry/fhir:resource/fhir:ServiceRequest[fhir:subject/fhir:reference/@value = $patientFullRef]">
                <div class="service-request-box">
                    <div class="service-request-header">
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
                    <div class="reason-section">
                        <xsl:if test="fhir:reasonCode">
                            <span>
                                <strong>Begründung: </strong>
                            </span>
                            <xsl:if
                                test="fhir:reasonCode/fhir:coding">
                                <span>
                                    <xsl:choose>
                                        <xsl:when
                                            test="fhir:reasonCode/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs']/fhir:code/@value = 'exhausted-range'">
                                            <span>Reichweite erschöpft (Dauermedikation)</span>
                                        </xsl:when>
                                        <xsl:when
                                            test="fhir:reasonCode/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs']/fhir:code/@value = 'correction'">
                                            <span>Korrektur</span>
                                        </xsl:when>
                                        <xsl:when
                                            test="fhir:reasonCode/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs']/fhir:code/@value = 'vital-value-measurement'">
                                            <span>nach Vitalwertmessung</span>
                                        </xsl:when>
                                        <xsl:when
                                            test="fhir:reasonCode/fhir:coding[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/CodeSystem/medication-request-reason-cs']/fhir:code/@value = 'on-demand'">
                                            <span>nach Bedarf</span>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:for-each select="fhir:reasonCode/fhir:coding">
                                        <xsl:value-of select="/fhir:code/@value" />
                                    </xsl:for-each>
                                </span>
                            </xsl:if>
                            <xsl:if
                                test="fhir:reasonCode/fhir:text">
                                <span>:
                                    <xsl:value-of select="fhir:reasonCode/fhir:text/@value" />
                                </span>
                            </xsl:if>
                        </xsl:if>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Nr.</th>
                                <th>Artikel</th>
                                <th>Reichweite/ Bedarfszeitraum</th>
                                <th>Dosieranweisungen</th>
                                <th>Anzahl Packungen</th>
                                <th>Notiz</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <xsl:value-of select="position()" />
                                </td>
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
                                <td>
                                    <!-- Reichweite: reasonCode extension for remaining supply -->
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
                                        <span>/</span>
                                        <xsl:variable name="occurrenceDateTime"
                                            select="fhir:occurrenceDateTime/@value" />
                                        <xsl:value-of
                                            select="concat(substring($occurrenceDateTime, 9, 2), '.', substring($occurrenceDateTime, 6, 2), '.', substring($occurrenceDateTime, 1, 4))" />
                                    </xsl:if>
                                </td>
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
                                <td>
                                    <xsl:variable name="medReqRef"
                                        select="fhir:basedOn/fhir:reference/@value" />
                                    <xsl:for-each
                                        select="$rootBundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
                                        <xsl:value-of
                                            select="fhir:dispenseRequest/fhir:quantity/fhir:value/@value" />
                                        <span>
        &#160;</span>
                                        <xsl:value-of select="fhir:dispenseRequest/fhir:quantity/fhir:unit/@value" />
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:value-of select="fhir:note/fhir:text/@value" />
                                </td>
                            </tr>
                            <!-- Token section below row if there is a note -->
                            <xsl:if
                                test="fhir:extension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex']">
                                <tr class="token-section">
                                    <td colspan="5">
                                        <p>E-Rezept Token:</p>
                                        <xsl:value-of
                                            select="fhir:extension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex']/fhir:valueIdentifier/fhir:value/@value" />
                                    </td>
                                </tr>
                            </xsl:if>
                        </tbody>
                    </table>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template name="dispense-request-info">
        <xsl:param name="patientRef" />
        <xsl:param name="rootBundle" />
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
    </xsl:template>
    <xsl:template name="sr-patient-info">
        <xsl:param name="patientRef" />
        <xsl:param name="rootBundle" />
        <div class="sr-patient-info">
            <span>Bezüglich </span>
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