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
                    /* Basic styling to match the image */
                    body { font-family: Arial, sans-serif; }
                    .sender-info, .recipient-info, .subject-info, .date-info { margin-bottom: 20px;
                    }
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    .subject-date { float: right; text-align: right; }
                </style>
            </head>
            <body>
                <div id="gesamtseite">

                    <div class="sender-info">
                        <xsl:call-template name="sender-info" />
                    </div>

                    <div class="receiver-info">
                        <xsl:call-template name="receiver-info" />
                    </div>

                    <div class="letter-subject-info">
                        <xsl:call-template name="letter-subject-info" />
                    </div>
                    <!-- Template reference for each ServiceRequest Resource in the Bundle -->
                    <xsl:for-each select="fhir:entry/fhir:resource/fhir:ServiceRequest">
                        <div class="service-request-info">
                            <xsl:call-template name="service-request-info" />
                        </div>
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
                    <div class="sender">
                        <!-- Output the organization's info -->
                        <xsl:value-of select="fhir:name/@value" />
                        <br />
                        <xsl:value-of select="fhir:address/fhir:line/@value" />
                        <br />
                        <xsl:value-of select="fhir:address/fhir:postalCode/@value" />
                        <span>&#160;</span>
                        <xsl:value-of select="fhir:address/fhir:city/@value" />
                    </div>
                <div
                        class="contact-info" style="float: right; text-align: right;">
                        <!-- Assuming the phone number is located under telecom with system='phone' --> Tel.: <xsl:value-of
                            select="fhir:contact/fhir:telecom[fhir:system/@value = 'phone']/fhir:value/@value" />
                    <br />
                        <!-- Assuming the KIM address is located under telecom with system='email' -->
        KIM: <xsl:value-of
                            select="fhir:contact/fhir:telecom[fhir:system/@value = 'email']/fhir:value/@value" />
                    </div>
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
                <xsl:value-of select="fhir:destination/fhir:name/@value" />
            </div>
        </xsl:for-each>
    </xsl:template>


    <xsl:template name="letter-subject-info">
        <!-- Find the MessageHeader in the Bundle -->
    <xsl:for-each
            select="fhir:entry/fhir:resource/fhir:MessageHeader">
            <div class="subject">
                <xsl:choose>
                    <!-- Specific codes and corresponding subject values -->
                    <xsl:when
                        test="fhir:eventCoding/fhir:code/@value = 'eRezept_Rezeptanforderung;Rezeptanfrage'">
                        <xsl:text>Anfrage zur Ausstellung eines E-Rezepts</xsl:text>
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
            </div>
        <div
                class="subject-date">
                <xsl:value-of
                    select="concat(substring(/fhir:Bundle/fhir:timestamp/@value, 9, 2), '.', substring(/fhir:Bundle/fhir:timestamp/@value, 6, 2), '.', substring(/fhir:Bundle/fhir:timestamp/@value, 1, 4))" />
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="service-request-info">
        <!-- Template for displaying information about each ServiceRequest in the Bundle -->
        <div class="service-request">
            <table>
                <thead>
                    <tr>
                        <th>Nr.</th>
                        <th>Kunde</th>
                        <th>Geb.Dat</th>
                        <th>Artikel</th>
                        <th>DAR</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="/fhir:Bundle/fhir:entry/fhir:resource/fhir:ServiceRequest">
                        <xsl:variable name="patientRef" select="fhir:subject/fhir:reference/@value" />
                        <tr>
                            <td><xsl:value-of select="position()" /></td>
                            <td>
                                <xsl:for-each select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($patientRef) + 1) = $patientRef]/fhir:resource/fhir:Patient">
                                    <xsl:value-of select="fhir:name[fhir:use/@value='official']/fhir:family/@value" />
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:for-each select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($patientRef) + 1) = $patientRef]/fhir:resource/fhir:Patient">
                                    <xsl:value-of select="fhir:birthDate/@value" />
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:variable name="medReqRef" select="fhir:basedOn/fhir:reference/@value" />
                                <xsl:for-each select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medReqRef) + 1) = $medReqRef]/fhir:resource/fhir:MedicationRequest">
                                    <xsl:for-each select="fhir:medicationReference/fhir:reference/@value">
                                        <xsl:variable name="medicationRef" select="." />
                                        <xsl:for-each select="/fhir:Bundle/fhir:entry[substring(fhir:fullUrl/@value, string-length(fhir:fullUrl/@value) - string-length($medicationRef) + 1) = $medicationRef]/fhir:resource/fhir:Medication">
                                            <xsl:value-of select="fhir:code/fhir:text/@value" />
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </td>
                          
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>

</xsl:stylesheet>