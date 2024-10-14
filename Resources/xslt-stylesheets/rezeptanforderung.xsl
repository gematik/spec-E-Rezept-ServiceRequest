<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir">

    <!-- Root template -->
    <xsl:template match="/">
        <xsl:apply-templates select="/fhir:Bundle" />
    </xsl:template>

    <!-- Master template for Bundle -->
    <xsl:template match="fhir:Bundle[not(ancestor::fhir:Bundle)]">
        <html>
            <head>
                <title>FHIR Message Bundle</title>
                <style>
                    /* Enhanced styling for a more professional letter-like look optimized for A4
        size */
                    @page {
                    size: A4;
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
                    max-width: 800px;
                    margin: 60px auto;
                    background: white;
                    padding: 20px;
                    border: 1px solid #ccc;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    position: relative;
                    }
                    .sender-info, .recipient-info, .subject-info, .service-request-info, .date-info
                    {
                    margin-bottom: 40px;
                    }
                    .contact-info {
                    margin-top: 10px;
                    float: left;
                    width: 50%;
                    position: relative;
                    }
                    .sender-info {
                    float: left;
                    width: 50%;
                    position: relative;
                    }
                    .receiver {
                    margin-bottom: 40px;
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
                    }
                    table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                    }
                    th {
                    background-color: #f2f2f2;
                    padding: 12px;
                    border-bottom: 2px solid #ccc;
                    }
                    td {
                    padding: 12px;
                    border-bottom: 1px solid #ddd;
                    }
                    th, td {
                    text-align: left;
                    }
                    .subject-date {
                    float: right;
                    text-align: right;
                    font-size: 0.9em;
                    color: #777;
                    }
                    .subject h1 {
                    font-size: 1.8em;
                    margin: 0;
                    }
                    .service-request {
                    margin-top: 40px;
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
                    padding: 2px 8px;
                    border-radius: 12px;
                    font-style: italic;
                    font-size: 0.9em;
                    margin-bottom: 1px;
                    position: relative;
                    top: -5px;
                    }
                    .mvo-pill {
                    display: inline-block;
                    background-color: #FFC759;
                    color: white;
                    padding: 2px 8px;
                    border-radius: 12px;
                    font-style: italic;
                    font-size: 0.9em;
                    margin-bottom: 1px;
                    position: relative;
                    top: -5px;
                    }
                    .redeem-pill {
                    display: inline-block;
                    background-color: #607196;
                    color: white;
                    padding: 2px 8px;
                    border-radius: 12px;
                    font-style: italic;
                    font-size: 0.9em;
                    margin-bottom: 1px;
                    position: relative;
                    top: -5px;
                    }
                    .changed-pill {
                    display: inline-block;
                    background-color: #ff4d4d;
                    color: white;
                    padding: 2px 8px;
                    border-radius: 12px;
                    font-style: italic;
                    font-size: 0.9em;
                    margin-bottom: 1px;
                    position: relative;
                    top: -5px;
                    }
                    .identifier-info {
                    display: block;
                    background-color: #e0e0e0;
                    color: #333;
                    padding: 5px;
                    border-radius: 5px;
                    font-size: 0.9em;
                    margin-top: 10px;
                    text-align: center;
                    font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <div id="gesamtseite">
                    <div class="clearfix">
                        <div class="sender-info">
                            <xsl:call-template name="sender-info" />
                        </div>
                        <div class="contact-info">
                            <xsl:call-template name="contact-info" />
                        </div>
                    </div>
                    <div class="receiver-info">
                        <xsl:call-template name="receiver-info" />
                    </div>
                    <div class="letter-subject-info">
                        <xsl:call-template name="letter-subject-info" />
                    </div>
                    <!-- Loop through unique patient references and call service-request-info with
                    patientRef -->

                    <xsl:for-each select="fhir:entry/fhir:resource/fhir:Patient">
                        <xsl:variable name="patientRef" select="fhir:id/@value" />
                                <xsl:choose>
                            <xsl:when
                                test="/fhir:Bundle/fhir:entry/fhir:resource/fhir:MessageHeader/fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Abgabeanfrage'">
                                <div class="dispense-request-info">
                                    <xsl:call-template name="dispense-request-info">
                                        <xsl:with-param name="patientRef" select="$patientRef" />
                                    </xsl:call-template>
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="service-request-info">
                                    <xsl:call-template name="service-request-info">
                                        <xsl:with-param name="patientRef" select="$patientRef" />
                                    </xsl:call-template>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="sender-info">
        <!-- Find the MessageHeader in the Bundle -->
        <xsl:for-each
            select="fhir:entry/fhir:resource/fhir:MessageHeader">
            <!-- Retrieve the responsible reference, which points to the Organization -->
            <xsl:variable name="respRef"
                select="fhir:responsible/fhir:reference" />
            <!-- Find the corresponding Organization by matching the reference -->
            <xsl:for-each
                select="/fhir:Bundle/fhir:entry[fhir:fullUrl = $respRef]">
                <xsl:for-each select="fhir:resource/fhir:Organization">
                    <div class="sender-info">
                        <!-- Output the organization's info -->
                        <xsl:value-of select="fhir:name/@value" />
                        <br />
                        <xsl:value-of select="fhir:address/fhir:line/@value" />
                        <br />
                        <xsl:value-of select="fhir:address/fhir:postalCode/@value" />
                        <span>&#160;</span>
                        <xsl:value-of select="fhir:address/fhir:city/@value" />
                    </div>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="contact-info">

        <xsl:for-each select="fhir:entry/fhir:resource/fhir:MessageHeader">
            <!-- Retrieve the responsible reference, which points to the Organization -->
            <xsl:variable
                name="respRef" select="fhir:responsible/fhir:reference" />
            <!-- Find the corresponding Organization by matching the reference -->
            <xsl:for-each
                select="/fhir:Bundle/fhir:entry[fhir:fullUrl = $respRef]">
                <xsl:for-each select="fhir:resource/fhir:Organization">
                    <!-- Assuming the phone number is located under telecom with system='phone' --> Tel.: <xsl:value-of
                        select="fhir:contact/fhir:telecom[fhir:system/@value = 'phone']/fhir:value/@value" />
            <br />
                    <!-- Assuming the KIM address is located under telecom with system='email' -->
        KIM: <xsl:value-of
                        select="fhir:contact/fhir:telecom[fhir:system/@value = 'email']/fhir:value/@value" />
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="receiver-info">
        <!-- Find the MessageHeader in the Bundle -->
        <xsl:for-each
            select="fhir:entry/fhir:resource/fhir:MessageHeader">
            <!-- Retrieve the responsible reference, which points to the Organization -->
            <div class="receiver">
                <span class="name">
                    <xsl:value-of select="fhir:destination/fhir:name/@value" />
                </span>
                <br />
                <span class="email">
                    <xsl:value-of select="fhir:destination/fhir:endpoint/@value" />
                </span>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="letter-subject-info">
        <!-- Find the MessageHeader in the Bundle -->
        <xsl:for-each
            select="fhir:entry/fhir:resource/fhir:MessageHeader">
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
                            <xsl:text>Kopie einer Rezept- oder Abgabeanforderung</xsl:text>
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
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="service-request-info">
        <xsl:param name="patientRef" />
        <div class="sr-patient-info">
            <span>Bezüglich </span>
            <xsl:for-each
                select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($patientRef) + 1) = $patientRef]/fhir:resource/fhir:Patient">
                <xsl:value-of
                    select="fhir:name[fhir:use/@value='official']/fhir:family/@value" />
                                    <span>, </span>
                                    <xsl:value-of
                    select="fhir:name[fhir:use/@value='official']/fhir:given/@value" />
            </xsl:for-each>
            <span>, geb. (</span>
            <xsl:variable name="birthDate" select="fhir:birthDate/@value" />
            <xsl:value-of
                select="concat(substring($birthDate, 9, 2), '.', substring($birthDate, 6, 2), '.', substring($birthDate, 1, 4))" />
            <span>)</span>
        </div>
        <!-- Template for displaying information about each ServiceRequest in the Bundle -->
        <div class="service-request">
            <table>
                <thead>
                    <tr>
                        <th>Artikel</th>
                        <th>DAR</th>
                        <th>Reichweite/ Bedarfszeitraum</th>
                        <th>Bedarf</th>
                        <th>Notiz</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each
                        select="/fhir:Bundle/fhir:entry/fhir:resource/fhir:ServiceRequest[fhir:subject/fhir:reference/@value = concat('Patient/', $patientRef)]">
                        <tr>
                            <td>
                                <xsl:variable name="medReqRef"
                                    select="fhir:basedOn/fhir:reference/@value" />
                                <!-- Display "dringend" pill if priority is urgent -->
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
                                <div>
                                    <xsl:for-each
                                        select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
                                        <xsl:if
                                            test="fhir:modifierExtension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/request-mvo-ex']/fhir:valueBoolean/@value = 'true'">
                                            <div class="mvo-pill">MVO</div>
                                        </xsl:if>
                                        <xsl:variable
                                            name="medicationRef"
                                            select="fhir:medicationReference/fhir:reference/@value" />
                                        <xsl:for-each
                                            select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medicationRef) + 1) = $medicationRef]/fhir:resource/fhir:Medication">
                                            <xsl:value-of select="fhir:code/fhir:text/@value" />
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </div>
                            </td>
                            <td>
                                <xsl:variable name="medReqRef"
                                    select="fhir:basedOn/fhir:reference/@value" />
                                <xsl:for-each
                                    select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
                                    <xsl:variable name="medicationRef"
                                        select="fhir:medicationReference/fhir:reference/@value" />
                                    <xsl:for-each
                                        select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medicationRef) + 1) = $medicationRef]/fhir:resource/fhir:Medication">
                                        <xsl:value-of
                                            select="fhir:form/fhir:coding/fhir:code/@value" />
                                    </xsl:for-each>
                                </xsl:for-each>
                            </td>
                            <td>
                                <!-- Reichweite: reasonCode extension for remaining supply -->
                                <xsl:for-each select="fhir:reasonCode/fhir:extension">
                                    <xsl:choose>
                                        <xsl:when
                                            test="@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/remaining-supply-ex'">
                                            <xsl:value-of
                                                select="concat(fhir:value/@value, ' ', fhir:value/fhir:unit/@value)" />
                                        </xsl:when>
                                        <xsl:when
                                            test="@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/remaining-supply-free-text-ex'">
                                            <xsl:value-of select="fhir:valueString/@value" />
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                                <xsl:if test="fhir:occurrenceDateTime">
                                    <span>(</span>
    <xsl:variable name="occurrenceDateTime"
                                        select="fhir:occurrenceDateTime/@value" />
    <xsl:value-of
                                        select="concat(substring($occurrenceDateTime, 9, 2), '.', substring($occurrenceDateTime, 6, 2), '.', substring($occurrenceDateTime, 1, 4))" />
    <span>
        )</span>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:variable name="medReqRef"
                                    select="fhir:basedOn/fhir:reference/@value" />
                                <xsl:for-each
                                    select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
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
                         <!-- Identifier section below row if identifier with specific system is present -->
                        <xsl:for-each select="fhir:identifier[fhir:system/@value = 'https://gematik.de/fhir/erp-servicerequest/sid/RequestIdentifier']">
                            <tr>
                                <td colspan="5" class="identifier-info">
                                    <xsl:text>Anfragenummer: </xsl:text>
                                    <xsl:value-of select="fhir:value/@value" />
                                </td>
                            </tr>
                        </xsl:for-each>
                        <!-- Token section below row if there is a note -->
                       <xsl:if
                            test="fhir:extension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex']">

                            <tr class="token-section">
                                <td colspan="5">
                                    <xsl:value-of
                                        select="fhir:extension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex']/fhir:valueIdentifier/fhir:value/@value" />
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>

    <xsl:template name="dispense-request-info">
        <xsl:param name="patientRef" />
        <div class="sr-patient-info">
            <span>Bezüglich </span>
            <xsl:for-each
                select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($patientRef) + 1) = $patientRef]/fhir:resource/fhir:Patient">
                <xsl:value-of
                    select="fhir:name[fhir:use/@value='official']/fhir:family/@value" />
                                    <span>, </span>
                                    <xsl:value-of
                    select="fhir:name[fhir:use/@value='official']/fhir:given/@value" />
            </xsl:for-each>
            <span>, geb. (</span>
            <xsl:variable name="birthDate" select="fhir:birthDate/@value" />
            <xsl:value-of
                select="concat(substring($birthDate, 9, 2), '.', substring($birthDate, 6, 2), '.', substring($birthDate, 1, 4))" />
            <span>)</span>
        </div>
        <!-- Template for displaying information about each ServiceRequest in the Bundle -->
        <div class="service-request">
            <table>
                <thead>
                    <tr>
                        <th>Nr.</th>
                        <th>E-Rezept-Token</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each
                        select="/fhir:Bundle/fhir:entry/fhir:resource/fhir:ServiceRequest[fhir:subject/fhir:reference/@value = concat('Patient/', $patientRef)]">
                        <tr>
                            <td>
                                <xsl:value-of select="position()" />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="fhir:extension[@url = 'https://gematik.de/fhir/erp-servicerequest/StructureDefinition/eprescription-token-ex']/fhir:valueIdentifier/fhir:value/@value" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>

</xsl:stylesheet>