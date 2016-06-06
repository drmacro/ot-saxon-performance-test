<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0">
  <!-- ==============================================
       XSLT to run the topicpull transform over
       a set of files in order to generate more
       Java profiling data.
       ============================================== -->
  
  <xsl:import href="preprocess/topicpull.xsl"/>
  
  <xsl:param name="inputDir" as="xs:string"
    select="string-join(tokenize(document-uri(.), '/')[position() lt last()], '/')"
  />
  <xsl:param name="outDir" as="xs:string"
    select="string-join((tokenize(document-uri(.), '/')[position() lt (last() - 3)], 'output'), '/')"
  />
  
  <xsl:template name="run">
    <xsl:variable name="inputURI" as="xs:string"
      select="concat($inputDir, '?', 'select=*.dita*')"
    />
    <xsl:for-each select="collection($inputURI)">
      <xsl:variable name="filename" as="xs:string"
        select="tokenize(string(document-uri(.)), '/')[last()]"
      />
      <xsl:variable name="resultUri" as="xs:string"
        select="string-join(($outDir, $filename), '/')"
      />
      <xsl:result-document href="{$resultUri}">
        <xsl:apply-templates select="."/>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>