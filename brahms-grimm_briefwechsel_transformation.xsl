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
            <xd:p><xd:b>Created on:</xd:b> Okt 04, 2023</xd:p>
            <xd:p><xd:b>Author:</xd:b> Maximilian Greshake</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output indent="yes" method="xml"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Löscht die <zone>-Elemente -->
    <xsl:template match="tei:zone"/>
    
    <!-- Löscht die xml:ids aus den <pb>-Elementen -->
    <xsl:template match="tei:pb/@xml:id"/>
    
    <!-- Löscht die <p>-Element-Tags -->
    <xsl:template match="tei:p">
        <xsl:apply-templates/> 
    </xsl:template>
    
    <!-- Löscht die <lg>-Element-Tags -->
    <xsl:template match="tei:lg">
        <xsl:apply-templates/> 
    </xsl:template>
    
    <!-- Löscht die <l>-Element-Tags -->
    <xsl:template match="tei:l">
        <xsl:value-of select="."/> 
    </xsl:template>
        
</xsl:stylesheet>