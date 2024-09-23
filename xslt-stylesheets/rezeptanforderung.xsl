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
                </style>
            </head>
            <body>
                <div id="gesamtseite">
                    <h1>
                        <xsl:value-of select="fhir:entry/fhir:resource/fhir:MessageHeader/fhir:eventCoding/fhir:display/@value"/>
                    </h1>
                    
                        <div class="sender-info">
                            <xsl:call-template name="sender-info"/>
                        </div>

                        <div class="receiver-info">
                            <xsl:call-template name="receiver-info"/>
                        </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="sender-info">
        <!-- Find the MessageHeader in the Bundle -->
        <xsl:for-each select="fhir:entry/fhir:resource/fhir:MessageHeader">
            <!-- Retrieve the responsible reference, which points to the Organization -->
            <xsl:variable name="respRef" select="fhir:responsible/fhir:reference"/>
            <!-- Find the corresponding Organization by matching the reference -->
            <xsl:for-each select="/fhir:Bundle/fhir:entry[fhir:fullUrl = $respRef]">
                <xsl:for-each select="fhir:resource/fhir:Organization">
                    <div class="sender">
                        <!-- Output the organization's info -->
                        <xsl:value-of select="fhir:name/@value"/>
                        <br/>
                        <xsl:value-of select="fhir:address/fhir:line/@value"/>
                        <br/>
                        <xsl:value-of select="fhir:address/fhir:postalCode/@value"/>
                        <xsl:value-of select="fhir:address/fhir:city/@value"/>
                    </div>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="receiver-info">
        <!-- Find the MessageHeader in the Bundle -->
        <xsl:for-each select="fhir:entry/fhir:resource/fhir:MessageHeader">
            <!-- Retrieve the responsible reference, which points to the Organization -->
            <xsl:variable name="receiverRef" select="fhir:destination/fhir:receiver/fhir:reference"/>
            <p>hello</p>
            <!-- Find the corresponding Organization by matching the reference -->
            <xsl:for-each select="/fhir:Bundle/fhir:entry[fhir:fullUrl = $receiverRef]">
                <xsl:for-each select="fhir:resource/fhir:Organization">
                    <div class="receiver">
                        <p>hello</p>
                        <!-- Output the organization's info -->
                        <xsl:value-of select="fhir:name/@value"/>
                        <br/>
                        <xsl:value-of select="fhir:address/fhir:line/@value"/>
                        <br/>
                        <xsl:value-of select="fhir:address/fhir:postalCode/@value"/>
                        <xsl:value-of select="fhir:address/fhir:city/@value"/>
                    </div>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
  


    

</xsl:stylesheet>