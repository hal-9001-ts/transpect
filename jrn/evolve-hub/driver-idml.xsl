<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:hub="http://transpect.io/hub" 
  xmlns:css="http://www.w3.org/1996/css"
  xmlns:dbk="http://docbook.org/ns/docbook" 
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:functx="http://www.functx.com"
  xmlns:ts="http://www.transcript-verlag.de/transpect"
  xmlns="http://docbook.org/ns/docbook" 
  xpath-default-namespace="http://docbook.org/ns/docbook"
  exclude-result-prefixes="xs hub dbk ts" 
  version="2.0">

  <xsl:import href="driver-docx.xsl"/>  
  <xsl:import href="http://this.transpect.io/a9s/ts/evolve-hub/driver-idml.xsl"/>  
  
  <xsl:template match="*:para[@role = 'Fuzeile']" mode="hub:split-at-tab"/>
  
  <xsl:template match="*:sidebar[*:para[starts-with(@role, 'tsmeta')]]" mode="hub:split-at-tab">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="#current"/>
      <xsl:attribute name="role" select="'article-metadata'"/>
      <xsl:apply-templates select="node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*:sidebar[@role = 'article-metadata']" mode="hub:reorder-marginal-notes">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="#current"/>
      <xsl:attribute name="role" select="'article-metadata'"/>
      <xsl:apply-templates select="node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>

    
</xsl:stylesheet>