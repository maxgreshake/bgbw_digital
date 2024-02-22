<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:mei="http://www.music-encoding.org/ns/mei"
    exclude-result-prefixes="xs math xd mei xd tei"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 14, 2024</xd:p>
            <xd:p><xd:b>Author:</xd:b> Maximilian Greshake</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output indent="yes" method="xml"/>
    
    <!-- Completing the bgbw_draft -->
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Remove redundant spaces in <p>, <salute>, <closer>, <signed> elements -->
    <xsl:template match="tei:p/text() | tei:salute/text() | tei:closer/text() | tei:signed/text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    <!-- Add the "type" and "resp" attribute to note <elements> -->
    <xsl:template match="tei:note">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="type">footnote</xsl:attribute>
            <xsl:attribute name="resp">Richard Barth</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Add the "writingSession" Attribute to <div> elements -->
    <xsl:template match="tei:div[not(@type)]">
        <xsl:copy>
            <xsl:attribute name="type">writingSession</xsl:attribute>
            <xsl:attribute name="n">1</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>